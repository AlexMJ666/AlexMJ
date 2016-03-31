//
//  NNMallPayView.h
//  NNMall
//
//  Created by shaoxu on 15/11/19.
//  Copyright © 2015年 shaoxu. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol NNMallPayDelegate <NSObject>

/*! 使用支付宝支付
 *\param    param:          无
 *\returns  returns:        无
 */
-(void)payUseAlipay;

/*! 使用微信支付
 *\param    param:          无
 *\returns  returns:        无
 */
-(void)payWX;

@end

@interface NNMallPayView : UIView
{
    __weak id<NNMallPayDelegate> m_payDelgate;
}
@property (nonatomic,weak) id<NNMallPayDelegate> p_payDelegate;

@end
