//
//  NNModifyAccountViewController.m
//  NNMall
//
//  Created by 马家俊 on 15/11/13.
//  Copyright © 2015年 shaoxu. All rights reserved.
//

#import "NNModifyAccountViewController.h"
#import "NNModifyAccountView.h"
@interface NNModifyAccountViewController ()<NNModifyAccountViewDelegate>
{
    NNModifyAccountView* m_NNModifyAccountView;
}
@property(nonatomic,strong) IBOutlet NNModifyAccountView* p_NNModifyAccountView;
@end

@implementation NNModifyAccountViewController
@synthesize p_NNModifyAccountView = m_NNModifyAccountView;
@synthesize chooseRow;

- (void)viewDidLoad {
    [super viewDidLoad];
    self.p_NNModifyAccountView.p_NNModifyAccountViewDelegate = self;
    [self.p_NNModifyAccountView refreshNNModifyAccountView:chooseRow];
    UILabel* titleLab = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 100, 44)];
    titleLab.textAlignment = NSTextAlignmentCenter;
    titleLab.textColor = Redcolor;
    if (chooseRow.row == 2) {
        titleLab.text = @"昵称";
    }else
    {
        titleLab.text = @"性别";
    }
    
    self.navigationItem.titleView = titleLab;
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)modifyComplete:(UIBarButtonItem *)sender {
}
@end
