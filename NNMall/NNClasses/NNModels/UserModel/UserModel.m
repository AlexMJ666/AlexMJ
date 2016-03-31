//
//  UserModel.m
//  NNMall
//
//  Created by 马家俊 on 15/11/12.
//  Copyright © 2015年 shaoxu. All rights reserved.
//

#import "UserModel.h"

@implementation UserModel
@synthesize m_uid;            //用户ID
@synthesize m_uName;          //用户昵称
@synthesize m_uHeaderIMG;     //用户头像URL
@synthesize m_uSex;           //用户性别
@synthesize m_adreess;  //用户地址
@synthesize m_isLogin;          //是否登录
@synthesize m_waitPayCount;
@synthesize m_waitReceiveCount;
@synthesize m_waitCommentCount;
@synthesize m_waitSendCount;

-(id)init
{
    self = [super init];
    if (self) {
        m_uid  = @"fsdasd";
        m_uName  = @"你好";
        m_uHeaderIMG  = @"";
        m_uSex  = @"男";
        m_adreess = [[NSMutableArray alloc]init];
        m_isLogin = NO;
        m_waitPayCount = @"0";
        m_waitReceiveCount = @"0";
        m_waitCommentCount = @"0";
        m_waitSendCount = @"0";
    }
    return self;
}

-(id)parseFromDic:(NSDictionary *)dic
{
    if ([self init]) {
        
    }
    return self;
}

@end
