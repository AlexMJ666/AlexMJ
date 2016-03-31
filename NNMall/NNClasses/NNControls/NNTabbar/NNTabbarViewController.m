//
//  NNTabbarViewController.m
//  NNMall
//
//  Created by shaoxu on 15/11/3.
//  Copyright © 2015年 shaoxu. All rights reserved.
//

#import "NNTabbarViewController.h"

@interface NNTabbarViewController ()

@end

@implementation NNTabbarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.tabBar.tintColor = Redcolor;
    [self setTabbarItemImage:0 andImageName:@"home"];
    [self setTabbarItemImage:1 andImageName:@"classify"];
    [self setTabbarItemImage:2 andImageName:@"cart"];
    [self setTabbarItemImage:3 andImageName:@"me"];
}

-(void)setTabbarItemImage:(NSInteger)index andImageName:(NSString *)imageName
{
    UITabBarItem *tabBarItem = [self.tabBar.items objectAtIndex:index];
    UIImage *itemImage  = [UIImage imageNamed:[NSString stringWithFormat:@"%@.png",imageName]];
    UIImage *itemImageSelected =[UIImage imageNamed:[NSString stringWithFormat:@"%@-r.png",imageName]];
    [tabBarItem setImage:itemImage];
    [tabBarItem setSelectedImage:itemImageSelected];
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
