//
//  NNLoginView.h
//  NNMall
//
//  Created by 马家俊 on 15/11/18.
//  Copyright © 2015年 shaoxu. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol NNLoginViewDelegate <NSObject>

-(void)loginDelegate:(NSString*)account andPassW:(NSString*)passWord;
-(void)sender:(NSString*)account;
-(void)loginBackDelegate;
@end
@interface NNLoginView : UIView
{
    __weak id<NNLoginViewDelegate> m_NNLoginViewDelegate;
    UITextField* m_mobile;
    UIButton* m_sendBtn;
    UIButton* m_loginBtn;
}
@property (nonatomic, weak) id<NNLoginViewDelegate> p_NNLoginViewDelegate;
@property (nonatomic, strong) IBOutlet UITextField* p_mobile;
@property (nonatomic, strong) IBOutlet UIButton* p_sendBtn;
@property (nonatomic, strong) IBOutlet UIButton* p_loginBtn;

-(void)refreshLoginView;
@end
