//
//  NNAdreessView.m
//  NNMall
//
//  Created by 马家俊 on 15/11/16.
//  Copyright © 2015年 shaoxu. All rights reserved.
//

#import "NNAdreessView.h"
#import "NNAdreessDetailCell/AdreessDetailCell.h"
@interface NNAdreessView()<UITableViewDataSource,UITableViewDelegate,AdreessDetailCellDelegate>
{
    UITableView* m_tableView;
    NSMutableArray* m_mutiAddressM;
}
@property(nonatomic,strong) IBOutlet UITableView* p_tabelView;
@property(nonatomic,strong) NSMutableArray* p_mutiAddressM;
@end
@implementation NNAdreessView
@synthesize p_NNAdreessViewDelegate = m_NNAdreessViewDelegate;
@synthesize p_tabelView = m_tableView;
@synthesize p_mutiAddressM = m_mutiAddressM;
-(void)dealloc
{}

-(id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    
    if (self) {

    }
    
    return self;
}


-(void)refreshNNAdreessView:(NSMutableArray *)addressList
{
    self.p_mutiAddressM = addressList;
    [self.p_tabelView reloadData];
}

#pragma mark - Adreess TableView

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return m_mutiAddressM.count;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

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
    return 94;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *adreessDetailCell = @"AdreessDetailCell";
    AdreessDetailCell *cell = [tableView dequeueReusableCellWithIdentifier:adreessDetailCell];
    
    if (!cell) {
        cell = [[AdreessDetailCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:adreessDetailCell];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.p_AdreessDetailCellDelegate = self;
    [cell refreshAdreessDetailCell:[m_mutiAddressM objectAtIndex:indexPath.section]];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    AdreessModel *addressM = [m_mutiAddressM objectAtIndex:indexPath.section];
    if (m_NNAdreessViewDelegate &&[m_NNAdreessViewDelegate respondsToSelector:@selector(selectAddress:)])
    {
        [m_NNAdreessViewDelegate selectAddress:addressM];
    }
}


- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

-(NSString*)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return @"删除    ";
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        AdreessModel* AddressM = (AdreessModel*)[m_mutiAddressM objectAtIndex:indexPath.section];
        if (m_NNAdreessViewDelegate &&[m_NNAdreessViewDelegate respondsToSelector:@selector(deleteAddress:)])
        {
            [m_NNAdreessViewDelegate deleteAddress:AddressM];
        }
        
    }
}

- (NSArray *)tableView:(UITableView *)tableView editActionsForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewRowAction *deleteRowAction = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleDestructive title:@"删除" handler:^(UITableViewRowAction *action, NSIndexPath *indexPath) {
        
        NSLog(@"点击了删除");
    }];
        
    UITableViewRowAction *defaultRowAction = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleDestructive title:@"设为默认" handler:^(UITableViewRowAction *action, NSIndexPath *indexPath) {
        NSLog(@"点击了默认");
    }];
    defaultRowAction.backgroundColor = [UIColor colorWithRed:255.0f/255.0f green:205.0f/255.0f blue:0/255.0f alpha:1];
    UITableViewRowAction *editRowAction = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleDestructive title:@"编辑" handler:^(UITableViewRowAction *action, NSIndexPath *indexPath) {
        NSLog(@"点击了编辑");
    }];
    editRowAction.backgroundColor = [UIColor orangeColor];
    
    return @[deleteRowAction,editRowAction,defaultRowAction];
}
@end
