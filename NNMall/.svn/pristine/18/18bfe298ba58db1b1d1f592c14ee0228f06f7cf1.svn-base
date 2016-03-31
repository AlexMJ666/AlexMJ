//
//  NNRecommendDailyView.h
//  NNMall
//
//  Created by shaoxu on 15/11/4.
//  Copyright © 2015年 shaoxu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ProductModel.h"

typedef void(^ReturnBlockSuccess)(id content);            //成功方法的回调的数据
typedef void(^ReturnBlockFaild)(id content);              //失败方法的回调的数据

@protocol NNRecommandDailyDelegate <NSObject>

@optional

/*! 显示物品详情
 *\param    param:          goodsM
 *\returns  return:         无
 */
-(void)productInfoFromRecommand:(ProductModel *)productM;

/*! 下拉刷新视图
 *\param    param:          无
 *\returns  return:         ReturnBlockSuccess:刷新RecommandGoods
 *\returns  return:         ReturnBlockFaild:失败提示
 */
-(void)refreshRecommandGoods:(ReturnBlockSuccess)returnBlock_ andFaild:(ReturnBlockFaild)returnFaild_;

/*! 上拉加载更多
 *\param    param:          无
 *\returns  return:         ReturnBlockSuccess:更多的RecommandGoods
 *\returns  return:         ReturnBlockFaild:失败提示
 */
-(void)loadMoreRecommandGoods:(ReturnBlockSuccess)returnBlock_ andFaild:(ReturnBlockFaild)returnFaild_;
@end

@interface NNRecommendDailyView : UIView
{
    __weak id<NNRecommandDailyDelegate> m_nnRecommandDailyDelegate;
}
@property (nonatomic,weak) id<NNRecommandDailyDelegate> p_nnRecommandDailyDelegate;

-(void)initMJRefreshView;
-(void)refreshRecommandDailyData:(NSMutableArray *)recommandArray;
@end
