//
//  NNModifyAccountView.m
//  NNMall
//
//  Created by 马家俊 on 15/11/13.
//  Copyright © 2015年 shaoxu. All rights reserved.
//

#import "NNModifyAccountView.h"

@interface NNModifyAccountView()<UITableViewDataSource,UITableViewDelegate,UITextFieldDelegate>
{
    UITableView* m_tableView;
    NSString* m_modifyContent;
    NSInteger m_modifyType;
    UITextField* m_textField;
    NSArray* m_tableContent;
}
@property(nonatomic,strong) IBOutlet UITableView* p_tableView;
@property(nonatomic,strong) NSString* p_modifyContent;
@property(nonatomic,strong) UITextField* p_textField;
@property(nonatomic,strong) NSArray* p_tableContent;
@end
@implementation NNModifyAccountView
@synthesize p_NNModifyAccountViewDelegate = m_NNModifyAccountViewDelegate;
@synthesize p_tableView = m_tableView;
@synthesize p_modifyContent = m_modifyContent;
@synthesize p_textField = m_textField;
-(void)dealloc
{}

-(id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        self.p_tableContent = [NSArray arrayWithObjects:@"男",@"女", nil];
    }
    return self;
}

-(void)refreshNNModifyAccountView:(NSIndexPath *)chooseRow
{
    m_modifyType =chooseRow.row;
    switch (m_modifyType) {
        case 2:
            m_modifyContent = AppManage.p_currentUserM.m_uName;
            break;
        case 3:
            m_modifyContent = AppManage.p_currentUserM.m_uSex;
            break;
        default:
            break;
    }
    NSLog(@"%@",m_modifyContent);
    [self.p_tableView reloadData];
}

#pragma mark - Modify TableView

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (m_modifyType == 2) {
        return 1;
    }
    return 2;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0.001f;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.001f;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{

    return 44.0f;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *Me = @"accountCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:Me];
    
    if (!cell) {
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:Me];
    }else{
        while ([cell.contentView.subviews lastObject] != nil) {
            [(UIView*)[cell.contentView.subviews lastObject] removeFromSuperview];
        }
    }
    
    if (m_modifyType == 2) {
        self.p_textField = [[UITextField alloc]initWithFrame:CGRectMake(20, 0, cell.contentView.frame.size.width, cell.contentView.frame.size.height)];
        m_textField.text = AppManage.p_currentUserM.m_uName;
        m_textField.placeholder = @"请输入昵称";
        [cell addSubview:m_textField];
        [m_textField becomeFirstResponder];
    }else
    {
        if ([AppManage.p_currentUserM.m_uSex isEqualToString:@"男"]) {
            if (indexPath.row == 0) {
                cell.selected = YES;
            }
        }else
        {
            if (indexPath.row == 1) {
                cell.selected = YES;
            }
        }
        if (cell.selected)
            cell.accessoryType = UITableViewCellAccessoryCheckmark;
        else
            cell.accessoryType = UITableViewCellAccessoryNone;
        cell.textLabel.text = [self.p_tableContent objectAtIndex:indexPath.row];
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSArray *array = [tableView visibleCells];
    for (UITableViewCell *cell in array) {
        [cell setAccessoryType:UITableViewCellAccessoryNone];
    }
    UITableViewCell *cell=[self.p_tableView cellForRowAtIndexPath:indexPath];
    [cell setAccessoryType:UITableViewCellAccessoryCheckmark];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [m_textField resignFirstResponder];
    return YES;
}
@end
