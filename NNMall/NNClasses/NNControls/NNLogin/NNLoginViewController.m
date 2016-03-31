//
//  NNLoginViewController.m
//  NNMall
//
//  Created by 马家俊 on 15/11/18.
//  Copyright © 2015年 shaoxu. All rights reserved.
//

#import "NNLoginViewController.h"
#import "NNLoginView.h"
#import "NNUserApply.h"
@interface NNLoginViewController ()<NNLoginViewDelegate>
{
    NNLoginView* m_loginView;
}
@property(nonatomic,strong) IBOutlet NNLoginView* p_loginView;
@end

@implementation NNLoginViewController
@synthesize p_loginView = m_loginView;
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationController setNavigationBarHidden:YES];
    self.p_loginView.p_NNLoginViewDelegate = self;
    [m_loginView refreshLoginView];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)cancelLogin:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)loginDelegate:(NSString *)account andPassW:(NSString *)passWord
{
    [[NNUserApply shareInstanceManager]loginNNMall:account andCode:passWord andSucReturn:^(id content) {
       // if ([[content valueForKey:@"status"] isEqualToString:@"1"]) {
            [self dismissViewControllerAnimated:YES completion:nil];
        //}
        
    } andFaildReturn:^(NNErrorModel *errorM) {
        [[YBProgressShow defaultProgress] showText:errorM.m_message
                                            InMode:MBProgressHUDModeText
                             OriginViewEnableTouch:NO
                                HideAfterDelayTime:1.0f];
    }];
}

-(void)sender:(NSString *)account
{
    [[NNUserApply shareInstanceManager]sendMessageVerifyCode:account andSucReturn:^(id content) {
        NSLog(@"success:%@",content);
    } andFaildReturn:^(NNErrorModel *errorM) {
        [[YBProgressShow defaultProgress] showText:errorM.m_message
                                            InMode:MBProgressHUDModeText
                             OriginViewEnableTouch:NO
                                HideAfterDelayTime:1.0f];
        NSLog(@"errorM:%@",errorM);
    }];
}

-(void)loginBackDelegate
{
    [self dismissViewControllerAnimated:YES completion:nil];
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
