//
//  NNMyOrderCell.h
//  NNMall
//
//  Created by 马家俊 on 15/11/17.
//  Copyright © 2015年 shaoxu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OrderModel.h"
@protocol NNMyOrderCellDelegate  <NSObject>


@end
@interface NNMyOrderCell : UITableViewCell
{
    __weak id<NNMyOrderCellDelegate> m_NNMyOrderCellDelegate;
    UIImageView* m_productImg;
    UILabel* m_content;
    UILabel* m_price;
    UILabel* m_count;
    
}
@property (nonatomic, weak) id<NNMyOrderCellDelegate> p_NNMyOrderCellDelegate;
@property (nonatomic, strong) IBOutlet UIImageView* p_productImg;
@property (nonatomic, strong) IBOutlet UILabel* p_content;
@property (nonatomic, strong) IBOutlet UILabel* p_price;
@property (nonatomic, strong) IBOutlet UILabel* p_count;
-(void)refreshMyOrderCell:(OrderModel *)orderM andIndexRow:(NSIndexPath*)indexPath;
@end
