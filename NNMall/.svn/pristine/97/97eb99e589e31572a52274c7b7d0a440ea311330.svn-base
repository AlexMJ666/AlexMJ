//
//  NNFastListViewController.m
//  NNMall
//
//  Created by shaoxu on 15/11/23.
//  Copyright © 2015年 shaoxu. All rights reserved.
//

#import "NNFastListViewController.h"
#import "NNFastListView.h"
@interface NNFastListViewController ()<NNFastListDelegate>
{
    NNFastListView *m_fastListView;
}
@property (nonatomic,strong) IBOutlet NNFastListView *p_fastListView;
@end

@implementation NNFastListViewController
@synthesize p_fastOM = m_fastOM;
@synthesize p_fastListArray = m_fastListArray;
@synthesize p_fastListView = m_fastListView;

-(void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    m_fastListView.p_nnFastListDelegate = self;
    [m_fastListView refreshFastData:m_fastListArray andOrderModel:m_fastOM];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - NNFastListDelegate
-(void)chooseFastToBack:(id)sender
{
    [[NSNotificationCenter defaultCenter] postNotificationName:@"ChooseFast" object:nil];
    [self.navigationController popViewControllerAnimated:YES];
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
