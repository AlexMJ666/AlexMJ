//
//  NNProductApply.m
//  NNMall
//
//  Created by shaoxu on 15/11/10.
//  Copyright © 2015年 shaoxu. All rights reserved.
//

#import "NNProductApply.h"

static NNProductApply *g_productApply;

@implementation NNProductApply

+ (NNProductApply *)shareInstanceManager
{
    @synchronized(self)
    {
        if (!g_productApply)
        {
            g_productApply = [[NNProductApply alloc] init];
        }
    }
    return g_productApply;
}

- (void)dismissProductApply
{
    g_productApply = nil;
}

-(void)requestProductList:(ReturnBlockContent)returnBlock_
           andFaildReturn:(FaildReturnBlock)returnFaild_
{
    NNHttpRequest *requst = [[NNHttpRequest alloc]init];
    NSString *url = [NSString stringWithFormat:@"%@/jeeshop/api/product/list",NNHttpServiceUrl];
    [requst requestWithGetData:nil andUrlStr:url andSuccessBlock:^(id backJson) {
        NSDictionary *backDic = (NSDictionary *)backJson;
        NSArray *list = [backDic valueForKeyPath:@"data"];
        
        NSMutableArray *listMall = [[NSMutableArray alloc]init];
        for (int i=0; i<list.count; i++) {
            MallModel *mallM = [[MallModel alloc] parseFromDic:[list objectAtIndex:i]];
            [listMall addObject:mallM];
        }
        returnBlock_(listMall);
    } andFailedBlock:^(NNErrorModel *errorM) {
        returnFaild_(errorM);
    }];
}

-(void)requestMoreProductListWithType:(NSString *)type
                              andPage:(NSString *)page
                         andSucReturn:(ReturnBlockContent)returnBlock_
                       andFaildReturn:(FaildReturnBlock)returnFaild_
{
    NNHttpRequest *requst = [[NNHttpRequest alloc]init];
    NSString *url = [NSString stringWithFormat:@"%@/jeeshop/api/product/pagelist?type=%@&currentpage=%@",NNHttpServiceUrl,type,page];
    [requst requestWithGetData:nil andUrlStr:url andSuccessBlock:^(id backJson) {
        returnBlock_(backJson);
    } andFailedBlock:^(NNErrorModel *errorM) {
        returnFaild_(errorM);
    }];
}

-(void)requestProductDetail:(NSString *)productId
               andSucReturn:(ReturnBlockContent)returnBlock_
             andFaildReturn:(FaildReturnBlock)returnFaild_
{
    NNHttpRequest *requst = [[NNHttpRequest alloc]init];
    NSString *url = [NSString stringWithFormat:@"%@/jeeshop/api/product/detail/%@",NNHttpServiceUrl,productId];
    [requst requestWithGetData:nil andUrlStr:url andSuccessBlock:^(id backJson) {
        NSDictionary *backDic = (NSDictionary *)backJson;
        ProductModel *productM = [[ProductModel alloc]parseFromDic:[backDic valueForKeyPath:@"data"]];
        returnBlock_(productM);
    } andFailedBlock:^(NNErrorModel *errorM) {
        returnFaild_(errorM);
    }];
}

-(void)requestProductComment:(NSString *)productId
                     andPage:(NSString *)page
                andSucReturn:(ReturnBlockContent)returnBlock_
              andFaildReturn:(FaildReturnBlock)returnFaild_
{
    NNHttpRequest *requst = [[NNHttpRequest alloc]init];
    NSString *url = [NSString stringWithFormat:@"%@/jeeshop/api/comment/%@?currentpage=%@",NNHttpServiceUrl,productId,page];
    [requst requestWithGetData:nil andUrlStr:url andSuccessBlock:^(id backJson) {
        NSDictionary *backDic = (NSDictionary *)backJson;
        NSMutableArray *commentArray = [[NSMutableArray alloc]init];
        
        NSArray *commentList = [[backDic valueForKeyPath:@"data"] valueForKeyPath:@"list"];
        for (NSDictionary *dic in commentList) {
            CommentModel *commentM = [[CommentModel alloc]parseFromDic:dic];
            [commentArray addObject:commentM];
        }
        returnBlock_(commentArray);
    } andFailedBlock:^(NNErrorModel *errorM) {
        returnFaild_(errorM);
    }];
}

-(void)requestAddToShoppingCart:(NSString *)productId
                    andBuyCount:(NSString *)buyCount
                      andSpecId:(NSString *)sepcId
                   andSucReturn:(ReturnBlockContent)returnBlock_
                 andFaildReturn:(FaildReturnBlock)returnFaild_
{
    NNHttpRequest *requst = [[NNHttpRequest alloc]init];
    NSString *url = [NSString stringWithFormat:@"%@/jeeshop/api/cart/addtocart",NNHttpServiceUrl];
    NSMutableDictionary *dic = [[NSMutableDictionary alloc]init];
    [NNCommonDeal setSafetyObject:productId forKey:@"productID" andDic:dic];
    [NNCommonDeal setSafetyObject:buyCount forKey:@"buyCount" andDic:dic];
    [NNCommonDeal setSafetyObject:sepcId forKey:@"buySpecID" andDic:dic];
    [requst requestWithPostData:dic andQueryStr:url andSuccessBlock:^(id backJson) {
        returnBlock_(backJson);
    } andFailedBlock:^(NNErrorModel *errorM) {
        returnFaild_(errorM);
    }];
}

-(void)requestShoppingCartList:(NSString *)userId
                  andSucReturn:(ReturnBlockContent)returnBlock_
                andFaildReturn:(FaildReturnBlock)returnFaild_
{
    NNHttpRequest *requst = [[NNHttpRequest alloc]init];
    NSString *url = [NSString stringWithFormat:@"%@/jeeshop/api/cart/list",NNHttpServiceUrl];
    
    [requst requestWithGetData:nil andUrlStr:url andSuccessBlock:^(id backJson) {
        NSDictionary *backDic = (NSDictionary *)backJson;
        NSMutableArray *cartList = [[NSMutableArray alloc]init];
        
        NSArray *arr = [[backDic valueForKeyPath:@"data"] valueForKeyPath:@"list"];
        for (NSDictionary *dic in arr) {
            ProductModel *productM = [[ProductModel alloc]parseFromDic:dic];
            [cartList addObject:productM];
        }
        returnBlock_(cartList);
    } andFailedBlock:^(NNErrorModel *errorM) {
        returnFaild_(errorM);
    }];
}

@end
