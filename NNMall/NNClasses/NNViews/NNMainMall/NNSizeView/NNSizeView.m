//
//  NNSizeView.m
//  NNMall
//
//  Created by shaoxu on 15/11/16.
//  Copyright © 2015年 shaoxu. All rights reserved.
//

#import "NNSizeView.h"
#import <SDWebImage/UIImageView+WebCache.h>
#import "HJCAjustNumButton.h"
#import "NNSizeCollect.h"
#define kSizeHeight 60
#define kImageHeight 80
#define kOx 15

@interface NNSizeView ()<UICollectionViewDataSource,UICollectionViewDelegate,NNSizeCollectDelegate,UICollectionViewDelegateFlowLayout>
{
    UIView      *m_sizeView;
    UIImageView *m_proImageView;
    UILabel     *m_proNameLbl;
    UILabel     *m_proPriceLbl;
    UILabel     *m_proTypeLbl;
    UIButton    *m_trueBtn;
    UICollectionView *m_sizeCollectView;
    HJCAjustNumButton *m_ajustBtn;
    
    NSMutableArray *m_keyArray; //存放key值
    ProductModel *m_sizePM;
    NSMutableArray *m_sizeArray;   //存放尺寸
    
    NSMutableArray *m_labelArray;  //存放已实例的标题对象，避免重新实例，增加内存消耗
}
@property (nonatomic,strong) UIView *p_sizeView;
@property (nonatomic,strong) UIImageView *p_proImageView;
@property (nonatomic,strong) UILabel *p_proNameLbl;
@property (nonatomic,strong) UILabel *p_proPriceLbl;
@property (nonatomic,strong) UILabel *p_proTypeLbl;
@property (nonatomic,strong) UIButton *p_trueBtn;
@property (nonatomic,strong) HJCAjustNumButton *p_ajustBtn;
@property (nonatomic,strong) UICollectionView *p_sizeCollectView;

@property (nonatomic,strong) NSMutableArray *p_keyArray;
@property (nonatomic,strong) ProductModel *p_sizePM;
@property (nonatomic,strong) NSMutableArray *p_sizeArray;

@property (nonatomic,strong) NSMutableArray *p_labelArray;


@end

@implementation NNSizeView
@synthesize p_sizeView = m_sizeView;
@synthesize p_proImageView = m_proImageView;
@synthesize p_proNameLbl = m_proNameLbl;
@synthesize p_proPriceLbl = m_proPriceLbl;
@synthesize p_proTypeLbl = m_proTypeLbl;
@synthesize p_trueBtn = m_trueBtn;
@synthesize p_ajustBtn = m_ajustBtn;
@synthesize p_keyArray = m_keyArray;
@synthesize p_sizePM = m_sizePM;
@synthesize p_sizeArray = m_sizeArray;
@synthesize p_labelArray = m_labelArray;
@synthesize p_sizeCollectView = m_sizeCollectView;
@synthesize p_nnSizeDelegate = m_nnSizeDelegate;

-(void)dealloc
{

}

-(id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self createSizeView:frame];
    }
    return self;
}

