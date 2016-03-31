//
//  MallModel.m
//  NNMall
//
//  Created by shaoxu on 15/11/10.
//  Copyright © 2015年 shaoxu. All rights reserved.
//

#import "MallModel.h"

@implementation MallModel
@synthesize m_mallType;
@synthesize m_mallValue;
@synthesize m_productListArray;

-(id)init
{
    self = [super init];
    if (self) {
        m_mallType  = @"";
        m_mallValue  = @"";
        m_productListArray = [[NSMutableArray alloc]init];
    }
    return self;
}

-(id)parseFromDic:(NSDictionary *)dic
{
    if ([self init]) {
        if ([NNCommonDeal jugementStringIsNil:[dic valueForKeyPath:@"type"]]) {
            self.m_mallType = @"";
        }else{
            self.m_mallType = [NSString stringWithFormat:@"%@",[dic valueForKeyPath:@"type"]];
        }
        
        if ([NNCommonDeal jugementStringIsNil:[dic valueForKeyPath:@"value"]]) {
            self.m_mallValue = @"";
        }else{
            self.m_mallValue = [NSString stringWithFormat:@"%@",[dic valueForKeyPath:@"value"]];
        }
        
        if (![NNCommonDeal jugementArrIsNil:[dic valueForKeyPath:@"productList"]]) {
            NSArray *proList = [dic valueForKeyPath:@"productList"];
            for (int i=0; i<proList.count; i++) {
                NSDictionary *proDic = [proList objectAtIndex:i];
                ProductModel *productM = [[ProductModel alloc]parseFromDic:proDic];
                [m_productListArray addObject:productM];
            }
        }
    }
    return self;
}


@end
