//
//  AdreessModel.m
//  NNMall
//
//  Created by 马家俊 on 15/11/13.
//  Copyright © 2015年 shaoxu. All rights reserved.
//

#import "AdreessModel.h"

@implementation AdreessModel
@synthesize m_name;               //姓名
@synthesize m_contact;            //联系方式
@synthesize m_isDefault;
@synthesize m_detailAdreess;      //详细地址
@synthesize m_addressId;

-(id)init
{
    self = [super init];
    if (self) {
        m_addressId = @"";
        m_name  = @"";
        m_contact  = @"";
        m_detailAdreess  = @"";
    }
    return self;
}

-(id)parseFromDic:(NSDictionary *)dic
{
    if ([self init]) {
        
        if ([NNCommonDeal jugementStringIsNil:[dic valueForKeyPath:@"id"]]) {
            self.m_addressId = @"";
        }else{
            self.m_addressId = [NSString stringWithFormat:@"%@",[dic valueForKeyPath:@"id"]];
        }
        
        if ([NNCommonDeal jugementStringIsNil:[dic valueForKeyPath:@"account"]]) {
            self.m_name = @"";
        }else{
            self.m_name = [NSString stringWithFormat:@"%@",[dic valueForKeyPath:@"account"]];
        }
        
        if ([NNCommonDeal jugementStringIsNil:[dic valueForKeyPath:@"address"]]) {
            self.m_detailAdreess = @"";
        }else{
            self.m_detailAdreess = [NSString stringWithFormat:@"%@",[dic valueForKeyPath:@"address"]];
        }
        
        if ([NNCommonDeal jugementStringIsNil:[dic valueForKeyPath:@"mobile"]]) {
            self.m_contact = @"";
        }else{
            self.m_contact = [NSString stringWithFormat:@"%@",[dic valueForKeyPath:@"mobile"]];
        }
        
        if ([NNCommonDeal jugementStringIsNil:[dic valueForKeyPath:@"isdefault"]]) {
            self.m_isDefault = NO;
        }else{
            NSString *isDefault = [NSString stringWithFormat:@"%@",[dic valueForKeyPath:@"isdefault"]];
            if ([isDefault isEqualToString:@"y"]) {
                self.m_isDefault = YES;
            }
            else{
                self.m_isDefault = NO;
            }
        }
    }
    return self;
}

@end
