//
//  NNGoodsDetailViewController.h
//  NNMall
//
//  Created by shaoxu on 15/11/4.
//  Copyright © 2015年 shaoxu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GoodsModel.h"
@interface NNGoodsDetailViewController : UIViewController
{
    GoodsModel *m_goodsModel;
}
@property (nonatomic,strong) GoodsModel *p_goodsModel;
@end
