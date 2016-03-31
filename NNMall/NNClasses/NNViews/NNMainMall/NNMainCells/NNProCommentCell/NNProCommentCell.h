//
//  NNProCommentCell.h
//  NNMall
//
//  Created by shaoxu on 15/11/20.
//  Copyright © 2015年 shaoxu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CommentModel.h"

@protocol NNProCommentDelegate <NSObject>

-(void)gotoComment:(id)sender;

@end

@interface NNProCommentCell : UITableViewCell
{
    __weak id<NNProCommentDelegate> m_nnProCommentDelegate;
}
@property (nonatomic,weak) id<NNProCommentDelegate> p_nnProCommnetDelegate;

-(void)refreshCommentData:(CommentModel *)commentModel;

@end
