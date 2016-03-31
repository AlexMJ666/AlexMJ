//
//  NNProductDetailViewController.m
//  NNMall
//
//  Created by shaoxu on 15/11/5.
//  Copyright © 2015年 shaoxu. All rights reserved.
//

#import "NNProductDetailViewController.h"

@interface NNProductDetailViewController ()

@end

@implementation NNProductDetailViewController
@synthesize p_productDetaiView = m_productDetaiView;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.edgesForExtendedLayout = UIRectEdgeNone;
    
    self.p_productDetaiView.p_productDetailTableView.contentSize = CGSizeMake(0, 729);
    self.p_productDetaiView.p_productDetailTableView.layer.borderColor = [[UIColor redColor]CGColor];
    self.p_productDetaiView.p_productDetailTableView.layer.borderWidth = 1;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
