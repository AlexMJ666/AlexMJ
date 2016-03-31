//
//  FastModel.m
//  NNMall
//
//  Created by shaoxu on 15/11/23.
//  Copyright © 2015年 shaoxu. All rights reserved.
//

#import "FastModel.h"

@implementation FastModel
@synthesize m_fastId;
@synthesize m_fastName;
@synthesize m_fastFee;

-(id)init
{
    self = [super init];
    if (self) {
        m_fastId  = @"";
        m_fastName = @"";
        m_fastFee = @"";
    }
    return self;
}

-(id)parseFromDic:(NSDictionary *)dic
{
    if ([self init]) {
        if ([NNCommonDeal jugementStringIsNil:[dic valueForKeyPath:@"id"]]) {
            self.m_fastId = @"";
        }else{
            self.m_fastId = [NSString stringWithFormat:@"%@",[dic valueForKeyPath:@"id"]];
        }
        
        if ([NNCommonDeal jugementStringIsNil:[dic valueForKeyPath:@"name"]]) {
            self.m_fastName = @"";
        }else{
            self.m_fastName = [NSString stringWithFormat:@"%@",[dic valueForKeyPath:@"name"]];
        }
        
        if ([NNCommonDeal jugementStringIsNil:[dic valueForKeyPath:@"fee"]]) {
            self.m_fastFee = @"";
        }else{
            self.m_fastFee = [NSString stringWithFormat:@"%@",[dic valueForKeyPath:@"fee"]];
        }
    }
    return self;
}


@end
