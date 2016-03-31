//
//  NNMeButton.m
//  NNMall
//
//  Created by 马家俊 on 15/11/11.
//  Copyright © 2015年 shaoxu. All rights reserved.
//

#import "NNMeButton.h"

@implementation NNMeButton
@synthesize redPot;

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
     //Drawing code

    
}

-(void)initRedPot
{
    redPot = [[UILabel alloc]initWithFrame:CGRectMake(45, 10, 18, 18)];
    redPot.layer.masksToBounds = YES;
    redPot.layer.cornerRadius =  redPot.bounds.size.width/2;
    redPot.font = [UIFont fontWithName:@"Helvetica-Bold" size:12];
    redPot.textAlignment = NSTextAlignmentCenter;
    redPot.textColor = [UIColor whiteColor];
    redPot.backgroundColor = [UIColor redColor];
    [self addSubview:redPot];
}

-(void)takeFront:(UIView *)view
{
    [self bringSubviewToFront:view];
}

-(void)setRedPotText:(NSString*)text
{
    redPot.text = text;
}
@end
