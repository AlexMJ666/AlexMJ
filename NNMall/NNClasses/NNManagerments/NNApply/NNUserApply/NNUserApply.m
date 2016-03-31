//
//  NNUserApply.m
//  NNMall
//
//  Created by shaoxu on 15/11/10.
//  Copyright © 2015年 shaoxu. All rights reserved.
//

#import "NNUserApply.h"

static NNUserApply *g_userApply;

@implementation NNUserApply

+ (NNUserApply *)shareInstanceManager
{
    @synchronized(self)
    {
        if (!g_userApply)
        {
            g_userApply = [[NNUserApply alloc] init];
        }
    }
    return g_userApply;
}

- (void)dismissUserApply
{
    g_userApply = nil;
}

- (void)sendMessageVerifyCode:(NSString *)telNumber
                 andSucReturn:(ReturnBlockContent)returnBlock_
               andFaildReturn:(FaildReturnBlock)returnFaild_
{
    NNHttpRequest *requst = [[NNHttpRequest alloc]init];
    NSString *url = [NSString stringWithFormat:@"%@/jeeshop/api/sms/%@",NNHttpServiceUrl,telNumber];
    [requst requestWithGetData:nil andUrlStr:url andSuccessBlock:^(id backJson) {
        NSDictionary *dic = (NSDictionary *)backJson;
        NSLog(@"短信验证码：%@",dic.description);
        returnBlock_(backJson);
    } andFailedBlock:^(NNErrorModel *errorM) {
        returnFaild_(errorM);
    }];
}

- (void)loginNNMall:(NSString *)telNumber
            andCode:(NSString *)code
       andSucReturn:(ReturnBlockContent)returnBlock_
     andFaildReturn:(FaildReturnBlock)returnFaild_
{
    NNHttpRequest *requst = [[NNHttpRequest alloc]init];
    NSString *url = [NSString stringWithFormat:@"%@/jeeshop/api/account/login",NNHttpServiceUrl];
    NSMutableDictionary *dic = [[NSMutableDictionary alloc]init];
    [NNCommonDeal setSafetyObject:telNumber forKey:@"mobile" andDic:dic];
    [NNCommonDeal setSafetyObject:code forKey:@"code" andDic:dic];

    [requst requestWithPostData:dic andQueryStr:url andSuccessBlock:^(id backJson) {
        NSDictionary *dic = (NSDictionary *)backJson;
        NSLog(@"登录：%@",dic.description);
        returnBlock_(backJson);
    } andFailedBlock:^(NNErrorModel *errorM) {
        returnFaild_(errorM);
    }];
}

- (void)requestExpress:(ReturnBlockContent)returnBlock_
        andFaildReturn:(FaildReturnBlock)returnFaild_
{
    NNHttpRequest *requst = [[NNHttpRequest alloc]init];
    NSString *url = [NSString stringWithFormat:@"%@/jeeshop/api/account/address",NNHttpServiceUrl];
    [requst requestWithGetData:nil andUrlStr:url andSuccessBlock:^(id backJson) {
        NSDictionary *dic = (NSDictionary *)backJson;
        NSArray *addArr = [dic valueForKeyPath:@"list"];
        
        NSMutableArray *addressArr = [[NSMutableArray alloc]init];
        for (NSDictionary *addDic in addArr) {
            AdreessModel *addressModel = [[AdreessModel alloc] parseFromDic:addDic];
            [addressArr addObject:addressModel];
        }
        AppManage.p_currentUserM.m_adreess = addressArr;
        returnBlock_(addressArr);
    } andFailedBlock:^(NNErrorModel *errorM) {
        returnFaild_(errorM);
    }];
}

-(void)getDefaultAddress:(ReturnBlockContent)returnBlock_
          andFaildReturn:(FaildReturnBlock)returnFaild_
{
    NNHttpRequest *requst = [[NNHttpRequest alloc]init];
    NSString *url = [NSString stringWithFormat:@"%@/jeeshop/api/account/address/default",NNHttpServiceUrl];
    [requst requestWithGetData:nil andUrlStr:url andSuccessBlock:^(id backJson) {
        NSDictionary *dic = (NSDictionary *)backJson;
        AdreessModel *addressModel = [[AdreessModel alloc] parseFromDic:dic];
        returnBlock_(addressModel);
    } andFailedBlock:^(NNErrorModel *errorM) {
        returnFaild_(errorM);
    }];
}

@end