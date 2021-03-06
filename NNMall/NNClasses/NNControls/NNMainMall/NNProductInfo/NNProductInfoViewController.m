//
//  NNProductInfoViewController.m
//  NNMall
//
//  Created by shaoxu on 15/11/5.
//  Copyright © 2015年 shaoxu. All rights reserved.
//

#import "NNProductInfoViewController.h"
#import "NNProductInfoView.h"
#import "NNCartView.h"
#import "NNProductApply.h"
#import "NNCommentApply.h"
#import "NNSizeView.h"
#import "NNCommentViewController.h"
@interface NNProductInfoViewController ()<NNProductInfoDelegate,NNSizeDelegate,NNCartDelegate>
{
    NNProductInfoView *m_nnProductInfoView;
    NNCartView        *m_cartView;
    NNSizeView        *m_sizeView;
}
@property (nonatomic,strong) IBOutlet NNProductInfoView *p_nnProductInfoView;
@property (nonatomic,strong) NNCartView        *p_cartView;
@property (nonatomic,strong) NNSizeView        *p_sizeView;
@end

@implementation NNProductInfoViewController
@synthesize p_nnProductInfoView = m_nnProductInfoView;
@synthesize p_cartView = m_cartView;
@synthesize p_sizeView = m_sizeView;
@synthesize p_productModel = m_productModel;
@synthesize p_isFromProduct = m_isFromProduct;

-(void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    m_nnProductInfoView.p_nnProductInfoDelegate = self;
    [m_nnProductInfoView initProduct];
    [m_nnProductInfoView refreshProductInfoData:m_productModel];
    self.p_cartView = [[NNCartView alloc]initWithFrame:CGRectMake(0, kNAV_HEIGHT-50, kMainScreen_Width, 50)];
    m_cartView.p_nnCartDelegate = self;
    m_cartView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:m_cartView];
    [self.view bringSubviewToFront:m_cartView];
    [self queryProductInfo];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)gotoShippingcart:(id)sender
{
    if (m_isFromProduct) {
        [self performSegueWithIdentifier:@"ShipFormProductSegue" sender:nil];
    }
    else{
        [self.navigationController popViewControllerAnimated:YES];
    }
}

-(BOOL)judgeSize:(NSString *)key
{
    BOOL ishave = NO;
    for (NSString *keys in m_productModel.m_sizeDictionary) {
        if ([keys isEqualToString:key]) {
            ishave = YES;
        }
    }
    return ishave;
}

-(void)addProductToShoppingCart:(id)sender
{
    //加入购物车接口
    if (m_productModel.m_currentColor.length == 0 && [self judgeSize:@"color"]) {
        [SVProgressHUD showInfoWithStatus:@"请选择颜色" maskType:SVProgressHUDMaskTypeClear];
        return;
    }
    
    if (m_productModel.m_currentSize.length == 0 && [self judgeSize:@"size"]) {
        [SVProgressHUD showInfoWithStatus:@"请选择尺码" maskType:SVProgressHUDMaskTypeClear];
        return;
    }
    NSData *cookiesdata = [[NSUserDefaults standardUserDefaults] objectForKey:NNUserDefaultsCookie];
    if (cookiesdata && cookiesdata.length>0) {
        [SVProgressHUD showWithMaskType:SVProgressHUDMaskTypeClear];
        [[NNProductApply shareInstanceManager] requestAddToShoppingCart:m_productModel.m_productId andBuyCount:[NSString stringWithFormat:@"%ld",(long)m_productModel.m_currentBuyCount] andSpecId:m_productModel.m_currentId andSucReturn:^(id content) {
            [SVProgressHUD showSuccessWithStatus:@"加入成功" maskType:SVProgressHUDMaskTypeClear];
            [[NSNotificationCenter defaultCenter] postNotificationName:@"AddToShippingCartSuc" object:nil];
        } andFaildReturn:^(NNErrorModel *errorM) {
            [SVProgressHUD showErrorWithStatus:errorM.m_message maskType:SVProgressHUDMaskTypeClear];
        }];
    }
    else{
        [self performSegueWithIdentifier:@"LoginFromProductSegue" sender:nil];
    }
    
}

-(void)queryProductInfo
{
    [[NNProductApply shareInstanceManager] requestProductDetail:m_productModel.m_productId andSucReturn:^(id content) {
        self.p_productModel = (ProductModel *)content;
        [m_nnProductInfoView refreshProductInfoData:m_productModel];
        //2. 获取评论
        [self getCommnetList];
    } andFaildReturn:^(NNErrorModel *errorM) {
        [SVProgressHUD showErrorWithStatus:errorM.m_message maskType:SVProgressHUDMaskTypeClear];
    }];
}

-(void)getCommnetList
{
    [[NNCommentApply shareInstanceManager] requestCommentList:m_productModel.m_productId andPage:@"1" andSucReturn:^(id content) {
        [m_nnProductInfoView refreshCommentData:(NSMutableArray *)content];
    } andFaildReturn:^(NNErrorModel *errorM) {
        [SVProgressHUD showErrorWithStatus:errorM.m_message maskType:SVProgressHUDMaskTypeClear];
    }];
}

#pragma mark - NNProductInfoDelegate
-(void)chooseSizeWithProduct:(id)sender
{
    if (!self.p_sizeView) {
        self.p_sizeView = [[NNSizeView alloc]initWithFrame:self.view.bounds];
        m_sizeView.p_nnSizeDelegate = self;
        m_sizeView.alpha = 0.0f;
        m_sizeView.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.2f];
        [self.view addSubview:m_sizeView];
    }
    [m_sizeView refreshSizeData:m_productModel];
    [UIView animateWithDuration:0.2f animations:^{
        m_sizeView.alpha = 1.0f;
    } completion:^(BOOL finished) {
        
    }];
}

-(void)lookCommentList:(id)sender
{
    [self performSegueWithIdentifier:@"CommentFromProductSegue" sender:nil];
}

#pragma mark - NNSizeDelegate
-(void)chooseProductSize:(ProductModel *)productM
{
    [UIView animateWithDuration:0.2f animations:^{
        m_sizeView.alpha = 0.0f;
    } completion:^(BOOL finished) {
        [m_sizeView removeFromSuperview];
        self.p_sizeView = nil;
    }];
    //2.刷新主视图
    [m_nnProductInfoView refreshProductInfoData:productM];
}

-(void)hideSize:(id)sender
{
    [UIView animateWithDuration:0.2f animations:^{
        m_sizeView.alpha = 0.0f;
    } completion:^(BOOL finished) {
        [m_sizeView removeFromSuperview];
        self.p_sizeView = nil;
    }];
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if([segue.identifier isEqualToString:@"CommentFromProductSegue"])
    {
        NNCommentViewController *commentVC = segue.destinationViewController;
        commentVC.p_commentPM = m_productModel;
    }
}

@end
