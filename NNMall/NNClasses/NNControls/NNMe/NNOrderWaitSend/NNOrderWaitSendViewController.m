//
//  NNOrderWaitSendViewController.m
//  NNMall
//
//  Created by 马家俊 on 15/11/18.
//  Copyright © 2015年 shaoxu. All rights reserved.
//

#import "NNOrderWaitSendViewController.h"

@interface NNOrderWaitSendViewController ()

@end

@implementation NNOrderWaitSendViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return 2;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 45.0f;
}

-(UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView* bkView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kMainScreen_Width, 45)];
    bkView.backgroundColor = [UIColor colorWithRed:230.0f/255.0f green:230.0f/255.0f blue:230.0f/255.0f alpha:1];
    UIView* header = [[UIView alloc]initWithFrame:CGRectMake(0, 10, kMainScreen_Width, 35)];
    header.backgroundColor = [UIColor whiteColor];
    [bkView addSubview:header];
    
    //传入model——————————todo
    [self makeHeaderView:header];
    return bkView;
}

-(UIView*)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    UIView* footer = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kMainScreen_Width, 64)];
    footer.backgroundColor = [UIColor whiteColor];
    //传入model——————————todo
    [self makeFooterView:footer];
    return footer;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 120.0f;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 64.0f;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *allcell = @"NNMyOrderCell";
    NNMyOrderCell *cell = (NNMyOrderCell *)[tableView dequeueReusableCellWithIdentifier:allcell];
    if (!cell) {
        cell = [[NNMyOrderCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:allcell];
    }
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

-(void)makeHeaderView:(UIView*)header
{
    UILabel* nuannuan = [[UILabel alloc]initWithFrame:CGRectMake(28, 10, 91, 22)];
    nuannuan.font = [NNCommonDeal getFont:16];
    nuannuan.text = @"暖暖商城";
    [header addSubview:nuannuan];
    
    UILabel* status = [[UILabel alloc]initWithFrame:CGRectMake(kMainScreen_Width-45, 13, 36, 17)];
    status.font = [NNCommonDeal getFont:12];
    status.text = @"未付款";
    [header addSubview:status];
}

-(void)makeFooterView:(UIView*)header
{
    UILabel* nuannuan = [[UILabel alloc]initWithFrame:CGRectMake(28, 22, 150, 21)];
    nuannuan.font = [NNCommonDeal getFont:16];
    nuannuan.text = @"实付款：￥555555";
    [header addSubview:nuannuan];
    
    UIButton* statusBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    statusBtn.frame = CGRectMake(kMainScreen_Width-80, 15, 70, 34);
    [statusBtn setTitle:@"去支付" forState:UIControlStateNormal];
    [statusBtn setTitleColor:Redcolor forState:UIControlStateNormal];
    statusBtn.layer.masksToBounds = YES;
    statusBtn.layer.cornerRadius = 5;
    statusBtn.layer.borderColor = [[UIColor colorWithRed:238/255.0f green:63/255.0f blue:48/255.0f alpha:1.0f]CGColor];
    statusBtn.layer.borderWidth =1;
    [header addSubview:statusBtn];
}


@end
