//
//  NNProductCell.m
//  NNMall
//
//  Created by shaoxu on 15/11/11.
//  Copyright © 2015年 shaoxu. All rights reserved.
//

#import "NNProductCell.h"

@interface NNProductCell ()
{
    UILabel     *m_proNameLbl;
    UILabel     *m_proPriceLbl;
    UIImageView *m_serviceIco;
    UILabel     *m_serviceLbl;
    UIImageView *m_propmtIco;
    UILabel     *m_propmtLbl;
}
@property (nonatomic,strong) UILabel     *p_proNameLbl;
@property (nonatomic,strong) UILabel     *p_proPriceLbl;
@property (nonatomic,strong) UIImageView *p_serviceIco;
@property (nonatomic,strong) UILabel     *p_serviceLbl;
@property (nonatomic,strong) UIImageView *p_propmtIco;
@property (nonatomic,strong) UILabel     *p_propmtLbl;
@end

@implementation NNProductCell
@synthesize p_proNameLbl = m_proNameLbl;
@synthesize p_propmtIco = m_propmtIco;
@synthesize p_propmtLbl = m_propmtLbl;
@synthesize p_proPriceLbl = m_proPriceLbl;
@synthesize p_serviceIco = m_serviceIco;
@synthesize p_serviceLbl = m_serviceLbl;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.p_proNameLbl = [[UILabel alloc]init];
        m_proNameLbl.font = [NNCommonDeal getFont:16];
        m_proNameLbl.numberOfLines = 0;
        m_proNameLbl.adjustsFontSizeToFitWidth = YES;
        [self.contentView addSubview:m_proNameLbl];
        
        self.p_proPriceLbl = [[UILabel alloc]init];
        m_proPriceLbl.adjustsFontSizeToFitWidth = YES;
        [self.contentView addSubview:m_proPriceLbl];
        
        self.p_serviceIco = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"heart.png"]];
        [self.contentView addSubview:m_serviceIco];
        self.p_serviceLbl = [[UILabel alloc]init];
        m_serviceLbl.font = [NNCommonDeal getFont:12];
        m_serviceLbl.attributedText = [self getStringValue:@"服务  由暖暖商城发货并提供售后服务"];
        [self.contentView addSubview:m_serviceLbl];
        
        self.p_propmtIco = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"heart-p.png"]];
        [self.contentView addSubview:m_propmtIco];
        self.p_propmtLbl = [[UILabel alloc]init];
        m_propmtLbl.font = [NNCommonDeal getFont:12];
        m_propmtLbl.attributedText = [self getStringValue:@"提示  支持7天无理由退款"];
        [self.contentView addSubview:m_propmtLbl];
        
    }
    return self;
}

- (NSMutableAttributedString *)getStringValue:(NSString *)str
{
    NSMutableAttributedString *attr = [[NSMutableAttributedString alloc]initWithString:str];
    [attr addAttribute:NSForegroundColorAttributeName value:NavRedcolor range:NSMakeRange(0, 2)];
    [attr addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:12] range:NSMakeRange(0, 2)];
    
    [attr addAttribute:NSForegroundColorAttributeName value:[UIColor grayColor] range:NSMakeRange(2, str.length-2)];
    [attr addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:12] range:NSMakeRange(2, str.length-2)];
    
    return attr;
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)createProductCellView:(ProductModel *)productM andNameHeight:(CGFloat)height
{
    CGFloat newHeight = height;
    if (newHeight<=42.0f) {
        newHeight = 42.0f;
    }
    
    m_proNameLbl.frame = CGRectMake(15, 10, kMainScreen_Width-30, newHeight);
    m_proPriceLbl.frame = CGRectMake(m_proNameLbl.frame.origin.x, m_proNameLbl.frame.origin.y+newHeight+15, kMainScreen_Width-30, 42);
    m_serviceIco.frame = CGRectMake(m_proNameLbl.frame.origin.x, m_proPriceLbl.frame.origin.y+m_proPriceLbl.frame.size.height+24, 18, 18);
    m_serviceLbl.frame = CGRectMake(m_serviceIco.frame.origin.x+m_serviceIco.frame.size.width+8, m_serviceIco.frame.origin.y, 200, 18);
    
    m_propmtIco.frame = CGRectMake(m_proNameLbl.frame.origin.x, m_serviceIco.frame.origin.y+m_serviceIco.frame.size.height+4, 18, 18);
    m_propmtLbl.frame = CGRectMake(m_propmtIco.frame.origin.x+m_propmtIco.frame.size.width+8, m_propmtIco.frame.origin.y, 200, 18);
    
    m_proNameLbl.text = productM.m_productName;
    m_proPriceLbl.attributedText = [NNCommonDeal getOldPrice:productM.m_productPrice andNewPrice:productM.m_productCost andOldFontSize:16.0f andNewFontSize:30.0f];
    
}

@end
