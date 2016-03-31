//
//  NNAppManage.h
//  NNMall
//
//  Created by 马家俊 on 15/11/16.
//  Copyright © 2015年 shaoxu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UserModel.h"
@interface NNAppManage : NSObject
{
    UserModel* m_currentUserM;
}
@property (nonatomic, strong) UserModel* p_currentUserM;
/*!单例模式获取NNAppManage对象
 *\param    param:          无
 *\returns  returns:        返回NNAppManage对象
 */
+ (NNAppManage *)shareInstanceManager;

/**
 *  实例化userModel
 */
-(void)initUser;

/**
 *  是否登录
 */
-(BOOL)isLogin;

-(UIImage *)getDefaultImage:(NSString *)imageName;

@end
