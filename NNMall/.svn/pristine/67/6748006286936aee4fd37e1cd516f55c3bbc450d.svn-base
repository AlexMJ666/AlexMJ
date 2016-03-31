//
//  NNCommentView.h
//  NNMall
//
//  Created by shaoxu on 15/11/20.
//  Copyright © 2015年 shaoxu. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^ReturnCommentSuc)(id content);            //成功方法的回调的数据
typedef void(^ReturnCommentFaild)(id content);              //失败方法的回调的数据

@protocol NNCommentDelegate <NSObject>

/*! 下拉刷新视图
 *\param    param:          无
 *\returns  return:         ReturnCommentSuc:刷新的新消息
 *\returns  return:         ReturnBlockFaild:失败提示
 */
-(void)refreshCommentList:(ReturnCommentSuc)returnBlock_ andFaild:(ReturnCommentFaild)returnFaild_;

/*! 上拉加载更多
 *\param    param:          无
 *\returns  return:         ReturnCommentSuc:更多的message
 *\returns  return:         ReturnBlockFaild:失败提示
 */
-(void)loadMoreCommentList:(ReturnCommentSuc)returnBlock_ andFaild:(ReturnCommentFaild)returnFaild_;

@end

@interface NNCommentView : UIView
{
    __weak id<NNCommentDelegate> m_nnCommentDelegate;
}
@property (nonatomic,weak) id<NNCommentDelegate> p_nnCommentDelegate;
-(void)initMJRefreshView;
-(void)refreshCommentData:(NSMutableArray *)commentArr;

@end
