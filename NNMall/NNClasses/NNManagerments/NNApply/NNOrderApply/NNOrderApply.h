//
//  NNOrderApply.h
//  NNMall
//
//  Created by shaoxu on 15/11/19.
//  Copyright © 2015年 shaoxu. All rights reserved.
//

#import "NNBaseApply.h"

@interface NNOrderApply : NNBaseApply

/*!单例模式获取NNOrderApply对象
 *\param    param:          无
 *\returns  returns:        返回NNOrderApply对象
 */
+ (NNOrderApply *)shareInstanceManager;

/*! 释放取NNOrderApply对象
 *\param    param:          无
 *\returns  returns:        返回NNOrderApply对象
 */
- (void)dismissOrderApply;

/*! 生成订单
 *\param    param:          selectAddressID(地址id)
 *\param    param:          otherRequirement(备注)
 *\param    param:          products(商品ids字符串)
 *\returns  returns:        返回ReturnBlockContent对象
 *\returns  returns:        返回FaildReturnBlock对象
 */
- (void)requestSubmitOrder:(NSString *)addressId
             andProdcutIds:(NSString *)ids
            andExpressCode:(NSString *)codeId
            andRequirement:(NSString *)requirement
              andSucReturn:(ReturnBlockContent)returnBlock_
            andFaildReturn:(FaildReturnBlock)returnFaild_;

/*! 获取订单list
 *\param    param:          page
 *\param    param:          type
 *\returns  returns:        返回ReturnBlockContent对象
 *\returns  returns:        返回FaildReturnBlock对象
 */
- (void)requestOrderList:(NSString *)page
                 andType:(NSString *)type
            andSucReturn:(ReturnBlockContent)returnBlock_
            andFaildReturn:(FaildReturnBlock)returnFaild_;

/*! 获取订单详情
 *\param    param:          orderid
 *\returns  returns:        返回ReturnBlockContent对象
 *\returns  returns:        返回FaildReturnBlock对象
 */
- (void)requestOrderDetail:(NSString *)orderid
              andSucReturn:(ReturnBlockContent)returnBlock_
            andFaildReturn:(FaildReturnBlock)returnFaild_;

/*! 获取账户订单情况
 *\param    param:          report(待定)
 *\returns  returns:        返回ReturnBlockContent对象
 *\returns  returns:        返回FaildReturnBlock对象
 */
- (void)requestOrderReport:(NSString *)report
              andSucReturn:(ReturnBlockContent)returnBlock_
            andFaildReturn:(FaildReturnBlock)returnFaild_;

/*! 获取邮寄方式
 *\returns  returns:        返回ReturnBlockContent对象
 *\returns  returns:        返回FaildReturnBlock对象
 */
- (void)requestOrderFast:(ReturnBlockContent)returnBlock_
            andFaildReturn:(FaildReturnBlock)returnFaild_;
@end