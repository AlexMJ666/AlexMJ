//
//  NNDailyCell.m
//  NNMall
//
//  Created by shaoxu on 15/11/12.
//  Copyright © 2015年 shaoxu. All rights reserved.
//

#import "NNDailyCell.h"
#import "NNMallCollect.h"
#import <SDWebImage/UIImageView+WebCache.h>

#define CollectWidth (kMainScreen_Width-30)/2.0f

@interface NNDailyCell ()<UICollectionViewDataSource,UICollectionViewDelegate>
{
    UICollectionView    *m_collectionView;
    MallModel           *m_dailyMallM;
}
@property (nonatomic,strong) IBOutlet UICollectionView     *p_collectionView;
@property (nonatomic,strong) MallModel            *p_dailyMallM;
@end

@implementation NNDailyCell
@synthesize p_collectionView = m_collectionView;
@synthesize p_dailyMallM = m_dailyMallM;
@synthesize p_nnDailyCellDelegate = m_nnDailyCellDelegate;

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)refreshDailyData:(MallModel *)mallModel
{
    self.p_dailyMallM = mallModel;
    [m_collectionView reloadData];
}

#pragma mark - collectionView delegate
//设置分区
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    
    return 1;
}

//每个分区上的元素个数
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return m_dailyMallM.m_productListArray.count;
}

//设置元素内容
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *DailyCol = @"DailyCollect";
    NNMallCollect *cell = (NNMallCollect *)[collectionView dequeueReusableCellWithReuseIdentifier:DailyCol forIndexPath:indexPath];
    [cell sizeToFit];
    cell.layer.borderColor = Collectcolor.CGColor;
    ProductModel *productM = [m_dailyMallM.m_productListArray objectAtIndex:indexPath.item];
    [cell.p_imageView sd_setImageWithURL:[NSURL URLWithString:productM.m_productImgUrl] placeholderImage:[AppManage getDefaultImage:@"192"]];
    cell.p_productNameLbl.text = productM.m_productName;
    cell.p_productPrice.text = [NSString stringWithFormat:@"¥ %@",productM.m_productCost];
    return cell;
}

//点击元素触发事件
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    ProductModel *productM = [m_dailyMallM.m_productListArray objectAtIndex:indexPath.row];
    if (m_nnDailyCellDelegate && [m_nnDailyCellDelegate respondsToSelector:@selector(dailySelectRowAt:)]) {
        [m_nnDailyCellDelegate dailySelectRowAt:productM];
    }
}

#pragma mark --UICollectionViewDelegateFlowLayout
//定义每个UICollectionView 的大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
//    CGFloat count = (m_dailyMallM.m_productListArray.count/2)+(m_dailyMallM.m_productListArray.count%2);
//    CGFloat height = count*kBAR_HEIGHT/3.0f;
    return CGSizeMake(CollectWidth, CollectWidth+76);
}

//定义每个UICollectionView 的 margin
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(5, 10, 5, 10);
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 10;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return 0.001f;
}


@end
