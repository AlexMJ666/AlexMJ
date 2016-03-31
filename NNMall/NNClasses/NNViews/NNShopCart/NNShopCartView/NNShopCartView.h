//
//  NNShopCartView.h
//  NNMall
//
//  Created by shaoxu on 15/11/3.
//  Copyright © 2015年 shaoxu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ProductModel.h"
#import "OrderModel.h"

typedef void(^CartSuccessBlock) (id sucBack);
typedef void(^CartFailedBlock)  (id failedBack);

@protocol NNShopCartDelegate <NSObject>

-(void)selectProduct:(ProductModel *)productM;

-(void)deleteProduct:(ProductModel *)productM;

-(void)gotoOrder:(OrderModel *)orderM;

-(void)gotoLoginView:(id)sender;

-(void)reloadShoppingCartData:(CartSuccessBlock)subBlock_ andFailed:(CartFailedBlock)failedBlock_;

@end

@interface NNShopCartView : UIView
{
    __weak id<NNShopCartDelegate> m_nnShopCartDelegate;
}
@property (nonatomic,weak) id<NNShopCartDelegate> p_nnShopCartDelegate;

-(void)layoutShopCartView;

-(void)refrshShoppingCartData:(NSMutableArray *)cartList
                      andLike:(NSMutableArray *)likeList;

-(void)editModel:(BOOL)isEdit;

@end
