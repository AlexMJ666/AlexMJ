//
//  NNOrderContentView.h
//  NNMall
//
//  Created by 马家俊 on 15/11/24.
//  Copyright © 2015年 shaoxu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OrderModel.h"
@protocol NNOrderContentViewDelegate <NSObject>


@end
@interface NNOrderContentView : UIView
{
    __weak id<NNOrderContentViewDelegate> m_NNOrderContentViewDelegate;
}

@property (nonatomic, weak) id<NNOrderContentViewDelegate> p_NNOrderContentViewDelegate;

-(void)refresgNNOrderContentView:(OrderModel*)orderM;
@end
