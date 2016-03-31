//
//  NNSizeCollect.h
//  NNMall
//
//  Created by shaoxu on 15/11/21.
//  Copyright © 2015年 shaoxu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ProductModel.h"

@protocol NNSizeCollectDelegate <NSObject>

-(void)selectSizeBtn:(NSString *)type;


@end

@interface NNSizeCollect : UICollectionViewCell
{
    UIButton *m_sizeTitle;
    BOOL m_haveSize;
    __weak id<NNSizeCollectDelegate> m_nnSizeCollectDelegate;
}
@property (nonatomic,strong) UIButton *p_sizeTitle;
@property (nonatomic,assign) BOOL p_haveSize;
@property (nonatomic,weak) id<NNSizeCollectDelegate> p_nnSizeCollectDelegate;

-(void)refreshSizeCollect:(NSString *)title
                   andKey:(NSString *)keyStr
              andProductM:(ProductModel *)productM
                 andWidth:(NSString *)width;

@end
