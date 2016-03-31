//
//  NNOrderView.m
//  NNMall
//
//  Created by shaoxu on 15/11/12.
//  Copyright © 2015年 shaoxu. All rights reserved.
//

#import "NNOrderView.h"
#import "NNAddressCell.h"
#import "NNOrderProductCell.h"
#import <SDWebImage/UIImageView+WebCache.h>

@interface NNOrderView ()<UITableViewDataSource,UITableViewDelegate>
{
    UITableView *m_orderTableView;
    OrderModel *m_orderM;
    UILabel  *m_orderCostLbl;
    UIButton *m_submitOrderBtn;
}
@property (nonatomic,strong) IBOutlet UITableView *p_orderTableView;
@property (nonatomic,strong) OrderModel *p_orderM;
@property (nonatomic,strong) IBOutlet UILabel  *p_orderCostLbl;
@property (nonatomic,strong) IBOutlet UIButton *p_submitOrderBtn;
@end

@implementation NNOrderView
@synthesize p_orderTableView = m_orderTableView;
@synthesize p_orderM = m_orderM;
@synthesize p_orderCostLbl = m_orderCostLbl;
@synthesize p_submitOrderBtn = m_submitOrderBtn;
@synthesize p_orderDelegate = m_orderDelegate;

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

-(void)refreshOrderData:(OrderModel *)orderM
{
    m_submitOrderBtn.layer.masksToBounds = YES;
    m_submitOrderBtn.layer.cornerRadius = 5;
    self.p_orderM = orderM;
    // 价格、快递费、优惠券
    if (orderM.m_orderFM.m_fastFee) {
        orderM.m_orderCost = [NSString stringWithFormat:@"%.1f",orderM.m_orderPrice.doubleValue+orderM.m_orderFM.m_fastFee.doubleValue];
    }
    else{
        orderM.m_orderCost = [NSString stringWithFormat:@"%.1f",orderM.m_orderPrice.doubleValue];
    }
    m_orderCostLbl.text = [NSString stringWithFormat:@"¥%@",orderM.m_orderCost];
    [m_orderTableView reloadData];
}

-(IBAction)submitOrderBtnClick:(id)sender
{
    if (m_orderDelegate && [m_orderDelegate respondsToSelector:@selector(submitOrder:)]) {
        [m_orderDelegate submitOrder:nil];
    }
}

#pragma mark - WareDetail TableView

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 1 ) {
        return m_orderM.m_orderProArray.count;
    }
    else if (section == 2){
        return 2;
    }
    return 1;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 10.0f;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0 && m_orderM.m_shipAddModel) {
        //计算地址高度：默认100
        CGFloat height = [NNCommonDeal getTextHeight:[NSString stringWithFormat:@"收货地址：%@",m_orderM.m_shipAddModel.m_detailAdreess] andWidth:kMainScreen_Width-63 andFontSize:12];
        if (height>20) {
            return height+80;
        }
        return 100.0f;
    }
    else if (indexPath.section == 1) {
        return 120.0f;
    }
    return 50.0f;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.001f;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0 && m_orderM.m_shipAddModel) {
        static NSString *OrderAddress = @"OrderAddressCell";
        NNAddressCell *cell = (NNAddressCell *)[tableView dequeueReusableCellWithIdentifier:OrderAddress forIndexPath:indexPath];
        
        if (!cell) {
            cell = [[NNAddressCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:OrderAddress];
        }
        cell.textLabel.text = nil;
        cell.detailTextLabel.text = nil;
        [cell refreshAddressData:m_orderM.m_shipAddModel];
        return cell;
    }
    else if(indexPath.section == 1){
        static NSString *OrderPro = @"OrderProCell";
        NNOrderProductCell *cell = (NNOrderProductCell *)[tableView dequeueReusableCellWithIdentifier:OrderPro forIndexPath:indexPath];
        
        if (!cell) {
            cell = [[NNOrderProductCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:OrderPro];
        }
        ProductModel *productM = [m_orderM.m_orderProArray objectAtIndex:indexPath.row];
        [cell.p_productIco sd_setImageWithURL:[NSURL URLWithString:productM.m_productImgUrl] placeholderImage:[AppManage getDefaultImage:@"80"]];
        cell.p_productNameLbl.text = productM.m_productName;
        cell.p_productPriceLbl.text = [NSString stringWithFormat:@"¥%@",productM.m_productCost];
        cell.p_productCountLbl.text = [NSString stringWithFormat:@"x%ld",(long)productM.m_currentBuyCount];
        cell.p_productNameLbl.font = [NNCommonDeal getFont:14];
        cell.p_productPriceLbl.font = [NNCommonDeal getFont:15];
        cell.p_productCountLbl.font = [NNCommonDeal getFont:15];
        return cell;
    }
    else{
        static NSString *Order = @"OrderCell";
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:Order forIndexPath:indexPath];
        if (!cell) {
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:Order];
        }
        if (indexPath.section == 0 && indexPath.row == 0) {
            cell.textLabel.text = @"送货地址";
            cell.detailTextLabel.text = @"请选择送货地址";
        }
        else if (indexPath.section == 2 && indexPath.row == 0) {
            cell.textLabel.text = @"配送方式";
            if (m_orderM.m_orderFM.m_fastFee.length>0) {
                cell.detailTextLabel.text = [NSString stringWithFormat:@"%@ ¥%@",m_orderM.m_orderFM.m_fastName,m_orderM.m_orderFM.m_fastFee];
            }
            else{
                cell.detailTextLabel.text = @"请选择配送方式";
            }
        }
        else if (indexPath.section == 2 && indexPath.row == 1){
            cell.textLabel.text = @"商品金额";
            cell.detailTextLabel.text = [NSString stringWithFormat:@"¥%@",m_orderM.m_orderPrice];
        }
        cell.textLabel.font = [NNCommonDeal getFont:14];
        cell.detailTextLabel.font = [NNCommonDeal getFont:14];
        return cell;
    }
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (m_orderDelegate && [m_orderDelegate respondsToSelector:@selector(orderSelectRowAt:)]) {
        if (indexPath.section == 0) {
            [m_orderDelegate orderSelectRowAt:0];
        }
        else if (indexPath.section == 2){
            [m_orderDelegate orderSelectRowAt:indexPath.section*10+indexPath.row];
        }
    }
}

@end