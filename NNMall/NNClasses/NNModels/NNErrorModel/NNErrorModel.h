//
//  NNErrorModel.h
//  NNMall
//
//  Created by shaoxu on 15/11/3.
//  Copyright © 2015年 shaoxu. All rights reserved.
//

#import "NNBasicModel.h"

@interface NNErrorModel : NNBasicModel
{
    int         m_state;           //错误状态码
    NSString    *m_message;        //错误原因
}

@property (nonatomic,assign) int        m_state;
@property (nonatomic,strong) NSString   *m_message;
@end
