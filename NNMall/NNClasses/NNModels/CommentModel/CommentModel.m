//
//  CommentModel.m
//  NNMall
//
//  Created by shaoxu on 15/11/16.
//  Copyright © 2015年 shaoxu. All rights reserved.
//

#import "CommentModel.h"

@implementation CommentModel
@synthesize m_commentId;
@synthesize m_commentStar;
@synthesize m_commentTime;
@synthesize m_content;
@synthesize m_nickName;
@synthesize m_orderId;
@synthesize m_productId;
@synthesize m_total;

-(id)init
{
    self = [super init];
    if (self) {
        m_commentId  = @"";
        m_commentStar = @"";
        m_commentTime  = @"";
        m_content  = @"";
        m_nickName  = @"";
        m_orderId  = @"";
        m_productId  = @"";
        m_total = @"";
    }
    return self;
}

-(id)parseFromDic:(NSDictionary *)dic
{
    if ([self init]) {
        if ([NNCommonDeal jugementStringIsNil:[dic valueForKeyPath:@"id"]]) {
            self.m_commentId = @"";
        }else{
            self.m_commentId = [NSString stringWithFormat:@"%@",[dic valueForKeyPath:@"id"]];
        }
        
        if ([NNCommonDeal jugementStringIsNil:[dic valueForKeyPath:@"productID"]]) {
            self.m_productId = @"";
        }else{
            self.m_productId = [NSString stringWithFormat:@"%@",[dic valueForKeyPath:@"productID"]];
        }
        
        if ([NNCommonDeal jugementStringIsNil:[dic valueForKeyPath:@"nickname"]]) {
            self.m_nickName = @"";
        }else{
            self.m_nickName = [NSString stringWithFormat:@"%@",[dic valueForKeyPath:@"nickname"]];
        }
        
        if ([NNCommonDeal jugementStringIsNil:[dic valueForKeyPath:@"orderID"]]) {
            self.m_orderId = @"";
        }else{
            self.m_orderId = [NSString stringWithFormat:@"%@",[dic valueForKeyPath:@"orderID"]];
        }
        
        if ([NNCommonDeal jugementStringIsNil:[dic valueForKeyPath:@"content"]]) {
            self.m_content = @"";
        }else{
//            self.m_content = [NSString stringWithFormat:@"%@",[dic valueForKeyPath:@"content"]];
            self.m_content = @"我是好是生生世世会实话实说电话好多好多好多话好多好多好多好多好多浩浩荡荡浩浩荡荡和好多好多好多好多话好多好多好多好多后悔的好多话好多好多好多话好多话都好多话好多好多话好多好多话好多话好多好多好多话好多好多好多话好多好多好多好多话P";
        }
        
        if ([NNCommonDeal jugementStringIsNil:[dic valueForKeyPath:@"createdate"]]) {
            self.m_commentTime = @"";
        }else{
            self.m_commentTime = [NSString stringWithFormat:@"%@",[dic valueForKeyPath:@"createdate"]];
        }
        
        if ([NNCommonDeal jugementStringIsNil:[dic valueForKeyPath:@"star"]]) {
            self.m_commentStar = @"";
        }else{
            self.m_commentStar = [NSString stringWithFormat:@"%@",[dic valueForKeyPath:@"star"]];
        }
    }
    return self;
}

@end