//
//  NNAdreessView.h
//  NNMall
//
//  Created by 马家俊 on 15/11/16.
//  Copyright © 2015年 shaoxu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AdreessModel.h"
@protocol NNAdreessViewDelegate <NSObject>
-(void)deleteAddress:(AdreessModel*)addressM;
-(void)selectAddress:(AdreessModel *)addressM;
@end
@interface NNAdreessView : UIView
{
    __weak id<NNAdreessViewDelegate> m_NNAdreessViewDelegate;
}

@property (nonatomic, weak) id<NNAdreessViewDelegate> p_NNAdreessViewDelegate;

-(void)refreshNNAdreessView:(NSMutableArray *)addressList;
@end
