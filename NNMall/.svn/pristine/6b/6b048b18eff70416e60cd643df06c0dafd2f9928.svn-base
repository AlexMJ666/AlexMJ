//
//  NNHttpRequest.h
//  NNMall
//
//  Created by shaoxu on 15/11/3.
//  Copyright © 2015年 shaoxu. All rights reserved.
//

#import "NNBaseHttpRequest.h"

@interface NNHttpRequest : NNBaseHttpRequest

/*!通过http数据交互 （POST）
 \*param            dic:                带参
 \*param            queryStr:           获取信息的str
 \*returns          无
 **/
-(void)requestWithPostData:(NSMutableDictionary *)dic
               andQueryStr:(NSString *)queryStr
           andSuccessBlock:(SuccessBlock)sucBlock_
            andFailedBlock:(FailedBlock)failedBlock_;

/*!通过http数据交互 （GET）
 \*param            dic:                带参
 \*param            queryStr:           获取信息的str
 \*returns          无
 **/
-(void)requestWithGetData:(NSMutableDictionary *)dic
                andUrlStr:(NSString *)UrlStr
          andSuccessBlock:(SuccessBlock)sucBlock_
           andFailedBlock:(FailedBlock)failedBlock_;

/*!通过http数据交互 （DEL）
 \*param            dic:                带参
 \*param            queryStr:           获取信息的str
 \*returns          无
 **/
-(void)requestWithDEL:(NSMutableDictionary *)dic
            andUrlStr:(NSString *)UrlStr
      andSuccessBlock:(SuccessBlock)sucBlock_
       andFailedBlock:(FailedBlock)failedBlock_;

@end
