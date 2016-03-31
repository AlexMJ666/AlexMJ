//
//  NNRecommendDailyViewController.m
//  NNMall
//
//  Created by shaoxu on 15/11/4.
//  Copyright © 2015年 shaoxu. All rights reserved.
//

#import "NNRecommendDailyViewController.h"
#import "NNRecommendDailyView.h"
#import "NNProductInfoViewController.h"
#import "NNProductApply.h"
@interface NNRecommendDailyViewController ()<NNRecommandDailyDelegate>
{
    NNRecommendDailyView *m_nnRecommandDailyView;
    NSMutableArray *m_dataArray;
    NSInteger nowPage;
}
@property (nonatomic,strong) IBOutlet NNRecommendDailyView *p_nnRecommandDailyView;
@property (nonatomic,strong) NSMutableArray *p_dataArray;
@end

@implementation NNRecommendDailyViewController
@synthesize p_nnRecommandDailyView = m_nnRecommandDailyView;
@synthesize p_dataArray = m_dataArray;
@synthesize p_type = m_type;
@synthesize p_title = m_title;

-(void)dealloc
{

}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = m_title;
    
    m_nnRecommandDailyView.p_nnRecommandDailyDelegate = self;
    nowPage = 1;
    [m_nnRecommandDailyView initMJRefreshView];
}

-(void)refreshRecommandGoods:(ReturnBlockSuccess)returnBlock_ andFaild:(ReturnBlockFaild)returnFaild_
{
    [[NNProductApply shareInstanceManager] requestMoreProductListWithType:m_type andPage:@"1" andSucReturn:^(id content) {
        NSDictionary *backDic = (NSDictionary *)content;
        NSArray *list = [[backDic valueForKeyPath:@"data"] valueForKeyPath:@"list"];
        if (!self.p_dataArray) {
            self.p_dataArray = [[NSMutableArray alloc]init];
            for (int i=0; i<list.count; i++) {
                NSDictionary *listDic = [list objectAtIndex:i];
                ProductModel *productM = [[ProductModel alloc] parseFromDic:listDic];
                [m_dataArray addObject:productM];
            }
        }
        else{
            for (int i=0; i<list.count; i++) {
                NSDictionary *listDic = [list objectAtIndex:i];
                ProductModel *productM = [[ProductModel alloc] parseFromDic:listDic];
                ProductModel *oldProductM = [m_dataArray firstObject];
                if (productM.m_productId.integerValue > oldProductM.m_productId.integerValue) {
                    [m_dataArray insertObject:productM atIndex:0];
                }
            }
        }
        returnBlock_(m_dataArray);
    } andFaildReturn:^(NNErrorModel *errorM) {
        returnFaild_(errorM);
    }];
}

-(void)loadMoreRecommandGoods:(ReturnBlockSuccess)returnBlock_ andFaild:(ReturnBlockFaild)returnFaild_
{
    [[NNProductApply shareInstanceManager] requestMoreProductListWithType:m_type andPage:[NSString stringWithFormat:@"%ld",nowPage+1] andSucReturn:^(id content) {
        nowPage ++;
        NSDictionary *backDic = (NSDictionary *)content;
        NSArray *list = [[backDic valueForKeyPath:@"data"] valueForKeyPath:@"list"];
        for (int i=0; i<list.count; i++) {
            NSDictionary *listDic = [list objectAtIndex:i];
            ProductModel *productM = [[ProductModel alloc] parseFromDic:listDic];
            [m_dataArray addObject:productM];
        }
        returnBlock_(m_dataArray);
    } andFaildReturn:^(NNErrorModel *errorM) {
        returnFaild_(errorM);
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - NNRecommandDailyDelegate
-(void)productInfoFromRecommand:(ProductModel *)productM
{
    [self performSegueWithIdentifier:@"ProductFromDailySegue" sender:productM];
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if([segue.identifier isEqualToString:@"ProductFromDailySegue"])
    {
        ProductModel *proModel = (ProductModel *)sender;
        NNProductInfoViewController *productInfoVC = segue.destinationViewController;
        productInfoVC.p_productModel = proModel;
        productInfoVC.p_isFromProduct = YES;
    }
}

@end
