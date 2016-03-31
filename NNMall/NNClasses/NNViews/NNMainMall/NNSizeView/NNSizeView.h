//
//  NNSizeView.h
//  NNMall
//
//  Created by shaoxu on 15/11/16.
//  Copyright © 2015年 shaoxu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ProductModel.h"

@protocol NNSizeDelegate <NSObject>

-(void)chooseProductSize:(ProductModel *)productM;
-(void)hideSize:(id)sender;

@end

@interface NNSizeView : UIView
{
    __weak id<NNSizeDelegate> m_nnSizeDelegate;
}
@property (nonatomic,weak) id<NNSizeDelegate> p_nnSizeDelegate;

-(void)refreshSizeData:(ProductModel *)productM;

@end
