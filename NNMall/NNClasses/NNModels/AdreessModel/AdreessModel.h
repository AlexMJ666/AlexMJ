//
//  AdreessModel.h
//  NNMall
//
//  Created by 马家俊 on 15/11/13.
//  Copyright © 2015年 shaoxu. All rights reserved.
//

#import "NNBasicModel.h"

@interface AdreessModel : NNBasicModel
{
    NSString* m_addressId;          //地址id
    NSString* m_name;               //姓名
    NSString* m_contact;            //联系方式
    NSString* m_detailAdreess;      //详细地址
    BOOL m_isDefault;
}
@property (nonatomic,strong) NSString* m_addressId;
@property (nonatomic,strong) NSString *m_name;
@property (nonatomic,strong) NSString *m_contact;
@property (nonatomic,strong) NSString *m_detailAdreess;
@property (nonatomic,assign) BOOL m_isDefault;

-(id)parseFromDic:(NSDictionary *)dic;

@end
