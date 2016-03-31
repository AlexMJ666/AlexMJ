//
//  NNLikeCollect.h
//  NNMall
//
//  Created by shaoxu on 15/11/12.
//  Copyright © 2015年 shaoxu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NNLikeCollect : UICollectionViewCell
{
    UIImageView *m_likeImageView;
    UILabel     *m_likeNameLbl;
    UILabel     *m_likePriceLbl;
}
@property (nonatomic,strong) IBOutlet UIImageView *p_likeImageView;
@property (nonatomic,strong) IBOutlet UILabel     *p_likeNameLbl;
@property (nonatomic,strong) IBOutlet UILabel     *p_likePriceLbl;
@end
