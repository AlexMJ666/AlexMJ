//
//  NNOrderContentViewController.m
//  NNMall
//
//  Created by 马家俊 on 15/11/24.
//  Copyright © 2015年 shaoxu. All rights reserved.
//

#import "NNOrderContentViewController.h"
#import "NNOrderContentView.h"
#import "NNOrderApply.h"

@interface NNOrderContentViewController ()<NNOrderContentViewDelegate>
{
    NNOrderContentView* m_orderContentView;
}
@property(nonatomic,strong) IBOutlet NNOrderContentView* p_orderContentView;
@end

@implementation NNOrderContentViewController
@synthesize p_orderContentView = m_orderContentView;
@synthesize p_fromVC = m_fromVC;
@synthesize p_contentOM = m_contentOM;

-(void)dealloc
{
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    m_orderContentView.p_NNOrderContentViewDelegate = self;
    [self getOrderDetail];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)getOrderDetail
{
    [[NNOrderApply shareInstanceManager] requestOrderDetail:m_contentOM.m_orderId andSucReturn:^(id content) {
        OrderModel *orderM = (OrderModel *)content;
        [m_orderContentView refresgNNOrderContentView:orderM];
    } andFaildReturn:^(NNErrorModel *errorM) {
        [SVProgressHUD showErrorWithStatus:errorM.m_message maskType:SVProgressHUDMaskTypeClear];
    }];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end