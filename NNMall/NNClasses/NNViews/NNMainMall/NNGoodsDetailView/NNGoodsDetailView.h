//
//  NNGoodsDetailView.h
//  NNMall
//
//  Created by shaoxu on 15/11/4.
//  Copyright © 2015年 shaoxu. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol NNGoodsDetailDelegate <NSObject>



@end

@interface NNGoodsDetailView : UIView
{
    __weak id<NNGoodsDetailDelegate> m_nnGoodsDetailDelegate;
}
@property (nonatomic,weak) id<NNGoodsDetailDelegate> p_nnGoodsDetailDelegate;

@end
