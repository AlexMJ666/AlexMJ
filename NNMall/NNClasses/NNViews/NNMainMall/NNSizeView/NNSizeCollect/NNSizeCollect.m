//
//  NNSizeCollect.m
//  NNMall
//
//  Created by shaoxu on 15/11/21.
//  Copyright © 2015年 shaoxu. All rights reserved.
//

#import "NNSizeCollect.h"

@interface NNSizeCollect ()
{
    ProductModel *m_productM;
}
@property (nonatomic,strong) ProductModel *p_productM;
@end

@implementation NNSizeCollect
@synthesize p_sizeTitle = m_sizeTitle;
@synthesize p_productM = m_productM;
@synthesize p_haveSize = m_haveSize;
@synthesize p_nnSizeCollectDelegate = m_nnSizeCollectDelegate;

-(id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.p_sizeTitle = [UIButton buttonWithType:UIButtonTypeCustom];
        m_sizeTitle.titleLabel.font = [NNCommonDeal getFont:12];
        [m_sizeTitle setTitle:@"" forState:UIControlStateNormal];
        [m_sizeTitle setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [m_sizeTitle setBackgroundColor:Graycolor];
        m_sizeTitle.layer.masksToBounds = YES;
        m_sizeTitle.layer.cornerRadius = 5;
        [m_sizeTitle addTarget:self action:@selector(sizeClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.contentView addSubview:m_sizeTitle];
    }
    return self;
}

-(void)refreshSizeCollect:(NSString *)title
                   andKey:(NSString *)keyStr
              andProductM:(ProductModel *)productM
                 andWidth:(NSString *)width
{
    self.p_productM = productM;
    if ([keyStr isEqualToString:@"color"]) {
        m_sizeTitle.tag = 100;
    }
    if ([keyStr isEqualToString:@"size"]) {
        m_sizeTitle.tag = 101;
    }
    m_sizeTitle.frame = CGRectMake(0, 0, width.floatValue, self.frame.size.height);
    [m_sizeTitle setTitle:title forState:UIControlStateNormal];
    [self loadBtnColor:keyStr andTitle:title];
}


-(void)loadBtnColor:(NSString *)keyStr andTitle:(NSString *)title
{
    if ([keyStr isEqualToString:@"color"]) {
        if ([m_productM.m_currentColor isEqualToString:title]) {
            [m_sizeTitle setBackgroundColor:Redcolor];
        }else{
            [m_sizeTitle setBackgroundColor:Graycolor];
        }
    }
    else if ([keyStr isEqualToString:@"size"]){
        if ([m_productM.m_currentSize isEqualToString:title]) {
            [m_sizeTitle setBackgroundColor:Redcolor];
        }else{
            [m_sizeTitle setBackgroundColor:Graycolor];
        }
    }
}

-(void)sizeClick:(id)sender
{
    UIButton *btn = (UIButton *)sender;
    if (btn.tag == 100) {
        if ([m_productM.m_currentColor isEqualToString:btn.titleLabel.text]) {
            return;
        }
        m_productM.m_currentColor = btn.titleLabel.text;
        if (m_nnSizeCollectDelegate && [m_nnSizeCollectDelegate respondsToSelector:@selector(selectSizeBtn:)]) {
            [m_nnSizeCollectDelegate selectSizeBtn:@"color"];
        }
    }
    if (btn.tag == 101) {
        if (m_productM.m_currentColor.length==0) {
            [SVProgressHUD showInfoWithStatus:@"请选择颜色" maskType:SVProgressHUDMaskTypeNone];
            return;
        }
        if ([m_productM.m_currentSize isEqualToString:btn.titleLabel.text]) {
            return;
        }
        m_productM.m_currentSize = btn.titleLabel.text;
        if (m_nnSizeCollectDelegate && [m_nnSizeCollectDelegate respondsToSelector:@selector(selectSizeBtn:)]) {
            [m_nnSizeCollectDelegate selectSizeBtn:@"size"];
        }
    }
}

@end
