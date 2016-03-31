//
//  NNMainMallView.m
//  NNMall
//
//  Created by shaoxu on 15/11/3.
//  Copyright © 2015年 shaoxu. All rights reserved.
//

#import "NNMainMallView.h"
#import <SDCycleScrollView.h>
#import <SDWebImage/UIImageView+WebCache.h>
#import "NNMallCell.h"
#import "NNDailyCell.h"
#import <MJRefresh.h>
@interface NNMainMallView ()<UITableViewDataSource,UITableViewDelegate,SDCycleScrollViewDelegate,NNDailyCellDelegate>
{
    UITableView         *m_mainTableView;
    SDCycleScrollView   *m_cycleView;

    NSMutableArray      *m_dataMallArray;
}
@property (nonatomic,strong) IBOutlet UITableView *p_mainTableView;
@property (nonatomic,strong) SDCycleScrollView    *p_cycleView;
@property (nonatomic,strong) NSMutableArray      *p_dataMallArray;
@end

@implementation NNMainMallView
@synthesize p_mainTableView = m_mainTableView;
@synthesize p_cycleView = m_cycleView;
@synthesize p_dataMallArray = m_dataMallArray;
@synthesize p_nnMainMallDelegate = m_nnMainMallDelegate;

-(void)dealloc
{

}

-(id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
//        [self createDailyView];
    }
    return self;
}

-(void)initMallRefresh
{
    MJRefreshStateHeader *header = [MJRefreshStateHeader headerWithRefreshingBlock:^{
        if (m_nnMainMallDelegate && [m_nnMainMallDelegate respondsToSelector:@selector(reloadMainMallData:andFailed:)]) {
            [m_nnMainMallDelegate reloadMainMallData:^(id sucBack) {
                NSMutableArray *arr = (NSMutableArray *)sucBack;
                [self refreshMainMallData:arr];
                [m_mainTableView.header endRefreshing];
            } andFailed:^(id failedBack) {
                [m_mainTableView.header endRefreshing];
            }];
        }
    }];
    [header setTitle:@"下拉刷新" forState:MJRefreshStateIdle];
    [header setTitle:@"松开立即刷新" forState:MJRefreshStatePulling];
    [header setTitle:@"正在刷新" forState:MJRefreshStateRefreshing];
    header.stateLabel.font = [NNCommonDeal getFont:12];
    header.lastUpdatedTimeLabel.hidden = YES;
    m_mainTableView.header = header;
    m_mainTableView.backgroundColor = [UIColor whiteColor];
//    m_mainTableView.alpha = 0;
}

#pragma mark - 广告页
-(void)createCycleView:(MallModel *)mallModel
{
    // 网络加载 --- 创建不带标题的图片轮播器
    NSMutableArray *imageArr = [[NSMutableArray alloc]init];
    for (ProductModel *productM in mallModel.m_productListArray) {
        [imageArr addObject:productM.m_productImgUrl];
    }
    
    if (!self.p_cycleView) {
        self.p_cycleView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 0, kMainScreen_Width, 166.0f) imageURLStringsGroup:imageArr];
        m_cycleView.autoScrollTimeInterval = 3;
        m_cycleView.backgroundColor = [UIColor whiteColor];
        m_cycleView.infiniteLoop = YES;
        m_cycleView.delegate = self;
        m_cycleView.placeholderImage = [UIImage imageNamed:@"back414-166.png"];
        m_cycleView.pageControlAliment = SDCycleScrollViewPageContolAlimentRight;
        m_cycleView.pageControlStyle = SDCycleScrollViewPageContolStyleClassic;
    }
    else{
        m_cycleView.imageURLStringsGroup = imageArr;
    }
}

-(void)moreDailyBtnClick:(id)sender
{
    UIButton *btn = (UIButton *)sender;
    if (m_nnMainMallDelegate && [m_nnMainMallDelegate respondsToSelector:@selector(showMoreDailyProduct:)]) {
        [m_nnMainMallDelegate showMoreDailyProduct:btn.tag];
    }
}

#pragma mark - DataSource
-(void)refreshMainMallData:(NSMutableArray *)productArray
{
    self.p_dataMallArray = productArray;
    
    if (productArray.count>0) {
        // 生成广告轮换图
        [self createCycleView:[productArray firstObject]];
        [m_mainTableView reloadData];
        
//        if (m_mainTableView.alpha == 0) {
//            m_mainTableView.alpha = 1.0f;
//            CATransition *animation = [CATransition animation];
//            [animation setDuration:0.35f];
//            [animation setType:kCATransitionFade];
//            [animation setFillMode:kCAFillModeForwards];
//            [animation setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn]];
//            [m_mainTableView.layer addAnimation:animation forKey:nil];
//        }
    }
    m_mainTableView.backgroundColor = [UIColor colorWithRed:241/255.0f green:240/255.0f blue:237/255.0f alpha:1.0f];
}

