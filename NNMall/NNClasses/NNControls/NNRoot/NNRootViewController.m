//
//  NNRootViewController.m
//  NNMall
//
//  Created by shaoxu on 15/11/20.
//  Copyright © 2015年 shaoxu. All rights reserved.
//

#import "NNRootViewController.h"
#import "NNMainMallViewController.h"
#import "NNShopCartViewController.h"
#import "NNSearchViewController.h"
#import "NNSearchResultViewController.h"
#import "NNMeViewController.h"
#import "NNProductInfoViewController.h"
#import "NNMallPayViewController.h"
#import "NNOrderContentViewController.h"

@interface NNRootViewController ()<UINavigationControllerDelegate,UIGestureRecognizerDelegate>

@end

@implementation NNRootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationController.delegate = self;
    self.navigationController.interactivePopGestureRecognizer.delegate = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)popFromChild:(id)sender
{
    if ([self isKindOfClass:[NNMallPayViewController class]]) {
        //跳入订单详情
        //订单详情返回到购物车首页
        NNMallPayViewController *mallPay = (NNMallPayViewController *)self;
        if (mallPay.p_payFrom == submitOrder) {
            [self performSegueWithIdentifier:@"ShowOrderDetailSegue" sender:mallPay.p_payOrderM];
        }
        else{
            [self.navigationController popViewControllerAnimated:YES];
        }
    }
    else if ([self isKindOfClass:[NNOrderContentViewController class]]) {
        NNOrderContentViewController *ordervc = [self.navigationController.viewControllers lastObject];
        if (ordervc.p_fromVC == mallPay) {
            [self.navigationController popToRootViewControllerAnimated:YES];
        }
        else{
            [self.navigationController popViewControllerAnimated:YES];
        }
    }
    else{
        [self.navigationController popViewControllerAnimated:YES];
    }
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    if ([self isKindOfClass:[NNShopCartViewController class]] ) {
        [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
        //设置NavigationBar背景颜色
        [self.navigationController.navigationBar setBarTintColor:Redcolor];
        [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
    }
    else if ([self isKindOfClass:[NNMainMallViewController class]] ) {
        [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
        //设置NavigationBar背景颜色
        [self.navigationController.navigationBar setBarTintColor:Redcolor];
        [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
    }
    else if ([self isKindOfClass:[NNSearchViewController class]]){
        [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
        //设置NavigationBar背景颜色
        [self.navigationController.navigationBar setBarTintColor:Redcolor];
        [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
        UIImageView *logo = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"nuan-search-r.png"]];
        logo.frame = CGRectMake(0, 0, 40, 40);
        UIBarButtonItem* leftItem = [[UIBarButtonItem alloc]initWithCustomView:logo];
        self.navigationItem.leftBarButtonItem = leftItem;
    }
    else if ([self isKindOfClass:[NNSearchResultViewController class]]){
        UIImageView *logo = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"nuan-search-w.png"]];
        logo.frame = CGRectMake(0, 0, 40, 40);
        UIBarButtonItem* leftItem = [[UIBarButtonItem alloc]initWithCustomView:logo];
        self.navigationItem.leftBarButtonItem = leftItem;
    }
    else if ([self isKindOfClass:[NNMeViewController class]]) {
        [self.navigationController setNavigationBarHidden:YES animated:NO];
        [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
        //设置NavigationBar背景颜色
        [self.navigationController.navigationBar setBarTintColor:Redcolor];
        [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
    }
    else{
        [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault];
        
        if (self.navigationController.viewControllers.count>1) {
            UIBarButtonItem *backBar = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"back-p.png"] style:UIBarButtonItemStylePlain target:self action:@selector(popFromChild:)];
            backBar.imageInsets = UIEdgeInsetsMake(3, 0, 3, 6);
            backBar.tintColor = NavRedcolor;
            self.navigationItem.leftBarButtonItem = backBar;
        }
        else{
            self.navigationItem.leftBarButtonItem = nil;
        }
    }
}

-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    if (self.navigationController.navigationBarHidden) {
        [self.navigationController setNavigationBarHidden:NO animated:YES];
    }
}

- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if (![viewController isKindOfClass:[NNMainMallViewController class]]&&![viewController isKindOfClass:[NNShopCartViewController class]]&&![viewController isKindOfClass:[NNSearchViewController class]]&&![viewController isKindOfClass:[NNMeViewController class]]) {
        [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault];
        //设置NavigationBar背景颜色
        [self.navigationController.navigationBar setBarTintColor:Navcolor];
        [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:NavRedcolor}];

    }
}

- (void)navigationController:(UINavigationController *)navigationController
       didShowViewController:(UIViewController *)viewController
                    animated:(BOOL)animated
{
    if ([viewController isKindOfClass:[NNMallPayViewController class]] || [viewController isKindOfClass:[NNMainMallViewController class]] || [viewController isKindOfClass:[NNShopCartViewController class]]||[viewController isKindOfClass:[NNSearchViewController class]]||[viewController isKindOfClass:[NNMeViewController class]]) {
        self.navigationController.interactivePopGestureRecognizer.enabled = NO;
    }
    else{
        self.navigationController.interactivePopGestureRecognizer.enabled = YES;
    }
}
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    if([segue.identifier isEqualToString:@"ShowOrderDetailSegue"])
    {
        OrderModel *orderM = (OrderModel *)sender;
        NNOrderContentViewController *orderContentVC = segue.destinationViewController;
        orderContentVC.p_fromVC = mallPay;
        orderContentVC.p_contentOM = orderM;
    }
}

@end
