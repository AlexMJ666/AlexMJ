//
//  NNProCommentCell.m
//  NNMall
//
//  Created by shaoxu on 15/11/20.
//  Copyright © 2015年 shaoxu. All rights reserved.
//

#import "NNProCommentCell.h"

@interface NNProCommentCell ()
{
    UILabel     *m_commentNameLbl;
    UIButton    *m_moreBtn;
    UIImageView *m_headIco;
    UILabel     *m_nameLbl;
    UILabel     *m_conetentLbl;
    UILabel     *m_timeLbl;
}
@property (nonatomic,strong) UILabel *p_commentNameLbl;
@property (nonatomic,strong) UIButton *p_moreBtn;
@property (nonatomic,strong) UIImageView *p_headIco;
@property (nonatomic,strong) UILabel *p_nameLbl;
@property (nonatomic,strong) UILabel *p_conetentLbl;
@property (nonatomic,strong) UILabel *p_timeLbl;
@end

@implementation NNProCommentCell
@synthesize p_commentNameLbl = m_commentNameLbl;
@synthesize p_conetentLbl = m_conetentLbl;
@synthesize p_headIco = m_headIco;
@synthesize p_moreBtn = m_moreBtn;
@synthesize p_nameLbl = m_nameLbl;
@synthesize p_timeLbl = m_timeLbl;
@synthesize p_nnProCommnetDelegate = m_nnProCommentDelegate;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.p_commentNameLbl = [[UILabel alloc]initWithFrame:CGRectMake(15, 10, kMainScreen_Width-100, 22)];
        m_commentNameLbl.text = @"商品评价";
        m_commentNameLbl.font = [NNCommonDeal getFont:16];
        [self.contentView addSubview:m_commentNameLbl];
        
        self.p_moreBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        m_moreBtn.frame = CGRectMake(kMainScreen_Width-75, 8, 60, 26);
        m_moreBtn.titleLabel.font = [NNCommonDeal getFont:14];
        [m_moreBtn setTitle:@"更多" forState:UIControlStateNormal];
        [m_moreBtn setTitleColor:Redcolor forState:UIControlStateNormal];
        m_moreBtn.layer.masksToBounds = YES;
        m_moreBtn.layer.cornerRadius = 5;
        m_moreBtn.layer.borderColor = Redcolor.CGColor;
        m_moreBtn.layer.borderWidth = 1;
        [m_moreBtn addTarget:self action:@selector(moreBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.contentView addSubview:m_moreBtn];
        
        self.p_headIco = [[UIImageView alloc]initWithFrame:CGRectMake(21, 53, 20, 20)];
        m_headIco.layer.masksToBounds = YES;
        m_headIco.layer.cornerRadius = 10;
        m_headIco.backgroundColor = [UIColor grayColor];
        [self.contentView addSubview:m_headIco];
        
        self.p_nameLbl = [[UILabel alloc]initWithFrame:CGRectMake(51, 55, kMainScreen_Width-66, 17)];
        m_nameLbl.font = [NNCommonDeal getFont:12];
        [self.contentView addSubview:m_nameLbl];
        
        self.p_conetentLbl = [[UILabel alloc]initWithFrame:CGRectMake(15, 83, kMainScreen_Width-30, 20)];
        m_conetentLbl.font = [NNCommonDeal getFont:12];
        m_conetentLbl.text = @"暂无评价";
        m_conetentLbl.numberOfLines = 0;
        m_conetentLbl.textAlignment = NSTextAlignmentCenter;
        [self.contentView addSubview:m_conetentLbl];
        
        self.p_timeLbl = [[UILabel alloc]initWithFrame:CGRectMake(15, 105, kMainScreen_Width-30, 17)];
        m_timeLbl.font = [NNCommonDeal getFont:12];
        m_timeLbl.textColor = Commentcolor;
        [self.contentView addSubview:m_timeLbl];
        
    }
    return self;
}


- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)moreBtnClick:(id)sender
{
    if (m_nnProCommentDelegate && [m_nnProCommentDelegate respondsToSelector:@selector(gotoComment:)]) {
        [m_nnProCommentDelegate gotoComment:nil];
    }
}

-(void)refreshCommentData:(CommentModel *)commentModel
{
    if (commentModel) {
        m_commentNameLbl.text = [NSString stringWithFormat:@"商品评价(%@)",commentModel.m_total];
        m_nameLbl.text = commentModel.m_nickName;
        if (commentModel.m_content.length>0) {
            m_conetentLbl.text = commentModel.m_content;
            m_conetentLbl.textAlignment = NSTextAlignmentLeft;
        }
        CGSize contentSize = [commentModel.m_content boundingRectWithSize:CGSizeMake(kMainScreen_Width-30, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:12]} context:nil].size;
        if (contentSize.height>20) {
            m_conetentLbl.frame = CGRectMake(15, 83, kMainScreen_Width-30, contentSize.height);
            m_timeLbl.frame = CGRectMake(15, m_conetentLbl.frame.origin.y+contentSize.height, kMainScreen_Width-30, 17);
        }

        m_timeLbl.text = commentModel.m_commentTime;
        m_moreBtn.hidden = NO;
        m_headIco.hidden = NO;
    }
    else{
        m_moreBtn.hidden = YES;
        m_headIco.hidden = YES;
    }
}

@end
