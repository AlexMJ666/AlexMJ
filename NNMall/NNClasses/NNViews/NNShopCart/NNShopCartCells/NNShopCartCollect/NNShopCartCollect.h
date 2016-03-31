//
//  NNShopCartCollect.h
//  NNMall
//
//  Created by shaoxu on 15/11/12.
//  Copyright © 2015年 shaoxu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HJCAjustNumButton.h"
#import "ProductModel.h"

@interface NNShopCartCollect : UICollectionViewCell
{
    UIButton    *m_cartSelectBtn;
    UIImageView *m_cartImageView;
    UILabel     *m_cartNameLbl;
    UILabel     *m_cartPriceLbl;
    UILabel     *m_sizeInfoLbl;
    UIView      *m_adjustBtn;
}
@property (nonatomic,strong) IBOutlet UIButton    *p_cartSelectBtn;
@property (nonatomic,strong) IBOutlet UIImageView *p_cartImageView;
@property (nonatomic,strong) IBOutlet UILabel     *p_cartNameLbl;
@property (nonatomic,strong) IBOutlet UILabel     *p_cartPriceLbl;
@property (nonatomic,strong) IBOutlet UILabel     *p_sizeInfoLbl;
@property (nonatomic,strong) IBOutlet UIView      *p_ajustBtn;


@end
