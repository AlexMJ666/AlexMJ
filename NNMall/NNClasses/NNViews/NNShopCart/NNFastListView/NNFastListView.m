//
//  NNFastListView.m
//  NNMall
//
//  Created by shaoxu on 15/11/23.
//  Copyright © 2015年 shaoxu. All rights reserved.
//

#import "NNFastListView.h"
#import "FastModel.h"
@interface NNFastListView ()<UITableViewDataSource,UITableViewDelegate>
{
    UITableView *m_fastTableView;
    OrderModel *m_orderModel;
    NSMutableArray *m_fastListArray;
}
@property (nonatomic,strong) IBOutlet UITableView *p_fastTableView;
@property (nonatomic,strong) OrderModel *p_orderModel;
@property (nonatomic,strong) NSMutableArray *p_fastListArray;
@end

@implementation NNFastListView
@synthesize p_fastTableView = m_fastTableView;
@synthesize p_orderModel = m_orderModel;
@synthesize p_fastListArray = m_fastListArray;
@synthesize p_nnFastListDelegate = m_nnFastListDelegate;

-(void)dealloc
{

}

-(id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        
    }
    return self;
}

-(void)refreshFastData:(NSMutableArray *)fastList andOrderModel:(OrderModel *)orderM
{
    self.p_orderModel = orderM;
    self.p_fastListArray = fastList;
    [m_fastTableView reloadData];
}

#pragma mark - WareDetail TableView

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return m_fastListArray.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 10.0f;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 55.0f;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *Fast = @"FastCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:Fast forIndexPath:indexPath];
    
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:Fast];
    }
    FastModel *fastM = [m_fastListArray objectAtIndex:indexPath.row];
    cell.textLabel.text = fastM.m_fastName;
    cell.detailTextLabel.text = fastM.m_fastFee;
    if (m_orderModel.m_orderFM) {
        if ([fastM.m_fastId isEqualToString:m_orderModel.m_orderFM.m_fastId]) {
            cell.accessoryType = UITableViewCellAccessoryCheckmark;
        }
        else{
            cell.accessoryType = UITableViewCellAccessoryNone;
        }
    }
    else{
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    FastModel *fastM = [m_fastListArray objectAtIndex:indexPath.row];
    m_orderModel.m_orderFM = fastM;
    if (m_nnFastListDelegate && [m_nnFastListDelegate respondsToSelector:@selector(chooseFastToBack:)]) {
        [m_nnFastListDelegate chooseFastToBack:nil];
    }
}


@end
