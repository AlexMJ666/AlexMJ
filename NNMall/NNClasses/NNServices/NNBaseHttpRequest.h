//
//  NNBaseHttpRequest.h
//  NNMall
//
//  Created by shaoxu on 15/11/3.
//  Copyright © 2015年 shaoxu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking.h>
#import <AFNetworking/AFHTTPRequestOperationManager.h>

#import "NNErrorModel.h"

typedef void(^SuccessBlock) (id backJson);
typedef void(^FailedBlock)  (NNErrorModel *errorM);

@interface NNBaseHttpRequest : NSObject
{
    SuccessBlock    success_block;
    FailedBlock     failed_block;
}
@end
