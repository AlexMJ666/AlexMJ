//
//  NNAccountView.h
//  NNMall
//
//  Created by 马家俊 on 15/11/12.
//  Copyright © 2015年 shaoxu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NNCommon.h"
@protocol NNAccountViewDelegate <NSObject>
-(void)pushToModify:(NSIndexPath*)indexPath;
-(void)pushToAdreess;
@end
@interface NNAccountView : UIView
{
    __weak id<NNAccountViewDelegate> m_NNAccountViewDelegate;
}
@property(nonatomic,weak) id<NNAccountViewDelegate> p_NNAccountViewDelegate;

-(void)refreshAccountView;
@end
