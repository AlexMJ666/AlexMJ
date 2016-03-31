//
//  NNShopCartViewController.m
//  NNMall
//
//  Created by shaoxu on 15/11/3.
//  Copyright © 2015年 shaoxu. All rights reserved.
//

#import "NNShopCartViewController.h"
#import "NNShopCartView.h"
#import "NNProductInfoViewController.h"
#import "NNOrderViewController.h"
#import "NNProductApply.h"
#import "ProductModel.h"
#import "OrderModel.h"
#import "NNSizeView.h"
@interface NNShopCartViewController ()<NNShopCartDelegate,NNSizeDelegate>
{
    NNShopCartView *m_nnShopCartView;
    BOOL    m_isEditing;
    NSMutableArray *m_shopArray;
    NNSizeView *m_sizeView;
    UIBarButtonItem *m_editBar;
}
@property (nonatomic,strong) IBOutlet NNShopCartView *p_nnShopCartView;
@property (nonatomic,assign) BOOL    p_isEditing;
@property (nonatomic,strong) NSMutableArray *p_shopArray;
@property (nonatomic,strong) NNSizeView *p_sizeView;
@property (nonatomic,strong) UIBarButtonItem *p_editBar;
@end

@implementation NNShopCartViewController
@synthesize p_nnShopCartView = m_nnShopCartView;
@synthesize p_isEditing = m_isEditing;
@synthesize p_shopArray = m_shopArray;
@synthesize p_sizeView = m_sizeView;
@synthesize p_editBar = m_editBar;

-(void)dealloc
{
    [[NSNotificationCenter defaultCenter]removeObserver:self];
}

-(void)loadView
{
    [super loadView];
//    self.p_editBar = [[UIBarButtonItem alloc]initWithTitle:@"编辑" style:UIBarButtonItemStylePlain target:self action:@selector(editModelClick:)];
//    m_editBar.tintColor = [UIColor whiteColor];
    UIBarButtonItem *backBar = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"back-w.png"] style:UIBarButtonItemStylePlain target:self action:@selector(backToProduct:)];
    backBar.imageInsets = UIEdgeInsetsMake(3, 0, 3, 6);
    backBar.tintColor = [UIColor whiteColor];
    if (self.tabBarController.selectedIndex != 2) {
        self.navigationItem.leftBarButtonItem = backBar;
    }
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    m_nnShopCartView.p_nnShopCartDelegate = self;
    [m_nnShopCartView layoutShopCartView];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(queryShoppingCartList) name:@"AddToShippingCartSuc" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(queryShoppingCartList) name:@"SubmitSuccess" object:nil];
}

-(void)backToProduct:(id)sender
{
    
    [self dismissViewControllerAnimated:YES completion:^{
        self.navigationItem.leftBarButtonItem = nil;
    }];
}

-(void)showFromProduct:(NSNotification *)noti
{
    UIBarButtonItem *backBar = [[UIBarButtonItem alloc]initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:self action:@selector(backToProduct:)];
    backBar.tintColor = [UIColor whiteColor];
    self.navigationItem.leftBarButtonItem = backBar;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)queryShoppingCartList
{
    [[NNProductApply shareInstanceManager] requestShoppingCartList:nil andSucReturn:^(id content) {
        self.p_shopArray = (NSMutableArray *)content;
        [m_nnShopCartView refrshShoppingCartData:m_shopArray andLike:nil];
    } andFaildReturn:^(NNErrorModel *errorM) {
        self.navigationItem.rightBarButtonItem = nil;
    }];
}

-(IBAction)editModelClick:(id)sender
{
    UIBarButtonItem *bar = (UIBarButtonItem *)sender;
    m_isEditing = !m_isEditing;
    if (m_isEditing) {
        bar.title = @"完成";
    }else{
        bar.title = @"编辑";
    }
    [m_nnShopCartView editModel:m_isEditing];
}

#pragma mark - NNSizeDelegate
-(void)chooseProductSize:(ProductModel *)productM
{
    [UIView animateWithDuration:0.2f animations:^{
        m_sizeView.alpha = 0.0f;
    } completion:^(BOOL finished) {
        [self.p_sizeView removeFromSuperview];
        self.p_sizeView = nil;
    }];
    //2.刷新主视图
    [m_nnShopCartView refrshShoppingCartData:m_shopArray andLike:nil];
}

-(void)hideSize:(id)sender
{
    [UIView animateWithDuration:0.2f animations:^{
        m_sizeView.alpha = 0.0f;
    } completion:^(BOOL finished) {
        [self.p_sizeView removeFromSuperview];
        self.p_sizeView = nil;
    }];
}

#pragma mark - NNShopCartDelegate
-(void)selectProduct:(ProductModel *)productM
{
    if (m_isEditing) {
        if (!self.p_sizeView) {
            self.p_sizeView = [[NNSizeView alloc]initWithFrame:self.view.bounds];
            m_sizeView.p_nnSizeDelegate = self;
            m_sizeView.alpha = 0.0f;
            m_sizeView.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.2f];
            [self.view addSubview:m_sizeView];
        }
        [m_sizeView refreshSizeData:productM];
        [UIView animateWithDuration:0.2f animations:^{
            m_sizeView.alpha = 1.0f;
        } completion:^(BOOL finished) {
            
        }];
    }
    else{
        [self performSegueWithIdentifier:@"ProductFormCartSegue" sender:productM];
    }
}

-(void)deleteProduct:(ProductModel *)productM
{
    //TODO 删除商品
}

-(void)gotoOrder:(OrderModel *)orderM
{
    if (m_isEditing) {
        //TODO 删除购物车商品刷新视图
    }
    else{
        [self performSegueWithIdentifier:@"OrderFromCartSegue" sender:orderM];
    }
}

-(void)gotoLoginView:(id)sender
{
    [self performSegueWithIdentifier:@"LoginFromShipSegue" sender:nil];
}

-(void)reloadShoppingCartData:(CartSuccessBlock)subBlock_ andFailed:(CartFailedBlock)failedBlock_
{
    [[NNProductApply shareInstanceManager] requestShoppingCartList:nil andSucReturn:^(id content) {
        self.p_shopArray = (NSMutableArray *)content;
        if (m_shopArray.count>0) {
            self.navigationItem.rightBarButtonItem = m_editBar;
        }
        else{
            self.navigationItem.rightBarButtonItem = nil;
        }
        subBlock_(m_shopArray);
    } andFaildReturn:^(NNErrorModel *errorM) {
        self.navigationItem.rightBarButtonItem = nil;
        failedBlock_(nil);
    }];
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    if([segue.identifier isEqualToString:@"ProductFormCartSegue"])
    {
        ProductModel *productM = (ProductModel *)sender;
        NNProductInfoViewController *productInfoVC = segue.destinationViewController;
        productInfoVC.p_productModel = productM;
        productInfoVC.p_isFromProduct = NO;
    }
    if([segue.identifier isEqualToString:@"OrderFromCartSegue"])
    {
        OrderModel *orderM = (OrderModel *)sender;
        NNOrderViewController *orderVC = segue.destinationViewController;
        orderVC.p_orderModel = orderM;
    }
}

@end
