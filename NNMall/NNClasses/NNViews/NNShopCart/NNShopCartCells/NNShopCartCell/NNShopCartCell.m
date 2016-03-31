//
//  NNShopCartCell.m
//  NNMall
//
//  Created by shaoxu on 15/11/20.
//  Copyright © 2015年 shaoxu. All rights reserved.
//

#import "NNShopCartCell.h"

@implementation NNShopCartCell
@synthesize p_adjustBtn = m_adjustBtn;
@synthesize p_imageBtn = m_imageBtn;
@synthesize p_nameTextView = m_nameTextView;
@synthesize p_selectIco = m_selectIco;
@synthesize p_priceLbl = m_priceLbl;

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    // Configure the view for the selected state
}

@end
