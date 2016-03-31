//
//  NNGoodsDetailView.m
//  NNMall
//
//  Created by shaoxu on 15/11/4.
//  Copyright © 2015年 shaoxu. All rights reserved.
//

#import "NNGoodsDetailView.h"
#import <SDWebImage/UIImageView+WebCache.h>
#import <MJRefresh.h>
@interface NNGoodsDetailView ()<UITableViewDataSource,UITableViewDelegate>
{
    UITableView *m_nnDeatilTableView;
}
@property (nonatomic,strong) IBOutlet UITableView *p_nnDetailTableView;
@end

@implementation NNGoodsDetailView
@synthesize p_nnDetailTableView = m_nnDeatilTableView;
@synthesize p_nnGoodsDetailDelegate = m_nnGoodsDetailDelegate;

-(void)dealloc
{
}

-(id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        
    }
    return self;
}

#pragma mark - MJRefresh
-(void)initMJRefreshView
{
    MJRefreshNormalHeader *header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
     
    }];
    header.lastUpdatedTimeLabel.hidden = YES;
    self.p_nnDetailTableView.header = header;
    
    self.p_nnDetailTableView.footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        
    }];
}

#pragma mark - WareDetail TableView

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 115.0f;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *GoodsDetail = @"GoodsDetailCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:GoodsDetail forIndexPath:indexPath];
    
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:GoodsDetail];
    }
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{

}

@end
