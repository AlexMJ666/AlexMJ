//
//  NNAccountView.m
//  NNMall
//
//  Created by 马家俊 on 15/11/12.
//  Copyright © 2015年 shaoxu. All rights reserved.
//

#import "NNAccountView.h"

@interface NNAccountView()<UITableViewDataSource,UITableViewDelegate,UITextFieldDelegate>
{
    UITableView* m_tableView;
    NSArray* m_titleArray;
    UIImageView* m_headImg;
    UITextField* m_userIdText;
    UITextField* m_nickNameText;
    UILabel* m_sexText;
}
@property(nonatomic,strong) IBOutlet UITableView* p_tableView;
@property(nonatomic,strong) NSArray* p_titleArray;
@property(nonatomic,strong) UIImageView* p_headImg;
@property(nonatomic,strong) UITextField* p_userIdText;
@property(nonatomic,strong) UITextField* p_nickNameText;
@property(nonatomic,strong) UILabel* p_sexText;
@end
@implementation NNAccountView
@synthesize p_NNAccountViewDelegate = m_NNAccountViewDelegate;
@synthesize p_tableView = m_tableView;
@synthesize p_titleArray = m_titleArray;
@synthesize p_headImg = m_headImg;

-(void)dealloc
{
}

-(id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        self.p_titleArray = [NSMutableArray arrayWithObjects:@[@"头像",@"用户名",@"昵称",@"性别"],@[@"地址管理"], nil];
        m_headImg = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 50, 50)];
        m_headImg.image = [UIImage imageNamed:@"bill"];
        m_headImg.layer.masksToBounds = YES;
        m_headImg.layer.cornerRadius = m_headImg.bounds.size.width/2.0f;
    }
    return self;
}


-(void)refreshAccountView
{
    [self.p_tableView reloadData];
}

#pragma mark - Me TableView

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        return 4;
    }
    return 1;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 5;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 5;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section==0&&indexPath.row == 0) {
        return 64.0f;
    }
    return 44.0f;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *account = @"Celled";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:account];
    
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:account];
    }else{
        while ([cell.contentView.subviews lastObject] != nil) {
            [(UIView*)[cell.contentView.subviews lastObject] removeFromSuperview];
        }
    }
    cell.textLabel.text = [[m_titleArray objectAtIndex:indexPath.section] objectAtIndex:indexPath.row];
    cell.textLabel.font = [NNCommonDeal getFont:14];
    cell.detailTextLabel.font = [NNCommonDeal getFont:14];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    if (indexPath.section == 0&&indexPath.row == 0) {
        cell.accessoryView = m_headImg;
    }else if (indexPath.section == 0&&indexPath.row == 1)
    {
        cell.accessoryType = UITableViewCellAccessoryNone;
        cell.detailTextLabel.text = AppManage.p_currentUserM.m_uid;
    }else if (indexPath.section == 0&&indexPath.row == 2)
    {
        cell.detailTextLabel.text = AppManage.p_currentUserM.m_uName;
    }else if (indexPath.section == 0&&indexPath.row == 3)
    {
        cell.detailTextLabel.text = AppManage.p_currentUserM.m_uSex;
    }
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0 && indexPath.row >1) {
        if (m_NNAccountViewDelegate&& [m_NNAccountViewDelegate respondsToSelector:@selector(pushToModify:)]) {
            [m_NNAccountViewDelegate pushToModify:indexPath];
        }
    }
    if (indexPath.section == 1) {
        if (m_NNAccountViewDelegate&& [m_NNAccountViewDelegate respondsToSelector:@selector(pushToModify:)]) {
            [m_NNAccountViewDelegate pushToAdreess];
        }
    }
}

#pragma mark - UITextFieldDelegate
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

@end