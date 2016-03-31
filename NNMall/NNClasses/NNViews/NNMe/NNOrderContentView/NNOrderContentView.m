//
//  NNOrderContentView.m
//  NNMall
//
//  Created by 马家俊 on 15/11/24.
//  Copyright © 2015年 shaoxu. All rights reserved.
//

#import "NNOrderContentView.h"
#import "AdreessDetailCell.h"
#import "AdreessModel.h"
#import "NNMyOrderCell.h"
@interface NNOrderContentView()<UITableViewDataSource,UITableViewDelegate>
{
    UITableView* m_tableView;
    OrderModel* m_orderM;
}
@property(nonatomic,strong) IBOutlet UITableView * p_tableView;
@property(nonatomic,strong) OrderModel* p_orderM;
@end
@implementation NNOrderContentView
@synthesize p_NNOrderContentViewDelegate = m_NNOrderContentViewDelegate;
@synthesize p_tableView = m_tableView;
@synthesize p_orderM = m_orderM;

-(void)dealloc
{}

-(id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
    }
    return self;
}

-(void)refresgNNOrderContentView:(OrderModel *)orderM
{
    [self.p_tableView setHidden:NO];
    self.p_orderM = orderM;
    [self.p_tableView reloadData];
}

#pragma mark - Me TableView

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 5;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section==0) {
        return 1;
    }else if (section == 1)
    {
        return m_orderM.m_orderProArray.count;
    }else if (section == 2)
    {
        return 2;
    }else if (section == 3)
    {
        return 3;
    }
    return 1;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        return 55;
    }else if (section == 1)
    {
        return 30;
    }else if (section == 2)
    {
        return 0.0001f;
    }else if (section == 3)
    {
        return 10;
    }
    return 1;
}

-(UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    if (section == 0) {

        UILabel* orderStatusLab = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, tableView.bounds.size.width, 55)];
        orderStatusLab.backgroundColor = Redcolor;
        switch (m_orderM.m_orderStatus) {
            case order_status_init:
                orderStatusLab.text = @"      未付款";
                break;
            case order_status_pass:
                orderStatusLab.text = @"      待发货";
                break;
            case order_status_send:
                orderStatusLab.text = @"      待收货";
                break;
            case order_status_sign:
                orderStatusLab.text = @"      待评价";
                break;
            case order_status_cancel:
                orderStatusLab.text = @"      已取消";
                break;
            case order_status_file:
                orderStatusLab.text = @"      已完成";
                break;
            default:
                break;
        }
        
        
        orderStatusLab.textColor = [UIColor whiteColor];
        orderStatusLab.font = [NNCommonDeal getFont:24];
        return orderStatusLab;
    }else if (section == 1)
    {
        UIView* sectionTwo = [[UIView alloc]initWithFrame:CGRectMake(0, 0, tableView.bounds.size.width, 30)];
        sectionTwo.backgroundColor = [UIColor whiteColor];
        
        UITextField* nuannuan = [[UITextField alloc]initWithFrame:CGRectMake(20, 0, tableView.bounds.size.width-20, 30)];
        nuannuan.text = @"电视到家";
        nuannuan.font = [NNCommonDeal getFont:16];
        nuannuan.userInteractionEnabled = NO;
        nuannuan.leftView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"heart"]];
        nuannuan.leftViewMode = UITextFieldViewModeAlways;
        [nuannuan setBorderStyle:UITextBorderStyleNone];
        [sectionTwo addSubview:nuannuan];
        return sectionTwo;
    }
    return nil;
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row==0&&indexPath.section==0) {
        return 100;
    }else if (indexPath.section == 1)
    {
        return 112;
    }else if (indexPath.section == 2)
    {
        return 49;
    }else if (indexPath.section == 3)
    {
        return 25;
    }
    return 50.0f;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    if (section == 0) {
        return 10;
    }if (section==1) {
        return 0.0001f;
    }else if (section == 2)
    {
        return 0.0001f;
    }else if (section == 3)
    {
        return 0.0001f;
    }
    return 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        static NSString *orderContentCell = @"addressInOrder";
        AdreessDetailCell *cell = (AdreessDetailCell*)[tableView dequeueReusableCellWithIdentifier:orderContentCell forIndexPath:indexPath];
        if (!cell) {
            cell = [[AdreessDetailCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:orderContentCell];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
        }
        [cell refreshAdreessDetailCellFromOrderContent:m_orderM.m_shipAddModel];
        return cell;
    }else if(indexPath.section == 1)
    {
        static NSString *OrderContentCell = @"OrderContentCell";
        NNMyOrderCell *cell = (NNMyOrderCell*)[tableView dequeueReusableCellWithIdentifier:OrderContentCell forIndexPath:indexPath];
        if (!cell) {
            cell = [[NNMyOrderCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:OrderContentCell];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
        }
        [cell refreshMyOrderCell:m_orderM andIndexRow:indexPath];
        return cell;
    }else if(indexPath.section == 2)
    {
        static NSString *OrderContentCell = @"Celled";
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:OrderContentCell];
        if (!cell) {
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:OrderContentCell];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
        }
        if (indexPath.row == 0) {
            
            cell.textLabel.text = @"运费";
            cell.detailTextLabel.text = [NSString stringWithFormat:@"￥%@",m_orderM.m_orderFM.m_fastFee];
            UIView* line = [[UIView alloc]initWithFrame:CGRectMake(20, 48, kMainScreen_Width-25, 1)];
            line.backgroundColor = [UIColor colorWithRed:200.0f/255.0f green:200.0f/255.0f blue:200.0f/255.0f alpha:1];
            [cell addSubview:line];
        }else
        {
            cell.textLabel.text = @"应付总额";
            cell.detailTextLabel.text = [NSString stringWithFormat:@"￥%@",m_orderM.m_orderCost];
            cell.detailTextLabel.textColor = [UIColor redColor];
        }
        
        // [cell refreshMyOrderCell:m_orderM];
        return cell;
    }
    else if(indexPath.section == 3)
    {
        static NSString *OrderContentCell = @"Celled";
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:OrderContentCell];
        if (!cell) {
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:OrderContentCell];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
        }
        cell.textLabel.font = [NNCommonDeal getFont:14];
        switch (indexPath.row) {
            case 0:
                cell.textLabel.text = @"支付方式：线上支付";
                break;
            case 1:
                cell.textLabel.text = [NSString stringWithFormat:@"配送方式：%@",m_orderM.m_orderFM.m_fastName ];
                break;
            case 2:
                cell.textLabel.text = @"下单时间：2015-11-11 12:33:54";
                break;
            default:
                break;
        }
        //cell.textLabel.text = @""
        // [cell refreshMyOrderCell:m_orderM];
        return cell;
    }else
    {
        static NSString *OrderContentCell = @"Celled";
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:OrderContentCell];
        if (!cell) {
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:OrderContentCell];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
        }
        //cell.textLabel.text = @""
        // [cell refreshMyOrderCell:m_orderM];
        return cell;
    }

}

@end
