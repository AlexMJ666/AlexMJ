//
//  NNAddressCell.m
//  NNMall
//
//  Created by shaoxu on 15/11/13.
//  Copyright © 2015年 shaoxu. All rights reserved.
//

#import "NNAddressCell.h"

@implementation NNAddressCell
@synthesize p_nameLbl = m_nameLbl;
@synthesize p_addressLbl = m_addressLbl;
@synthesize p_phoneLbl = m_phoneLbl;

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)refreshAddressData:(AdreessModel *)addressM
{
    self.p_nameLbl.text = [NSString stringWithFormat:@"收货人：%@",addressM.m_name];
    self.p_phoneLbl.text = [NSString stringWithFormat:@"联系方式：%@",addressM.m_contact];
    self.p_addressLbl.text = [NSString stringWithFormat:@"收货地址：%@",addressM.m_detailAdreess];
    self.p_nameLbl.font = [NNCommonDeal getFont:16];
//    self.p_addressLbl.font = [NNCommonDeal getFont:14];
    CGFloat height = [NNCommonDeal getTextHeight:[NSString stringWithFormat:@"收货地址：%@",addressM.m_detailAdreess] andWidth:kMainScreen_Width-63 andFontSize:12];
    if (height>20) {
        CGRect tempFrame = m_addressLbl.frame;
        tempFrame.size.height = height;
        m_addressLbl.frame = tempFrame;
    }
}

@end
