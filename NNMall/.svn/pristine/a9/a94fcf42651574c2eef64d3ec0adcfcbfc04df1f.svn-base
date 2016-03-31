//
//  NNMeView.h
//  NNMall
//
//  Created by shaoxu on 15/11/3.
//  Copyright © 2015年 shaoxu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UserModel.h"
@protocol NNMeViewDelegate <NSObject>
-(void)changeHeaderDelegate:(UIButton*)sender;
-(void)viewGotoAccountDelegate:(UIButton*)sender;
-(void)statusBtnPressDelegate:(UIButton*)sender;
@end
@interface NNMeView : UIView
{
    __weak id<NNMeViewDelegate> m_nnMeViewDelegate;
}
@property(nonatomic,weak) id<NNMeViewDelegate> p_nnMeViewDelegate;

-(void)refreshMeViewData:(UserModel*)usreM;
@end
