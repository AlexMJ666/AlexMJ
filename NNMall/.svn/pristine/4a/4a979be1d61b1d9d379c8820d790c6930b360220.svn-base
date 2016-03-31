//
//  NNFastListView.h
//  NNMall
//
//  Created by shaoxu on 15/11/23.
//  Copyright © 2015年 shaoxu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OrderModel.h"

@protocol NNFastListDelegate <NSObject>

-(void)chooseFastToBack:(id)sender;

@end
@interface NNFastListView : UIView
{
    __weak id<NNFastListDelegate> m_nnFastListDelegate;
}
@property (nonatomic,weak)id<NNFastListDelegate> p_nnFastListDelegate;

-(void)refreshFastData:(NSMutableArray *)fastList andOrderModel:(OrderModel *)orderM;

@end
