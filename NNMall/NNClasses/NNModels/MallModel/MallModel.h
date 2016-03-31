//
//  MallModel.h
//  NNMall
//
//  Created by shaoxu on 15/11/10.
//  Copyright © 2015年 shaoxu. All rights reserved.
//

#import "NNBasicModel.h"
#import "ProductModel.h"
@interface MallModel : NNBasicModel
{
    NSString *m_mallType;       //商品类型
    NSString *m_mallValue;      //类型对应键值
    NSMutableArray *m_productListArray; //商品数组
}

@property (nonatomic,strong) NSString *m_mallType;
@property (nonatomic,strong) NSString *m_mallValue;
@property (nonatomic,strong) NSMutableArray *m_productListArray;

-(id)parseFromDic:(NSDictionary *)dic;

@end
