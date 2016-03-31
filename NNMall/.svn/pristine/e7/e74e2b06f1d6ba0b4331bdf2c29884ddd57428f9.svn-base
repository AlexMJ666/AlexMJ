//
//  UserModel.h
//  NNMall
//
//  Created by 马家俊 on 15/11/12.
//  Copyright © 2015年 shaoxu. All rights reserved.
//

#import "NNBasicModel.h"
#import "AdreessModel.h"
@interface UserModel : NNBasicModel
{
    NSString* m_uid;            //用户ID
    NSString* m_uName;          //用户昵称
    NSString* m_uHeaderIMG;     //用户头像URL
    NSString* m_uSex;           //用户性别
    NSMutableArray* m_adreess;  //用户地址
    BOOL m_isLogin;
    
    NSString *m_waitPayCount;    //待付款
    NSString *m_waitReceiveCount;//待收货
    NSString *m_waitSendCount;   //待发货
    NSString *m_waitCommentCount;//待评论
}

@property (nonatomic,strong) NSString *m_uid;
@property (nonatomic,strong) NSString *m_uName;
@property (nonatomic,strong) NSString *m_uHeaderIMG;
@property (nonatomic,strong) NSString *m_uSex;
@property (nonatomic,strong) NSMutableArray *m_adreess;
@property (nonatomic,assign) BOOL m_isLogin;
@property (nonatomic,strong) NSString *m_waitReceiveCount;
@property (nonatomic,strong) NSString *m_waitPayCount;
@property (nonatomic,strong) NSString *m_waitSendCount;
@property (nonatomic,strong) NSString *m_waitCommentCount;

-(id)parseFromDic:(NSDictionary *)dic;
@end
