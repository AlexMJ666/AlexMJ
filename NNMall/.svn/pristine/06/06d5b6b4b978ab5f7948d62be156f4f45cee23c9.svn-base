//
//  NNShare.h
//  NNMall
//
//  Created by shaoxu on 15/11/3.
//  Copyright © 2015年 shaoxu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <WXApi.h>
#import <WXApiObject.h>
#import <TencentOpenAPI/QQApiInterface.h>
#import <TencentOpenAPI/QQApiInterfaceObject.h>
#import <TencentOpenAPI/TencentOAuth.h>
#import <TencentOpenAPI/TencentOAuthObject.h>

#define shareWeibo          111
#define shareWXHY           0
#define sharePYQ            1
#define shareQQ             2
#define shareQQWB           222
#define shareQQZONE         3

@interface NNShare : NSObject<TencentSessionDelegate,TencentLoginDelegate>

/**
 *  单例模式获取ShareControls对象
 *
 *  @return 返回ShareControls对象
 */
+ (NNShare *)shareInstanceManager;

/**
 *  分享分发
 *
 *  @param tag 按钮tag
 */
-(void)shareSDK:(NSInteger)tag;

/**
 *  分享给好友
 */
-(void)shareWeiXinfriend;

/**
 *  分享到朋友圈
 */
-(void)shareToPYQ;

/**
 *  分享给QQ好友
 */
-(void)shareToQQ;

/**
 *  分享到QQ空间
 */
-(void)shareToQQZone;

@end
