//
//  NNCartView.h
//  NNMall
//
//  Created by shaoxu on 15/11/12.
//  Copyright © 2015年 shaoxu. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol NNCartDelegate <NSObject>

-(void)addProductToShoppingCart:(id)sender;

@end

@interface NNCartView : UIView
{
    __weak id<NNCartDelegate> m_nnCartDelegate;
}
@property (nonatomic,weak) id<NNCartDelegate> p_nnCartDelegate;

@end
