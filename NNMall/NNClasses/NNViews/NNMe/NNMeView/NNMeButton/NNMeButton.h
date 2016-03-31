//
//  NNMeButton.h
//  NNMall
//
//  Created by 马家俊 on 15/11/11.
//  Copyright © 2015年 shaoxu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NNMeButton : UIButton
{
    UILabel* redPot;
}
@property (nonatomic, strong) UILabel* redPot;
-(void)takeFront:(UIView*)view;
-(void)initRedPot;
@end
