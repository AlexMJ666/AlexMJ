//
//  NNProductInfoViewController.h
//  NNMall
//
//  Created by shaoxu on 15/11/5.
//  Copyright © 2015年 shaoxu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ProductModel.h"

@interface NNProductInfoViewController : NNRootViewController
{
    ProductModel *m_productModel;
    BOOL m_isFromProduct;
}
@property (nonatomic,strong) ProductModel *p_productModel;
@property (nonatomic,assign) BOOL p_isFromProduct;
@end