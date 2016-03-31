//
//  OrderModel.h
//  NNMall
//
//  Created by shaoxu on 15/11/12.
//  Copyright © 2015年 shaoxu. All rights reserved.
//

#import "NNBasicModel.h"
#import "UserModel.h"
#import "ProductModel.h"
#import "AdreessModel.h"
#import "FastModel.h"

@interface OrderModel : NNBasicModel
{
    NSString *m_orderId;            //订单id
    NSString *m_orderCost;          //订单实付金额
    NSMutableArray *m_orderProArray;    //订单含有商品
    Orderstatus m_orderStatus;      //订单状态
    Paystatus m_payStatus;          //支付状态
    NSString *m_orderPrice;         //商品总价
    
    UserModel *m_orderUserM;        //购买用户
    AdreessModel *m_shipAddModel;   //收货人数据
    FastModel *m_orderFM;           //快递
}
@property (nonatomic,strong) NSString *m_orderId;
@property (nonatomic,strong) NSString *m_orderCost;
@property (nonatomic,strong) NSMutableArray *m_orderProArray;
@property (nonatomic,strong) NSString *m_orderPrice;
@property (nonatomic,assign) Orderstatus m_orderStatus;
@property (nonatomic,assign) Paystatus m_payStatus; 
@property (nonatomic,strong) UserModel *m_orderUserM;
@property (nonatomic,strong) AdreessModel *m_shipAddModel;
@property (nonatomic,strong) FastModel *m_orderFM;

-(id)parseFromDic:(NSDictionary *)dic;

@end
