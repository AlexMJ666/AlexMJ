//
//  NNMainMallViewController.m
//  NNMall
//
//  Created by shaoxu on 15/11/3.
//  Copyright © 2015年 shaoxu. All rights reserved.
//

#import "NNMainMallViewController.h"
#import "NNMainMallView.h"
#import "ProductModel.h"
#import "NNProductInfoViewController.h"
#import "NNRecommendDailyViewController.h"
#import "NNProductApply.h"
@interface NNMainMallViewController ()<NNMainMallDelegate>
{
    NNMainMallView *m_nnMainMallView;
    NSMutableArray *m_mallArray;
}
@property (nonatomic,strong) IBOutlet NNMainMallView *p_nnMainMallView;
@property (nonatomic,strong) NSMutableArray *p_mallArray;
@end

@implementation NNMainMallViewController
@synthesize p_nnMainMallView = m_nnMainMallView;
@synthesize p_mallArray = m_mallArray;

-(void)dealloc
{
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    m_nnMainMallView.p_nnMainMallDelegate = self;
    [m_nnMainMallView initMallRefresh];
    [self getProductList];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)getProductList
{
//    [SVProgressHUD showWithMaskType:SVProgressHUDMaskTypeNone];
    [[NNProductApply shareInstanceManager] requestProductList:^(id content) {
//        [SVProgressHUD dismiss];
        self.p_mallArray = (NSMutableArray *)content;
        [m_nnMainMallView refreshMainMallData:m_mallArray];
    } andFaildReturn:^(NNErrorModel *errorM) {
        [SVProgressHUD showErrorWithStatus:errorM.m_message maskType:SVProgressHUDMaskTypeClear];
    }];
}

-(IBAction)searchProduct:(id)sender
{
    [self performSegueWithIdentifier:@"SearchFromMainSegue" sender:nil];
}

#pragma mark - NNMainMallDelegate
-(void)productDetail:(ProductModel *)productM
{
    [self performSegueWithIdentifier:@"ProductInfoSegue" sender:productM];
}

-(void)showMoreDailyProduct:(NSInteger)tag
{
    [self performSegueWithIdentifier:@"RecommandProductSegue" sender:[NSString stringWithFormat:@"%ld",(long)tag]];
}

-(void)reloadMainMallData:(MallSuccessBlock)subBlock_ andFailed:(MallFailedBlock)failedBlock_
{
    [[NNProductApply shareInstanceManager] requestProductList:^(id content) {
        self.p_mallArray = (NSMutableArray *)content;
        subBlock_(m_mallArray);
    } andFaildReturn:^(NNErrorModel *errorM) {
        failedBlock_(errorM);
    }];
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if([segue.identifier isEqualToString:@"ProductInfoSegue"])
    {
        ProductModel *productM = (ProductModel *)sender;
        NNProductInfoViewController *productInfoVC = segue.destinationViewController;
        productInfoVC.p_productModel = productM;
        productInfoVC.p_isFromProduct = YES;
    }
    if([segue.identifier isEqualToString:@"RecommandProductSegue"])
    {
        NSString *tag = (NSString *)sender;
        NNRecommendDailyViewController *recommendVC = segue.destinationViewController;
        recommendVC.p_type = tag;
        MallModel *mallM = [m_mallArray objectAtIndex:tag.integerValue];
        recommendVC.p_title = mallM.m_mallType;
    }
}

@end