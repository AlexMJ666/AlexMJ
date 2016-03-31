//
//  NNCommentCell.h
//  NNMall
//
//  Created by shaoxu on 15/11/20.
//  Copyright © 2015年 shaoxu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NNCommentCell : UITableViewCell
{
    UIImageView *m_headImg;
    UILabel *m_nameLbl;
    UILabel *m_contentLbl;
    UILabel *m_timeLbl;
}
@property (nonatomic,strong) IBOutlet UIImageView *p_headImg;
@property (nonatomic,strong) IBOutlet UILabel *p_nameLbl;
@property (nonatomic,strong) IBOutlet UILabel *p_contentLbl;
@property (nonatomic,strong) IBOutlet UILabel *p_timeLbl;
@end
