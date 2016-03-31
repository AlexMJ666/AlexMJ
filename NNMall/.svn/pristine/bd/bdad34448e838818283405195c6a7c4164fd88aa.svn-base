//
//  CommentModel.h
//  NNMall
//
//  Created by shaoxu on 15/11/16.
//  Copyright © 2015年 shaoxu. All rights reserved.
//

#import "NNBasicModel.h"

@interface CommentModel : NNBasicModel
{
    NSString *m_commentId;  //评论id
    NSString *m_productId;  //评论的商品id
    NSString *m_nickName;   //评论昵称
    NSString *m_orderId;    //评论的订单id
    NSString *m_content;    //评论内容
    NSString *m_commentTime;//评论时间
    NSString *m_commentStar;//星级
    
    NSString *m_total;      //总数
}
@property (nonatomic,strong) NSString *m_commentId;
@property (nonatomic,strong) NSString *m_productId;
@property (nonatomic,strong) NSString *m_nickName;
@property (nonatomic,strong) NSString *m_orderId;
@property (nonatomic,strong) NSString *m_content;
@property (nonatomic,strong) NSString *m_commentTime;
@property (nonatomic,strong) NSString *m_commentStar;
@property (nonatomic,strong) NSString *m_total;

-(id)parseFromDic:(NSDictionary *)dic;

@end
