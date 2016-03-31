//
//  NNOrderView.h
//  NNMall
//
//  Created by shaoxu on 15/11/12.
//  Copyright © 2015年 shaoxu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OrderModel.h"
@protocol  NNOrderDelegate <NSObject>

-(void)submitOrder:(id)sender;
-(void)orderSelectRowAt:(NSInteger)index;

@end

@interface NNOrderView : UIView
{
    __weak id<NNOrderDelegate> m_orderDelegate;
}
@property (nonatomic,weak) id<NNOrderDelegate> p_orderDelegate;


-(void)refreshOrderData:(OrderModel *)orderM;

@end
