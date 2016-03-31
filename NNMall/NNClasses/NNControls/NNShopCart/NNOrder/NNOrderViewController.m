//
//  NNOrderViewController.m
//  NNMall
//
//  Created by shaoxu on 15/11/12.
//  Copyright © 2015年 shaoxu. All rights reserved.
//

#import "NNOrderViewController.h"
#import "NNOrderView.h"
#import "NNOrderApply.h"
#import "NNMallPayViewController.h"
#import "NNFastListViewController.h"
#import "NNAdreessViewController.h"
#import "NNUserApply.h"

@interface NNOrderViewController ()<NNOrderDelegate>
{
    NNOrderView *m_orderView;
    NSMutableArray *m_fastArray;
}
@property (nonatomic,strong) IBOutlet NNOrderView *p_orderView;
@property (nonatomic,strong) NSMutableArray *p_fastArray;
@end

@implementation NNOrderViewController
@synthesize p_orderModel = m_orderModel;
@synthesize p_orderView = m_orderView;
@synthesize p_fastArray = m_fastArray;

-(void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    m_orderView.p_orderDelegate = self;
    [m_orderView refreshOrderData:m_orderModel];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(reloadOrderView:) name:@"ChooseFast" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(reloadOrderView:) name:@"ChooseAddress" object:nil];
//    [self autoGetDefaultAddress];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)reloadOrderView:(NSNotification *)noti
{
    [m_orderView refreshOrderData:m_orderModel];
}

-(void)autoGetDefaultAddress
{
    [SVProgressHUD show];
    [[NNUserApply shareInstanceManager] getDefaultAddress:^(id content) {
        [SVProgressHUD dismiss];
        m_orderModel.m_shipAddModel = (AdreessModel *)content;
        [m_orderView refreshOrderData:m_orderModel];
    } andFaildReturn:^(NNErrorModel *errorM) {
        [SVProgressHUD dismiss];
    }];
}

#pragma mark - NNOrderDelegate
-(void)submitOrder:(id)sender
{
    NSMutableArray *idArr = [[NSMutableArray alloc]init];
    for (ProductModel *productM in m_orderModel.m_orderProArray) {
        [idArr addObject:productM.m_productId];
    }
    NSString *productIds = [idArr componentsJoinedByString:@","];
    
    if (m_orderModel.m_orderFM.m_fastId.length == 0) {
        [SVProgressHUD showInfoWithStatus:@"请选择配送方式" maskType:SVProgressHUDMaskTypeClear];
        return;
    }
    if (!m_orderModel.m_shipAddModel) {
        [SVProgressHUD showInfoWithStatus:@"请选择配送地址" maskType:SVProgressHUDMaskTypeClear];
        return;
    }
    
    [[NNOrderApply shareInstanceManager] requestSubmitOrder:m_orderModel.m_shipAddModel.m_addressId andProdcutIds:productIds andExpressCode:m_orderModel.m_orderFM.m_fastId andRequirement:@"" andSucReturn:^(id content) {
        m_orderModel.m_orderId = (NSString *)content;
        [[NSNotificationCenter defaultCenter] postNotificationName:@"SubmitSuccess" object:nil];
        [self performSegueWithIdentifier:@"SubmitFromOrderSegue" sender:m_orderModel];
    } andFaildReturn:^(NNErrorModel *errorM) {
        [SVProgressHUD showErrorWithStatus:errorM.m_message maskType:SVProgressHUDMaskTypeClear];
    }];
}

-(void)orderSelectRowAt:(NSInteger)index
{
    switch (index) {
        case 0:{
            //连接到我的地址
            [self performSegueWithIdentifier:@"ShippingAddressSegue" sender:nil];
            break;
        }
        case 20:{
            //我的快递
            if (!self.p_fastArray) {
                [self getFast];
            }
            else{
                if (m_fastArray.count>0) {
                    [self performSegueWithIdentifier:@"FastFromOrderSegue" sender:nil];
                }
                else{
                    [self getFast];
                }
            }
            break;
        }
        default:
            break;
    }
}

-(void)getFast
{
    [SVProgressHUD showWithStatus:@"正在获取配送方式" maskType:SVProgressHUDMaskTypeClear];
    [[NNOrderApply shareInstanceManager] requestOrderFast:^(id content) {
        [SVProgressHUD dismiss];
        self.p_fastArray = (NSMutableArray *)content;
        [self performSegueWithIdentifier:@"FastFromOrderSegue" sender:nil];
    } andFaildReturn:^(NNErrorModel *errorM) {
        [SVProgressHUD showErrorWithStatus:errorM.m_message maskType:SVProgressHUDMaskTypeClear];
    }];

}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    if([segue.identifier isEqualToString:@"ShippingAddressSegue"])
    {
        NNAdreessViewController *addressVC = segue.destinationViewController;
        addressVC.p_isFromSelect = YES;
        addressVC.p_orderM = m_orderModel;
    }
    if([segue.identifier isEqualToString:@"SubmitFromOrderSegue"])
    {
        OrderModel *orderM = (OrderModel *)sender;
        NNMallPayViewController *mallPayVC = segue.destinationViewController;
        mallPayVC.p_payOrderM = orderM;
        mallPayVC.p_payFrom = submitOrder;
    }
    if([segue.identifier isEqualToString:@"FastFromOrderSegue"])
    {
        NNFastListViewController *fastVC = segue.destinationViewController;
        fastVC.p_fastOM = m_orderModel;
        fastVC.p_fastListArray = m_fastArray;
    }
}

@end
