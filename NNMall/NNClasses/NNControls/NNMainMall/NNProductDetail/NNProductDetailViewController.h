//
//  NNProductDetailViewController.h
//  NNMall
//
//  Created by shaoxu on 15/11/5.
//  Copyright © 2015年 shaoxu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NNProductDetailView.h"
@interface NNProductDetailViewController : UIViewController
{
    NNProductDetailView *m_productDetaiView;
}
@property (nonatomic,strong) IBOutlet NNProductDetailView *p_productDetaiView;
@end
