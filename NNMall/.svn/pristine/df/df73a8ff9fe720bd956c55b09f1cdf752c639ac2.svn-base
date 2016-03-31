//
//  NNCommentViewController.m
//  NNMall
//
//  Created by shaoxu on 15/11/20.
//  Copyright © 2015年 shaoxu. All rights reserved.
//

#import "NNCommentViewController.h"
#import "NNCommentView.h"
#import "NNCommentApply.h"
#import "CommentModel.h"
@interface NNCommentViewController ()<NNCommentDelegate>
{
    NNCommentView *m_commentView;
    NSMutableArray *m_commentDataArray;
    NSInteger pageNow;
}
@property (nonatomic,strong) IBOutlet NNCommentView *p_commentView;
@property (nonatomic,strong) NSMutableArray *p_commentDataArray;
@end

@implementation NNCommentViewController
@synthesize p_commentView = m_commentView;
@synthesize p_commentPM = m_commentPM;
@synthesize p_commentDataArray = m_commentDataArray;

-(void)dealloc
{

}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    pageNow = 1;
    m_commentView.p_nnCommentDelegate = self;
    [m_commentView initMJRefreshView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - NNCommentDelegate
-(void)refreshCommentList:(ReturnCommentSuc)returnBlock_ andFaild:(ReturnCommentFaild)returnFaild_
{
    [[NNCommentApply shareInstanceManager] requestCommentList:m_commentPM.m_productId andPage:@"1" andSucReturn:^(id content) {
        if (self.p_commentDataArray) {
            CommentModel *oldCommentM = [m_commentDataArray firstObject];
            NSMutableArray *arr = (NSMutableArray *)content;
            for (CommentModel *newCM in arr) {
                if (m_commentDataArray.count>0) {
                    if (newCM.m_commentId.integerValue > oldCommentM.m_commentId.integerValue) {
                        [m_commentDataArray insertObject:newCM atIndex:0];
                    }
                }
                else{
                    [m_commentDataArray addObject:newCM];
                }
            }
            
        }
        else{
            self.p_commentDataArray = (NSMutableArray *)content;
        }
        returnBlock_(m_commentDataArray);
    } andFaildReturn:^(NNErrorModel *errorM) {
        returnFaild_(nil);
    }];
}

-(void)loadMoreCommentList:(ReturnCommentSuc)returnBlock_ andFaild:(ReturnCommentFaild)returnFaild_
{
    if (m_commentDataArray.count<10) {
        [[NNCommentApply shareInstanceManager] requestCommentList:m_commentPM.m_productId andPage:[NSString stringWithFormat:@"%ld",(long)pageNow] andSucReturn:^(id content) {
            NSMutableArray *moreArr = (NSMutableArray *)content;
            self.p_commentDataArray = moreArr;
            returnBlock_(m_commentDataArray);
        } andFaildReturn:^(NNErrorModel *errorM) {
            returnFaild_(nil);
        }];
    }
    else{
        [[NNCommentApply shareInstanceManager] requestCommentList:m_commentPM.m_productId andPage:[NSString stringWithFormat:@"%ld",(long)pageNow+1] andSucReturn:^(id content) {
            NSMutableArray *moreArr = (NSMutableArray *)content;
            if (moreArr.count>0) {
                pageNow++;
            }
            [m_commentDataArray addObjectsFromArray:moreArr];
            returnBlock_(m_commentDataArray);
        } andFaildReturn:^(NNErrorModel *errorM) {
            returnFaild_(nil);
        }];
    }
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
