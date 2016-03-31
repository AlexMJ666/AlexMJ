//
//  AdreessDetailCell.m
//  NNMall
//
//  Created by 马家俊 on 15/11/16.
//  Copyright © 2015年 shaoxu. All rights reserved.
//

#import "AdreessDetailCell.h"

@implementation AdreessDetailCell
@synthesize p_detailAdreess = m_detailAdreess;
@synthesize p_name = m_name;
@synthesize p_AdreessDetailCellDelegate = m_AdreessDetailCellDelegate;
@synthesize p_contact = m_contact;
- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(IBAction)modifyAdreess:(id)sender
{
    
}

-(void)refreshAdreessDetailCell:(AdreessModel *)adreessM
{
    if (!adreessM.m_isDefault) {
        m_name.text = [NSString stringWithFormat:@"收货人: %@    联系电话: %@",adreessM.m_name,adreessM.m_contact];
        
        NSMutableAttributedString *str = [[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@"（默认）详细地址: %@",adreessM.m_detailAdreess]];
        [str addAttribute:NSForegroundColorAttributeName value:[UIColor redColor] range:NSMakeRange(0,4)];
        
        m_detailAdreess.attributedText = str;
    }else
    {
        m_name.text = [NSString stringWithFormat:@"收货人: %@    联系电话: %@",adreessM.m_name,adreessM.m_contact];
        m_detailAdreess.text = [NSString stringWithFormat:@"详细地址: %@",adreessM.m_detailAdreess];
    }

}
-(void)refreshAdreessDetailCellFromOrderContent:(AdreessModel *)adreessM
{
    m_name.text = adreessM.m_name;
    m_contact.text = adreessM.m_contact;
    m_detailAdreess.text = adreessM.m_detailAdreess;
}
@end
