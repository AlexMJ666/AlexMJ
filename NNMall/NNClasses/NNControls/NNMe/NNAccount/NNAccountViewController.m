//
//  NNAccountViewController.m
//  NNMall
//
//  Created by 马家俊 on 15/11/12.
//  Copyright © 2015年 shaoxu. All rights reserved.
//

#import "NNAccountViewController.h"
#import "NNAccountView.h"
@interface NNAccountViewController ()<NNAccountViewDelegate>
{
    NNAccountView* m_accountView;
}
@property(nonatomic,strong) IBOutlet NNAccountView* p_accountView;
@end

@implementation NNAccountViewController
@synthesize p_accountView = m_accountView;

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:234.0f/255.0f green:37.0f/255.0f blue:30.0f/255.0f alpha:1];
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.p_accountView.p_NNAccountViewDelegate = self;
    [m_accountView refreshAccountView];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - AccountDelegate

-(void)pushToModify:(NSIndexPath *)indexPath
{
    [self performSegueWithIdentifier:@"AccountToModifySegue" sender:indexPath];
}

-(void)pushToAdreess
{
    [self performSegueWithIdentifier:@"AccountToAdreessSegue" sender:nil];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if([segue.identifier isEqualToString:@"AccountToModifySegue"])
    {
        NSIndexPath* indexPath = (NSIndexPath*)sender;
        id theSegue = segue.destinationViewController;
        [theSegue setValue:indexPath forKey:@"chooseRow"];
    }
}


@end