-(void)createSizeView:(CGRect)frame
{
    if (!self.p_sizeView) {
        //1.设置显示区
        self.p_sizeView = [[UIView alloc]initWithFrame:CGRectMake(0, frame.size.height, kMainScreen_Width, 2*frame.size.height/3.0f)];
        m_sizeView.backgroundColor = [UIColor whiteColor];
        [self addSubview:m_sizeView];
        //2.商品对照数据视图
        self.p_proImageView = [[UIImageView alloc]initWithFrame:CGRectMake(10, 10, kImageHeight, kImageHeight)];
        m_proImageView.backgroundColor = LGraycolor;
        [m_sizeView addSubview:m_proImageView];
        self.p_proNameLbl = [[UILabel alloc]initWithFrame:CGRectMake(kImageHeight+20, 10, kMainScreen_Width-kImageHeight-30, 44)];
        m_proNameLbl.font = [NNCommonDeal getFont:16];
        m_proNameLbl.numberOfLines = 0;
        [m_sizeView addSubview:m_proNameLbl];
        self.p_proPriceLbl = [[UILabel alloc]initWithFrame:CGRectMake(kImageHeight+20, kImageHeight-12, kMainScreen_Width-kImageHeight-30, 22)];
        m_proPriceLbl.font = [NNCommonDeal getFont:16];
        m_proPriceLbl.textColor = Redcolor;
        [m_sizeView addSubview:m_proPriceLbl];
        //3.规格选择(collectionview)
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
        //    flowLayout.itemSize = self.frame.size;
        //    flowLayout.minimumLineSpacing = 0;
        flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
        
        self.p_sizeCollectView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, kImageHeight+20, kMainScreen_Width, m_sizeView.frame.size.height-kImageHeight-180) collectionViewLayout:flowLayout];
        m_sizeCollectView.backgroundColor = [UIColor whiteColor];
        //    m_sizeCollectView.pagingEnabled = YES;
        m_sizeCollectView.showsHorizontalScrollIndicator = NO;
        m_sizeCollectView.showsVerticalScrollIndicator = NO;
        [m_sizeCollectView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"SizeHeader"];
        [m_sizeCollectView registerClass:[NNSizeCollect class] forCellWithReuseIdentifier:@"SizeCollect"];
        m_sizeCollectView.dataSource = self;
        m_sizeCollectView.delegate = self;
        [m_sizeView addSubview:m_sizeCollectView];
        
        //4.数量
        UILabel *numLbl = [[UILabel alloc]initWithFrame:CGRectMake(15, m_sizeView.frame.size.height-100, 50, 30)];
        numLbl.text = @"数量";
        numLbl.font = [NNCommonDeal getFont:12];
        [m_sizeView addSubview:numLbl];
        [m_sizeView addSubview:[self getNumberCount:CGRectMake(kMainScreen_Width-105, m_sizeView.frame.size.height-100, 90, 30)]];
        
        //5.确定按钮
        self.p_trueBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        m_trueBtn.frame = CGRectMake(0, m_sizeView.frame.size.height-50, kMainScreen_Width, 50);
        m_trueBtn.backgroundColor = Redcolor;
        [m_trueBtn setTitle:@"确定" forState:UIControlStateNormal];
        [m_trueBtn addTarget:self action:@selector(trueBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        [m_sizeView addSubview:m_trueBtn];
    }

    
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    CGPoint pt = [touch locationInView:self];
    
    if (!CGRectContainsPoint([m_sizeView frame], pt)) {
        [UIView animateWithDuration:0.2f animations:^{
            m_sizeView.frame = CGRectMake(0, self.frame.size.height, kMainScreen_Width, 2*self.frame.size.height/3.0f);
        } completion:^(BOOL finished) {
            if (m_nnSizeDelegate && [m_nnSizeDelegate respondsToSelector:@selector(hideSize:)]) {
                [m_nnSizeDelegate hideSize:nil];
            }
        }];
    }
}

#pragma mark - Data

-(void)refreshSizeData:(ProductModel *)productM
{
    self.p_keyArray = [NSMutableArray arrayWithArray:productM.m_sizeDictionary.allKeys];
    self.p_sizeArray = [[NSMutableArray alloc]init];

    for (int i=0; i<m_keyArray.count; i++) {
        NSString *key = [m_keyArray objectAtIndex:i];
        NSArray *titleArr = [productM.m_sizeDictionary objectForKey:key];
        NSMutableArray *sizeArr = [[NSMutableArray alloc]init];
        for (int j=0; j<titleArr.count; j++) {
            NSString *value = [titleArr objectAtIndex:j];
            CGSize titleSize = [value boundingRectWithSize:CGSizeMake(kMainScreen_Width-30, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:12]} context:nil].size;
            [sizeArr addObject:[NSString stringWithFormat:@"%f",titleSize.width+20]];
            [m_sizeCollectView registerClass:[NNSizeCollect class] forCellWithReuseIdentifier:[NSString stringWithFormat:@"SizeCollect%d",i*100+j]];
        }
        [m_sizeArray addObject:sizeArr];
    }
    

    
    // 数据
    self.p_sizePM = productM;
    [m_proImageView sd_setImageWithURL:[NSURL URLWithString:productM.m_productImgUrl] placeholderImage:nil];
    m_proNameLbl.text = productM.m_productName;
    if (productM.m_currentSizeArr) {
        m_proPriceLbl.text = [self getSelectSizePrice];
    }
    else{
        m_proPriceLbl.text = [NSString stringWithFormat:@"¥%@",productM.m_productCost];
    }
    [UIView animateWithDuration:0.2f animations:^{
        m_sizeView.frame = CGRectMake(0, self.frame.size.height/3.0f, kMainScreen_Width, 2*self.frame.size.height/3.0f);
    }];
    
    [m_sizeCollectView reloadData];
}

