//
//  AdreessDetailCell.h
//  NNMall
//
//  Created by 马家俊 on 15/11/16.
//  Copyright © 2015年 shaoxu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AdreessModel.h"
@protocol AdreessDetailCellDelegate <NSObject>


@end
@interface AdreessDetailCell : UITableViewCell
{
    __weak id<AdreessDetailCellDelegate> m_AdreessDetailCellDelegate;
    UILabel* m_name;
    UILabel* m_contact;
    UILabel* m_detailAdreess;
}
@property (nonatomic, strong) IBOutlet UILabel* p_name;
@property (nonatomic, strong) IBOutlet UILabel* p_detailAdreess;
@property (nonatomic, strong) IBOutlet UILabel* p_contact;
@property (nonatomic, weak)   id<AdreessDetailCellDelegate> p_AdreessDetailCellDelegate;
-(IBAction)modifyAdreess:(id)sender;

-(void)refreshAdreessDetailCell:(AdreessModel*)adreessM;
-(void)refreshAdreessDetailCellFromOrderContent:(AdreessModel *)adreessM;
@end