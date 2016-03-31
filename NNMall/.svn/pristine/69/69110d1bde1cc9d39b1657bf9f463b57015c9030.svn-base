//
//  NNCommentApply.h
//  NNMall
//
//  Created by shaoxu on 15/11/20.
//  Copyright © 2015年 shaoxu. All rights reserved.
//

#import "NNBaseApply.h"

@interface NNCommentApply : NNBaseApply

/*!单例模式获取NNCommentApply对象
 *\param    param:          无
 *\returns  returns:        返回NNCommentApply对象
 */
+ (NNCommentApply *)shareInstanceManager;

/*! 释放取NNCommentApply对象
 *\param    param:          无
 *\returns  returns:        返回NNCommentApply对象
 */
- (void)dismissCommentApply;

/*! 评论列表
 *\param    param:          productId(商品id)
 *\param    param:          page(页码)
 *\returns  returns:        返回NNCommentApply对象
 */
- (void)requestCommentList:(NSString *)productId
                   andPage:(NSString *)page
              andSucReturn:(ReturnBlockContent)returnBlock_
            andFaildReturn:(FaildReturnBlock)returnFaild_;

/*! 评论商品
 *\param    param:          productId(商品id)
 *\param    param:          orderId(订单id)
 *\param    param:          content(内容)
 *\returns  returns:        返回NNCommentApply对象
 */
- (void)requestComment:(NSString *)productId
            andOrderId:(NSString *)orderId
            andContent:(NSString *)content
          andSucReturn:(ReturnBlockContent)returnBlock_
        andFaildReturn:(FaildReturnBlock)returnFaild_;

@end
