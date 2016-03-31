//
//  NNMainMallView.h
//  NNMall
//
//  Created by shaoxu on 15/11/3.
//  Copyright © 2015年 shaoxu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ProductModel.h"
#import "MallModel.h"

typedef void(^MallSuccessBlock) (id sucBack);
typedef void(^MallFailedBlock)  (id failedBack);

@protocol NNMainMallDelegate <NSObject>
@optional

-(void)productDetail:(ProductModel *)productModel;
-(void)showMoreDailyProduct:(NSInteger)tag;
-(void)reloadMainMallData:(MallSuccessBlock)subBlock_ andFailed:(MallFailedBlock)failedBlock_;

@end

@interface NNMainMallView : UIView
{
    __weak id<NNMainMallDelegate> m_nnMainMallDelegate;
}
@property (nonatomic,weak) id<NNMainMallDelegate> p_nnMainMallDelegate;

-(void)initMallRefresh;
-(void)refreshMainMallData:(NSMutableArray *)productArray;

@end
