//
//  NNProductApply.h
//  NNMall
//
//  Created by shaoxu on 15/11/10.
//  Copyright © 2015年 shaoxu. All rights reserved.
//

#import "NNBaseApply.h"

@interface NNProductApply : NNBaseApply

/*!单例模式获取NNProductApply对象
 *\param    param:          无
 *\returns  returns:        返回NNProductApply对象
 */
+ (NNProductApply *)shareInstanceManager;

/*! 释放取NNProductApply对象
 *\param    param:          无
 *\returns  returns:        返回NNProductApply对象
 */
- (void)dismissProductApply;

/*! 获取商城首页的商品列表
 *\param    param:          无
 *\returns  returns:        返回returnBlock_对象
 *\returns  returns:        返回returnFaild_对象
 */
-(void)requestProductList:(ReturnBlockContent)returnBlock_
           andFaildReturn:(FaildReturnBlock)returnFaild_;

/*! 获取类别更多列表
 *\param    param:          type(类别)
 *\param    param:          page(页码)
 *\returns  returns:        返回returnBlock_对象
 *\returns  returns:        返回returnFaild_对象
 */
-(void)requestMoreProductListWithType:(NSString *)type
                              andPage:(NSString *)page
                         andSucReturn:(ReturnBlockContent)returnBlock_
                       andFaildReturn:(FaildReturnBlock)returnFaild_;

/*! 获取商品详情
 *\param    param:          productid(id)
 *\returns  returns:        返回returnBlock_对象
 *\returns  returns:        返回returnFaild_对象
 */
-(void)requestProductDetail:(NSString *)productId
               andSucReturn:(ReturnBlockContent)returnBlock_
             andFaildReturn:(FaildReturnBlock)returnFaild_;

/*! 获取商品的评论
 *\param    param:          productid(id)
 *\param    param:          page(页码)
 *\returns  returns:        返回returnBlock_对象
 *\returns  returns:        返回returnFaild_对象
 */
-(void)requestProductComment:(NSString *)productId
                     andPage:(NSString *)page
                andSucReturn:(ReturnBlockContent)returnBlock_
              andFaildReturn:(FaildReturnBlock)returnFaild_;

/*! 加入购物车
 *\param    param:          productid(id)
 *\param    param:          buyCount(数量)
 *\param    param:          sepcId(物品尺寸对应的id)
 *\returns  returns:        返回returnBlock_对象
 *\returns  returns:        返回returnFaild_对象
 */
-(void)requestAddToShoppingCart:(NSString *)productId
                    andBuyCount:(NSString *)buyCount
                      andSpecId:(NSString *)sepcId
                   andSucReturn:(ReturnBlockContent)returnBlock_
                 andFaildReturn:(FaildReturnBlock)returnFaild_;

/*! 获取购物车列表
 *\param    param:          userid(用户id)
 *\returns  returns:        返回returnBlock_对象
 *\returns  returns:        返回returnFaild_对象
 */
-(void)requestShoppingCartList:(NSString *)userId
                  andSucReturn:(ReturnBlockContent)returnBlock_
                andFaildReturn:(FaildReturnBlock)returnFaild_;

///*! 搜索商品
// *\param    param:          keyword
// *\returns  returns:        返回returnBlock_对象
// *\returns  returns:        返回returnFaild_对象
// */
//-(void)requestShoppingCartList:(NSString *)userId
//                  andSucReturn:(ReturnBlockContent)returnBlock_
//                andFaildReturn:(FaildReturnBlock)returnFaild_;

@end