-(void)trueBtnClick:(id)sender
{
    //临时，后台数据封装过重新编写选择规格TODO
    
    for (NSDictionary *dic in m_sizePM.m_currentSizeArr) {
        NSString *sizename = [dic valueForKeyPath:@"specSize"];
        NSString *colorname = [dic valueForKeyPath:@"specColor"];
        if ([sizename isEqualToString:m_sizePM.m_currentSize] && [colorname isEqualToString:m_sizePM.m_currentColor]) {
            NSString *sizeId = [dic objectForKey:@"id"];
            m_sizePM.m_currentId = sizeId;
        }
    }
    if (m_sizePM.m_currentId.length == 0) {
        [SVProgressHUD showInfoWithStatus:@"暂无货" maskType:SVProgressHUDMaskTypeNone];
        return;
    }
    
    //1.关闭尺寸选择
    if (m_nnSizeDelegate && [m_nnSizeDelegate respondsToSelector:@selector(chooseProductSize:)]) {
        [m_nnSizeDelegate chooseProductSize:m_sizePM];
    }
}

#pragma mark - Private methods

-(HJCAjustNumButton *)getNumberCount:(CGRect)frame
{
    if (!self.p_ajustBtn) {
        self.p_ajustBtn = [[HJCAjustNumButton alloc] init];
        m_ajustBtn.frame = frame;
        m_ajustBtn.lineColor = [UIColor lightTextColor];
    }
    
    __weak __typeof(self)weakSelf = self;
    m_ajustBtn.callBack = ^(NSString *currentNum){
        if (currentNum.integerValue > m_sizePM.m_currentBuyCount) {
            weakSelf.p_sizePM.m_currentBuyCount++;
        }
        else if (currentNum.integerValue < m_sizePM.m_currentBuyCount){
            weakSelf.p_sizePM.m_currentBuyCount--;
        }
    };
    if (m_sizePM.m_currentBuyCount>0) {
        m_ajustBtn.currentNum = [NSString stringWithFormat:@"%ld",(long)m_sizePM.m_currentBuyCount];
    }
    else{
        m_ajustBtn.currentNum = @"1";
    }
    return m_ajustBtn;
}

-(NSString *)getSelectSizePrice
{
    //计算价格区间
    double minPrice = 0.0f;
    double maxPrice = 0.0f;
    NSMutableArray *priceArr = [[NSMutableArray alloc]init];
    for (NSDictionary *dic in m_sizePM.m_currentSizeArr) {
        NSString *price = [dic objectForKey:@"specPrice"];
        minPrice = price.doubleValue;
        [priceArr addObject:price];
    }
    
    double tempPrice = 0.0f;
    for (NSString *price in priceArr) {
        tempPrice = price.doubleValue;
        if (maxPrice<=tempPrice) {
            maxPrice = tempPrice;
        }
        if (minPrice>=tempPrice) {
            minPrice = tempPrice;
        }
    }
    
    if (maxPrice == minPrice) {
        return [NSString stringWithFormat:@"¥%.1f",minPrice];
    }
    else{
        return [NSString stringWithFormat:@"¥%.1f-¥%.1f",minPrice,maxPrice];
    }
}


