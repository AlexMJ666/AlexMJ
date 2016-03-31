//
//  ProductModel.h
//  NNMall
//
//  Created by shaoxu on 15/11/5.
//  Copyright © 2015年 shaoxu. All rights reserved.
//

#import "NNBasicModel.h"
@interface ProductModel : NNBasicModel
{
    NSString *m_productId;        //商品id
    NSString *m_productName;      //商品名称
    NSString *m_productImgUrl;    //商品图片url（main）
    NSString *m_productPrice;     //商品原价
    NSString *m_productCost;      //商品现价
    
    BOOL     m_isProductsale;     //是否特价
    BOOL     m_isNewProduct;      //是否新产品
    
    NSMutableArray *m_allPicUrlArray;//所有图片地址
    NSString *m_saleCount;          //售出总数
    NSString *m_detailUrl;          //详情url
    NSString *m_buyCount;           //购买总数
    NSDictionary *m_specInfo;       //已购买的规格详情
    
    NSArray *m_sizeListArr;         //尺寸数组(ALL)
    NSMutableDictionary *m_sizeDictionary;  //尺寸字典
    
    //用于生成订单
    NSString *m_currentColor;       //选中颜色
    NSString *m_currentSize;        //选中尺码
    NSString *m_currentPrice;       //选中价格
    NSString *m_currentId;          //选中规格id
    NSInteger m_currentBuyCount;    //购买数量
    NSMutableArray *m_currentSizeArr;    //选中物品对应的尺寸
    BOOL      m_currentSelect;      //是否被选中购买
    
}
@property (nonatomic,strong) NSString *m_productId;
@property (nonatomic,strong) NSString *m_productName;
@property (nonatomic,strong) NSString *m_productImgUrl;
@property (nonatomic,strong) NSString *m_productPrice;
@property (nonatomic,strong) NSString *m_productCost;
@property (nonatomic,assign) BOOL     m_isProductsale;
@property (nonatomic,assign) BOOL     m_isNewProduct;

@property (nonatomic,strong) NSMutableArray *m_allPicUrlArray;
@property (nonatomic,strong) NSString *m_saleCount;
@property (nonatomic,strong) NSString *m_detailUrl;
@property (nonatomic,strong) NSString *m_buyCount;
@property (nonatomic,strong) NSDictionary *m_specInfo;
@property (nonatomic,strong) NSArray *m_sizeListArr;
@property (nonatomic,strong) NSMutableDictionary *m_sizeDictionary;

@property (nonatomic,strong) NSString *m_currentColor;
@property (nonatomic,strong) NSString *m_currentSize;
@property (nonatomic,strong) NSString *m_currentPrice;
@property (nonatomic,strong) NSString *m_currentId;
@property (nonatomic)        NSInteger m_currentBuyCount;
@property (nonatomic,strong) NSMutableArray *m_currentSizeArr;
@property (nonatomic,assign) BOOL      m_currentSelect;

-(id)parseFromDic:(NSDictionary *)dic;

@end