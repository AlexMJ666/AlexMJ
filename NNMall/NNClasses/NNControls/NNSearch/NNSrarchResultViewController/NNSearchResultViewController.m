//
//  NNSearchResultViewController.m
//  NNMall
//
//  Created by 马家俊 on 15/11/10.
//  Copyright © 2015年 shaoxu. All rights reserved.
//

#import "NNSearchResultViewController.h"
#import "NNSearchResultView.h"
@interface NNSearchResultViewController ()<UITextFieldDelegate,NNSearchResultViewDelegate>
{
    NSMutableArray* m_cacheArr;
    NNSearchResultView* m_NNSearchResultView;
}
@property(nonatomic,strong) IBOutlet NNSearchResultView* p_NNSearchResultView;
@property(nonatomic,strong) NSMutableArray* p_cacheArr;
- (IBAction)popView:(id)sender;

@end

@implementation NNSearchResultViewController
@synthesize p_NNSearchResultView = m_NNSearchResultView;
@synthesize searchText;
@synthesize p_cacheArr = m_cacheArr;
@synthesize searchKey;

- (void)viewDidLoad {
    [super viewDidLoad];
    self.p_cacheArr = [[NSMutableArray alloc]init];
    m_NNSearchResultView.p_searchResultViewDelegate = self;
    [m_NNSearchResultView refreshSearchResultView:[[NSMutableArray alloc]init]];
    if (searchKey) {
        searchText.text = searchKey;
        [self saveNSUserDefaults:searchKey];
    }else
    {
        [searchText becomeFirstResponder];
    }
    // Do any additional setup after loading the view.
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

-(void)requestSearchResult:(NSString*)searchValue
{
    
}

- (IBAction)popView:(id)sender
{
    [searchText resignFirstResponder];
    [self.navigationController popViewControllerAnimated:YES];
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    if (![textField.text isEqualToString:@""]) {
        [self saveNSUserDefaults:textField.text];
        [textField resignFirstResponder];
        [self requestSearchResult:textField.text];
    }
    return YES;
}

-(void)selectHistory:(NSString *)searchValue
{
    [self requestSearchResult:searchValue];
}

-(void)touchTheTable
{
    [searchText resignFirstResponder];
}

//保存数据到NSUserDefaults
-(void)saveNSUserDefaults:(NSString*)value
{
    //将上述数据全部存储到NSUserDefaults中
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    //读取数组NSArray类型的数据
    NSArray *cacheArr = [userDefaults arrayForKey:@"cacheArr"];
    if (cacheArr) {
        [cacheArr enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            [m_cacheArr addObject:obj];
        }];
    }
    
    [m_cacheArr enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if ([value isEqualToString:obj]) {
            [m_cacheArr removeObject:obj];
        }
    }];
    [m_cacheArr insertObject:value atIndex:0];
    [userDefaults setObject:m_cacheArr forKey:@"cacheArr"];
    [userDefaults synchronize];
    
}

@end