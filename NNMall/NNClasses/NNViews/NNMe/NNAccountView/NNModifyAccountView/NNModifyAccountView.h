//
//  NNModifyAccountView.h
//  NNMall
//
//  Created by 马家俊 on 15/11/13.
//  Copyright © 2015年 shaoxu. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol NNModifyAccountViewDelegate <NSObject>


@end
@interface NNModifyAccountView : UIView
{
    __weak id<NNModifyAccountViewDelegate> m_NNModifyAccountViewDelegate;
    
}
@property (nonatomic, weak) id<NNModifyAccountViewDelegate> p_NNModifyAccountViewDelegate;
-(void)refreshNNModifyAccountView:(NSIndexPath*)chooseRow;
@end