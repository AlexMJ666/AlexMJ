//
//  NNAdreessViewController.m
//  NNMall
//
//  Created by 马家俊 on 15/11/16.
//  Copyright © 2015年 shaoxu. All rights reserved.
//

#import "NNAdreessViewController.h"
#import "NNUserApply.h"
@interface NNAdreessViewController ()<NNAdreessViewDelegate>
{
    NNAdreessView* m_NNAdreessView;
}
@property(nonatomic,strong) IBOutlet NNAdreessView* p_NNAdreessView;
@end


@implementation NNAdreessViewController
@synthesize p_NNAdreessView = m_NNAdreessView;
@synthesize p_isFromSelect = m_isFromSelect;
@synthesize p_orderM = m_orderM;

-(void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.p_NNAdreessView.p_NNAdreessViewDelegate = self;
    [self getAddress];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)getAddress
{
    [[NNUserApply shareInstanceManager] requestExpress:^(id content) {
        [m_NNAdreessView refreshNNAdreessView:(NSMutableArray *)content];
    } andFaildReturn:^(NNErrorModel *errorM) {
        [SVProgressHUD showErrorWithStatus:errorM.m_message maskType:SVProgressHUDMaskTypeNone];
    }];
}

#pragma mark - NNAdreessViewDelegate
-(void)deleteAddress:(AdreessModel*)addressM
{

}

-(void)selectAddress:(AdreessModel *)addressM
{
    if (m_isFromSelect) {
        m_orderM.m_shipAddModel = addressM;
        [[NSNotificationCenter defaultCenter] postNotificationName:@"ChooseAddress" object:nil];
        [self.navigationController popViewControllerAnimated:YES];
    }
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
