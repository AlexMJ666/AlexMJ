//
//  NNCommentView.m
//  NNMall
//
//  Created by shaoxu on 15/11/20.
//  Copyright © 2015年 shaoxu. All rights reserved.
//

#import "NNCommentView.h"
#import "NNCommentCell.h"
#import "CommentModel.h"
#import <MJRefresh.h>
@interface NNCommentView ()<UITableViewDataSource,UITableViewDelegate>
{
    UITableView *m_commentTableView;
    NSMutableArray *m_commentArray;
}
@property (nonatomic,strong) IBOutlet UITableView *p_commentTableView;
@property (nonatomic,strong) NSMutableArray *p_commentArray;
@end

@implementation NNCommentView
@synthesize p_commentTableView = m_commentTableView;
@synthesize p_commentArray = m_commentArray;
@synthesize p_nnCommentDelegate = m_nnCommentDelegate;

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

-(void)initMJRefreshView
{
    MJRefreshNormalHeader *header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        if (m_nnCommentDelegate && [m_nnCommentDelegate respondsToSelector:@selector(refreshCommentList:andFaild:)]) {
            [m_nnCommentDelegate refreshCommentList:^(id content) {
                [self.p_commentTableView.header endRefreshing];
                [self refreshCommentData:(NSMutableArray *)content];
            } andFaild:^(id content) {
                [self.p_commentTableView.header endRefreshing];
            }];
        }
    }];
    header.lastUpdatedTimeLabel.hidden = YES;
    self.p_commentTableView.header = header;
    
    self.p_commentTableView.footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        if (m_nnCommentDelegate && [m_nnCommentDelegate respondsToSelector:@selector(loadMoreCommentList:andFaild:)]) {
            [m_nnCommentDelegate loadMoreCommentList:^(id content) {
                [self.p_commentTableView.footer endRefreshing];
                if (content) {
                    NSMutableArray *tempArr = (NSMutableArray *)content;
                    [self refreshCommentData:tempArr];
                }
                else{
                    [self.p_commentTableView.footer endRefreshingWithNoMoreData];
                }
                
            } andFaild:^(id content) {
                [self.p_commentTableView.footer endRefreshing];
            }];
        }
    }];

    [self.p_commentTableView.header beginRefreshing];
}

-(void)refreshCommentData:(NSMutableArray *)commentArr
{
    self.p_commentArray = commentArr;
    [m_commentTableView reloadData];
}

#pragma mark - WareDetail TableView

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return m_commentArray.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 20.0f;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //计算高度 默认：100
    CommentModel *commentM = [m_commentArray objectAtIndex:indexPath.row];
    CGSize contentSize = [commentM.m_content boundingRectWithSize:CGSizeMake(kMainScreen_Width-30, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:12]} context:nil].size;
    if (contentSize.height>20) {
        return contentSize.height+87;
    }
    return 100.0f;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 21.0f;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *Comment = @"CommentCell";
    NNCommentCell *cell = (NNCommentCell *)[tableView dequeueReusableCellWithIdentifier:Comment forIndexPath:indexPath];
    
    if (!cell) {
        cell = [[NNCommentCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:Comment];
    }
    CommentModel *commentM = [m_commentArray objectAtIndex:indexPath.row];
    cell.p_nameLbl.text = commentM.m_nickName;
    cell.p_contentLbl.text = commentM.m_content;
    cell.p_timeLbl.text = commentM.m_commentTime;
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{

}


@end