#pragma mark - collectionView delegate
//设置分区
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    
    return m_keyArray.count;
}

//每个分区上的元素个数
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    NSString *key = [m_keyArray objectAtIndex:section];
    return [[m_sizePM.m_sizeDictionary objectForKey:key]count];
}

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
{
    CGSize size={kMainScreen_Width,20};
    return size;
}

- (UICollectionReusableView *) collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    UICollectionReusableView *reusableview = nil;
    
    if (kind == UICollectionElementKindSectionHeader)
    {
        UICollectionReusableView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"SizeHeader" forIndexPath:indexPath];
        
        //绘制规格按钮
        NSString *key = [m_keyArray objectAtIndex:indexPath.section];
        if (!self.p_labelArray) {
            self.p_labelArray = [[NSMutableArray alloc]init];
        }
        if (m_labelArray.count == m_keyArray.count) {
            [headerView addSubview:[m_labelArray objectAtIndex:indexPath.section]];
        }
        else{
            UILabel *headerLbl = [[UILabel alloc]initWithFrame:CGRectMake(15, 0, kMainScreen_Width-30, 20)];
            headerLbl.font = [NNCommonDeal getFont:12];
            [m_labelArray addObject:headerLbl];
            headerLbl.text = key;
            [headerView addSubview:headerLbl];
        }
        reusableview = headerView;
    }
    return reusableview;
}

//设置元素内容
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    NSString *SizeCollect = [NSString stringWithFormat:@"SizeCollect%ld",indexPath.section*100+indexPath.item];
    NNSizeCollect *cell = (NNSizeCollect *)[collectionView dequeueReusableCellWithReuseIdentifier:SizeCollect forIndexPath:indexPath];
    cell.p_nnSizeCollectDelegate = self;
    [cell sizeToFit];
    //绘制规格按钮
    NSString *key = [m_keyArray objectAtIndex:indexPath.section];
    NSArray *titleArr = [m_sizePM.m_sizeDictionary objectForKey:key];
    NSString *width = [[m_sizeArray objectAtIndex:indexPath.section] objectAtIndex:indexPath.item];
    [cell refreshSizeCollect:[titleArr objectAtIndex:indexPath.item] andKey:key andProductM:m_sizePM andWidth:width];
    return cell;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{

}

#pragma mark --UICollectionViewDelegateFlowLayout
//定义每个UICollectionView 的大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *width = [[m_sizeArray objectAtIndex:indexPath.section] objectAtIndex:indexPath.item];
    return CGSizeMake(width.floatValue+20, 30);
}

//定义每个UICollectionView 的 margin
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(5, 15, 5, 15);
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 5;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return 5;
}

#pragma mark - NNSizeCollectDelegate
-(void)selectSizeBtn:(NSString *)type
{
    //1.color
    if ([type isEqualToString:@"color"]) {
        m_sizePM.m_currentSizeArr = [[NSMutableArray alloc]init];
        for (NSDictionary *sizeDic in m_sizePM.m_sizeListArr) {
            NSString *colorname = [sizeDic valueForKeyPath:@"specColor"];
            if ([colorname isEqualToString:m_sizePM.m_currentColor]) {
                [m_sizePM.m_currentSizeArr addObject:sizeDic];
                
            }
        }
        m_sizePM.m_currentSize = @"";
    }
    if ([type isEqualToString:@"size"]) {
        for (NSDictionary *sizeDic in m_sizePM.m_sizeListArr) {
            NSString *sizename = [sizeDic valueForKeyPath:@"specSize"];
            if (![sizename isEqualToString:m_sizePM.m_currentSize]) {
                [m_sizePM.m_currentSizeArr removeObject:sizeDic];
            }
        }
    }
    
    //计算价格区间显示
    if (m_sizePM.m_currentSizeArr) {
        m_proPriceLbl.text = [self getSelectSizePrice];
    }
    else{
        m_proPriceLbl.text = [NSString stringWithFormat:@"¥%@",m_sizePM.m_productCost];
    }

    [m_sizeCollectView reloadData];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end