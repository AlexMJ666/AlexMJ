//
//  NNProductInfoView.h
//  NNMall
//
//  Created by shaoxu on 15/11/5.
//  Copyright © 2015年 shaoxu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ProductModel.h"
#import "CommentModel.h"
@protocol NNProductInfoDelegate <NSObject>

-(void)chooseSizeWithProduct:(id)sender;
-(void)lookCommentList:(id)sender;
@end

@interface NNProductInfoView : UIView
{
    __weak id<NNProductInfoDelegate> m_nnProductInfoDelegate;
}
@property (nonatomic,weak) id<NNProductInfoDelegate> p_nnProductInfoDelegate;

-(void)initProduct;
-(void)refreshProductInfoData:(ProductModel *)productM;
-(void)refreshCommentData:(NSMutableArray *)commentList;

@end
