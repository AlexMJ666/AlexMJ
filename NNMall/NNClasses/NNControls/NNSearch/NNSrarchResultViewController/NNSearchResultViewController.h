//
//  NNSearchResultViewController.h
//  NNMall
//
//  Created by 马家俊 on 15/11/10.
//  Copyright © 2015年 shaoxu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NNSearchResultViewController : NNRootViewController
{
    NSString* searchKey;
}
@property (nonatomic, strong) NSString* searchKey;
@property (strong, nonatomic) IBOutlet UITextField *searchText;

@end