#pragma mark - WareDetail TableView

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return m_dataMallArray.count;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == m_dataMallArray.count-1) {
        MallModel *mallM = [m_dataMallArray objectAtIndex:section];
        return mallM.m_productListArray.count;
    }
    return 1;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    MallModel *mallM = [m_dataMallArray objectAtIndex:section];
    if ([mallM.m_mallValue isEqualToString:@"1"]) {
        return 0.001f;
    }
    else if([mallM.m_mallValue isEqualToString:@"2"] || [mallM.m_mallValue isEqualToString:@"3"])
    {
        return 30.0f;
    }
    return 10.0f;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MallModel *mallM = [m_dataMallArray objectAtIndex:indexPath.section];
    if ([mallM.m_mallValue isEqualToString:@"1"]) {
        return 166.0f;
    }
    else if([mallM.m_mallValue isEqualToString:@"2"])
    {
        CGFloat count = (mallM.m_productListArray.count/2)+(mallM.m_productListArray.count%2);
        CGFloat height = ((kMainScreen_Width-30)/2.0f)+76.0f;
        return count*(height+10);
    }
    else if([mallM.m_mallValue isEqualToString:@"3"])
    {
        return 190.0f;
    }
    return 44;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 10.0f;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    MallModel *mallM = [m_dataMallArray objectAtIndex:section];
    if ([mallM.m_mallValue isEqualToString:@"2"] || [mallM.m_mallValue isEqualToString:@"3"]) {
        MallModel *mallM = [m_dataMallArray objectAtIndex:section];
        UIView *headView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kMainScreen_Width, 30.0f)];
        headView.backgroundColor = [UIColor whiteColor];
        UILabel *title = [[UILabel alloc]initWithFrame:CGRectMake(15, 0, 80, 30)];
        title.text = mallM.m_mallType;
        UIButton *moreBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        moreBtn.frame = CGRectMake(kMainScreen_Width-50, 0, 50, 30);
        [moreBtn setTitle:@" 更多 " forState:UIControlStateNormal];
        moreBtn.titleLabel.font = [NNCommonDeal getFont:12];
        moreBtn.tag = section;  //1:每日必看&2:每日推荐
        [moreBtn setTitleColor:SectionHeadcolor forState:UIControlStateNormal];
        [moreBtn addTarget:self action:@selector(moreDailyBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        [headView addSubview:moreBtn];
        title.textColor = SectionHeadcolor;
        title.font = [NNCommonDeal getFont:14];
        [headView addSubview:title];
        UILabel *red = [[UILabel alloc]initWithFrame:CGRectMake(0, 4, 5, 22)];
        red.backgroundColor = Redcolor;
        [headView addSubview:red];
        return headView;
    }
    return nil;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MallModel *mallM = [m_dataMallArray objectAtIndex:indexPath.section];
    if ([mallM.m_mallValue isEqualToString:@"1"]) {
        static NSString *Cycle = @"CycleCell";
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:Cycle forIndexPath:indexPath];
        
        if (!cell) {
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:Cycle];
        }
        [cell.contentView addSubview:m_cycleView];
        return cell;
    }
    else if ([mallM.m_mallValue isEqualToString:@"2"]){
        static NSString *Daily = @"DailyCell";
        NNDailyCell *cell = (NNDailyCell *)[tableView dequeueReusableCellWithIdentifier:Daily forIndexPath:indexPath];
        
        if (!cell) {
            cell = [[NNDailyCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:Daily];
        }
        cell.p_nnDailyCellDelegate = self;
        [cell refreshDailyData:mallM];
        return cell;
    }
    else if ([mallM.m_mallValue isEqualToString:@"3"]){
        static NSString *Mall = @"MallCell";
        NNMallCell *cell = (NNMallCell *)[tableView dequeueReusableCellWithIdentifier:Mall forIndexPath:indexPath];
        
        if (!cell) {
            cell = [[NNMallCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:Mall];
        }
        ProductModel *productM = [mallM.m_productListArray objectAtIndex:indexPath.row];
        [cell.p_goodsImageView sd_setImageWithURL:[NSURL URLWithString:productM.m_productImgUrl]
                                 placeholderImage:[AppManage getDefaultImage:@"192"]];
        cell.p_goodsNameLbl.text = productM.m_productName;
        cell.p_goodsPriceLbl.attributedText = [NNCommonDeal getOldPrice:productM.m_productPrice andNewPrice:productM.m_productCost andOldFontSize:14.0f andNewFontSize:28.0f];
        return cell;
    }
    else{
        static NSString *Shack = @"ShackCell";
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:Shack];
        if (!cell) {
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:Shack];
        }
        return cell;
    }
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    MallModel *mallM = [m_dataMallArray objectAtIndex:indexPath.section];
    if (![mallM.m_mallValue isEqualToString:@"1"] && ![mallM.m_mallValue isEqualToString:@"2"]) {
        ProductModel *productM = [mallM.m_productListArray objectAtIndex:indexPath.row];
        if (m_nnMainMallDelegate && [m_nnMainMallDelegate respondsToSelector:@selector(productDetail:)]) {
            [m_nnMainMallDelegate productDetail:productM];
        }
    }
}

-(void)dailySelectRowAt:(ProductModel *)productM
{
    if (m_nnMainMallDelegate && [m_nnMainMallDelegate respondsToSelector:@selector(productDetail:)]) {
        [m_nnMainMallDelegate productDetail:productM];
    }
}

#pragma mark - SDCycleScrollViewDelegate

- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index
{
    NSLog(@"---点击了第%ld张图片", (long)index);
    MallModel *mallM = [m_dataMallArray objectAtIndex:0];
    ProductModel *productM = [mallM.m_productListArray objectAtIndex:index];
    if (m_nnMainMallDelegate && [m_nnMainMallDelegate respondsToSelector:@selector(productDetail:)]) {
        [m_nnMainMallDelegate productDetail:productM];
    }

}


@end
