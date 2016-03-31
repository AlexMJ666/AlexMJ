//
//  NNDailyCell.h
//  NNMall
//
//  Created by shaoxu on 15/11/12.
//  Copyright © 2015年 shaoxu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MallModel.h"
#import "ProductModel.h"
@protocol NNDailyCellDelegate <NSObject>

-(void)dailySelectRowAt:(ProductModel *)productM;

@end

@interface NNDailyCell : UITableViewCell
{
    __weak id<NNDailyCellDelegate> m_nnDailyCellDelegate;
}
@property (nonatomic,weak) id<NNDailyCellDelegate> p_nnDailyCellDelegate;

-(void)refreshDailyData:(MallModel *)mallModel;

@end
