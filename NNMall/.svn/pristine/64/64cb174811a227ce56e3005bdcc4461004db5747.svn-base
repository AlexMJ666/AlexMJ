//
//  NNMyOrderCell.m
//  NNMall
//
//  Created by 马家俊 on 15/11/17.
//  Copyright © 2015年 shaoxu. All rights reserved.
//

#import "NNMyOrderCell.h"
#import <SDWebImage/UIImageView+WebCache.h>
@implementation NNMyOrderCell
@synthesize p_NNMyOrderCellDelegate = m_NNMyOrderCellDelegate;
@synthesize p_content = m_content;
@synthesize p_count = m_count;
@synthesize p_price = m_price;
@synthesize p_productImg = m_productImg;
- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)refreshMyOrderCell:(OrderModel *)orderM andIndexRow:(NSIndexPath*)indexPath
{
    ProductModel* proDuctM = (ProductModel*)[orderM.m_orderProArray objectAtIndex:indexPath.row];
    [m_productImg sd_setImageWithURL:[NSURL URLWithString:proDuctM.m_productImgUrl]placeholderImage:[AppManage getDefaultImage:@"84"]];
    m_price.text = proDuctM.m_productPrice;
    m_count.text = [NSString stringWithFormat:@"x%@",proDuctM.m_buyCount];
    m_content.text = proDuctM.m_productName;
}
@end
