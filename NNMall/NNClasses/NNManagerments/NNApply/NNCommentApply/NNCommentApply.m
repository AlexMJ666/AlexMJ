//
//  NNCommentApply.m
//  NNMall
//
//  Created by shaoxu on 15/11/20.
//  Copyright © 2015年 shaoxu. All rights reserved.
//

#import "NNCommentApply.h"

static NNCommentApply *g_commentApply;

@implementation NNCommentApply

+ (NNCommentApply *)shareInstanceManager
{
    @synchronized(self)
    {
        if (!g_commentApply)
        {
            g_commentApply = [[NNCommentApply alloc] init];
        }
    }
    return g_commentApply;
}

- (void)dismissCommentApply
{
    g_commentApply = nil;
}

- (void)requestCommentList:(NSString *)productId
                   andPage:(NSString *)page
              andSucReturn:(ReturnBlockContent)returnBlock_
            andFaildReturn:(FaildReturnBlock)returnFaild_
{
    NNHttpRequest *requst = [[NNHttpRequest alloc]init];
    NSString *url = [NSString stringWithFormat:@"%@/jeeshop/api/comment/%@?currentpage=%@",NNHttpServiceUrl,productId,page];
    [requst requestWithGetData:nil andUrlStr:url andSuccessBlock:^(id backJson) {
        NSDictionary *dic = (NSDictionary *)backJson;
        NSArray *commentList = [[dic valueForKeyPath:@"data"] valueForKeyPath:@"list"];
        NSString *total = [[dic valueForKeyPath:@"data"] valueForKeyPath:@"total"];
        NSMutableArray *commentArr = [[NSMutableArray alloc]init];
        for (NSDictionary *commentDic in commentList) {
            CommentModel *commentM = [[CommentModel alloc]parseFromDic:commentDic];
            commentM.m_total = total;
            [commentArr addObject:commentM];
        }
        
        returnBlock_(commentArr);
    } andFailedBlock:^(NNErrorModel *errorM) {
        returnFaild_(errorM);
    }];
}

- (void)requestComment:(NSString *)productId
            andOrderId:(NSString *)orderId
            andContent:(NSString *)content
          andSucReturn:(ReturnBlockContent)returnBlock_
        andFaildReturn:(FaildReturnBlock)returnFaild_
{
    NNHttpRequest *requst = [[NNHttpRequest alloc]init];
    NSString *url = [NSString stringWithFormat:@"%@/jeeshop/api/order/rate/%@",NNHttpServiceUrl,orderId];
    NSMutableDictionary *dic = [[NSMutableDictionary alloc]init];
    [NNCommonDeal setSafetyObject:productId forKey:@"productid" andDic:dic];
    [NNCommonDeal setSafetyObject:content forKey:@"content" andDic:dic];
    [requst requestWithPostData:dic andQueryStr:url andSuccessBlock:^(id backJson) {
        returnBlock_(backJson);
    } andFailedBlock:^(NNErrorModel *errorM) {
        returnFaild_(errorM);
    }];

}

@end
