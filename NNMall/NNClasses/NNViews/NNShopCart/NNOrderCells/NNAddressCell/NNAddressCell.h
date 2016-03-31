//
//  NNAddressCell.h
//  NNMall
//
//  Created by shaoxu on 15/11/13.
//  Copyright © 2015年 shaoxu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AdreessModel.h"
@interface NNAddressCell : UITableViewCell
{
    UILabel *m_nameLbl;
    UILabel *m_addressLbl;
    UILabel *m_phoneLbl;
}
@property (nonatomic,strong) IBOutlet UILabel *p_nameLbl;
@property (nonatomic,strong) IBOutlet UILabel *p_addressLbl;
@property (nonatomic,strong) IBOutlet UILabel *p_phoneLbl;

-(void)refreshAddressData:(AdreessModel *)addressM;

@end
