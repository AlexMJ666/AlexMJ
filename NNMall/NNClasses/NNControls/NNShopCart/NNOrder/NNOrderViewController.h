//
//  NNOrderViewController.h
//  NNMall
//
//  Created by shaoxu on 15/11/12.
//  Copyright © 2015年 shaoxu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OrderModel.h"
@interface NNOrderViewController : NNRootViewController
{
    OrderModel *m_orderModel;
}
@property (nonatomic,strong) OrderModel *p_orderModel;
@end
