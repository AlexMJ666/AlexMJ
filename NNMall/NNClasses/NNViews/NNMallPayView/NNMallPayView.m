//
//  NNMallPayView.m
//  NNMall
//
//  Created by shaoxu on 15/11/19.
//  Copyright © 2015年 shaoxu. All rights reserved.
//

#import "NNMallPayView.h"

@interface NNMallPayView ()<UICollectionViewDataSource,UICollectionViewDelegate>
{
    UICollectionView *m_payCollectionView;
}
@property (nonatomic,strong) IBOutlet UICollectionView *p_payCollectionView;
@end

@implementation NNMallPayView
@synthesize p_payCollectionView = m_payCollectionView;
@synthesize p_payDelegate = m_payDelgate;


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

#pragma mark - collectionView delegate
//设置分区
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    
    return 1;
}

//每个分区上的元素个数
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 1;
}

//设置元素内容
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *PayCollect = @"PayCollect";
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:PayCollect forIndexPath:indexPath];
    [cell sizeToFit];
    cell.layer.masksToBounds = YES;
    cell.layer.cornerRadius = 5;
    return cell;
}

//点击元素触发事件
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0 && indexPath.item == 0) {
        if (m_payDelgate && [m_payDelgate respondsToSelector:@selector(payUseAlipay)]) {
            [m_payDelgate payUseAlipay];
        }
    }
}

#pragma mark --UICollectionViewDelegateFlowLayout
//定义每个UICollectionView 的大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(kMainScreen_Width-12, 110);
}

//定义每个UICollectionView 的 margin
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(10, 6, 10, 6);
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 10.0f;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return 0.001f;
}



@end