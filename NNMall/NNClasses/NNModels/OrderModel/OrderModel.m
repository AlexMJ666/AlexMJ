//
//  OrderModel.m
//  NNMall
//
//  Created by shaoxu on 15/11/12.
//  Copyright © 2015年 shaoxu. All rights reserved.
//

#import "OrderModel.h"

@implementation OrderModel
@synthesize m_orderCost;
@synthesize m_orderId;
@synthesize m_orderProArray;
@synthesize m_orderUserM;
@synthesize m_shipAddModel;
@synthesize m_orderFM;
@synthesize m_orderPrice;
@synthesize m_orderStatus;
@synthesize m_payStatus;

-(id)init
{
    self = [super init];
    if (self) {
        m_orderId  = @"";
        m_orderCost  = @"";
        m_orderPrice = @"";
        m_orderProArray = [[NSMutableArray alloc]init];
        
        m_orderFM = [[FastModel alloc]init];
    }
    return self;
}

-(id)parseFromDic:(NSDictionary *)dic
{
    if ([self init]) {
        
        if ([NNCommonDeal jugementStringIsNil:[dic valueForKeyPath:@"id"]]) {
            self.m_orderId = @"";
        }else{
            self.m_orderId = [NSString stringWithFormat:@"%@",[dic valueForKeyPath:@"id"]];
        }
        
        if ([NNCommonDeal jugementStringIsNil:[dic valueForKeyPath:@"amount"]]) {
            self.m_orderCost = @"";
        }else{
            self.m_orderCost = [NSString stringWithFormat:@"%@",[dic valueForKeyPath:@"amount"]];
        }
        
        if ([NNCommonDeal jugementStringIsNil:[dic valueForKeyPath:@"paystatus"]]) {
            self.m_payStatus = defaultPay;
        }else{
            NSString *payStatus = [NSString stringWithFormat:@"%@",[dic valueForKeyPath:@"paystatus"]];
            if ([payStatus isEqualToString:@"n"]) {
                self.m_payStatus = order_paystatus_unpaid;
            }
            else if ([payStatus isEqualToString:@"p"]) {
                self.m_payStatus = order_paystatus_partpaid;
            }
            else if ([payStatus isEqualToString:@"y"]) {
                self.m_payStatus = order_paystatus_paid;
            }
            else{
                self.m_payStatus = defaultPay;
            }
        }
        
        if ([NNCommonDeal jugementStringIsNil:[dic valueForKeyPath:@"status"]]) {
            self.m_orderStatus = defaultStatus;
        }else{
            NSString *payStatus = [NSString stringWithFormat:@"%@",[dic valueForKeyPath:@"status"]];
            if ([payStatus isEqualToString:@"init"]) {
                self.m_orderStatus = order_status_init;
            }
            else if ([payStatus isEqualToString:@"pass"]) {
                self.m_orderStatus = order_status_pass;
            }
            else if ([payStatus isEqualToString:@"send"]) {
                self.m_orderStatus = order_status_send;
            }
            else if ([payStatus isEqualToString:@"sign"]) {
                self.m_orderStatus = order_status_sign;
            }
            else if ([payStatus isEqualToString:@"cancel"]) {
                self.m_orderStatus = order_status_cancel;
            }
            else if ([payStatus isEqualToString:@"file"]) {
                self.m_orderStatus = order_status_file;
            }
            else{
                self.m_payStatus = defaultStatus;
            }
        }
        
        if (![NNCommonDeal jugementArrIsNil:[dic valueForKeyPath:@"products"]]) {
            NSArray *productList = [dic valueForKeyPath:@"products"];
            for (NSDictionary *productDic in productList) {
                ProductModel *productM = [[ProductModel alloc]parseFromDic:productDic];
                [self.m_orderProArray addObject:productM];
            }
        }
        
        if ([NNCommonDeal jugementStringIsNil:[dic valueForKeyPath:@"expressName"]]) {
            self.m_orderFM.m_fastName = @"";
        }else{
            self.m_orderFM.m_fastName = [NSString stringWithFormat:@"%@",[dic valueForKeyPath:@"expressName"]];
        }
        
        if ([NNCommonDeal jugementStringIsNil:[dic valueForKeyPath:@"fee"]]) {
            self.m_orderFM.m_fastFee = @"";
        }else{
            self.m_orderFM.m_fastFee = [NSString stringWithFormat:@"%@",[dic valueForKeyPath:@"fee"]];
        }
        
        if (![NNCommonDeal jugementStringIsNil:[dic valueForKeyPath:@"ordership"]]) {
            self.m_shipAddModel = [[AdreessModel alloc]parseFromDic:[dic valueForKeyPath:@"ordership"]];
            m_shipAddModel.m_contact = [NSString stringWithFormat:@"%@",[dic valueForKeyPath:@"account"]];
        }
    }
    return self;
}


@end