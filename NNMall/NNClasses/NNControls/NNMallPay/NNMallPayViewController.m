//
//  NNMallPayViewController.m
//  NNMall
//
//  Created by shaoxu on 15/11/19.
//  Copyright © 2015年 shaoxu. All rights reserved.
//

#import "NNMallPayViewController.h"
#import "NNMallPayView.h"

@interface NNMallPayViewController ()<NNMallPayDelegate>
{
    NNMallPayView *m_mallPayView;
}
@property (nonatomic,strong) IBOutlet NNMallPayView *p_mallPayView;
@end

@implementation NNMallPayViewController
@synthesize p_payOrderM = m_payOrderM;
@synthesize p_mallPayView = m_mallPayView;
@synthesize p_payFrom = m_payFrom;

-(void)dealloc
{
    [[NSNotificationCenter defaultCenter]removeObserver:self];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    m_mallPayView.p_payDelegate = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)payWX
{
    
}

-(void)payUseAlipay
{
    //TODO....跳转支付。
    /*
     *商户的唯一的parnter和seller。
     *签约后，支付宝会为每个商户分配一个唯一的 parnter 和 seller。
     */
    
    /*============================================================================*/
    /*=======================需要填写商户app申请的===================================*/
    /*============================================================================*/
    NSString *partner = @"2088911709098385";
    NSString *seller = @"13666620226@qq.com";
    NSString *privateKey = @"MIICdgIBADANBgkqhkiG9w0BAQEFAASCAmAwggJcAgEAAoGBAKr0c/fFF3J2++XBEEV4plj1WFRa1jIacvQPY0c/dwhxMl815DDy2b1Gg0e8YsKcZ/V3RldleCf84Ha39IBtC7d3r5INZ/ue4bHeNZa2nWtWO5zCKLHQmwIRE1peUeceFcXYG6pjfSgAK31PO3Jod0aPzl7P7iH6TKNSvmzMIB4nAgMBAAECgYBuEGjBcsE/zt8q8vvY3m6rA3rVBI63P1QXUfjnHDM02jxGFFpQMWqCc+19uAoVpcFAxoQhLJEJncOea50dOhe5/y8gzzCexunDRHfGHJ4cNT5HZ8TRPme3dSmklRfzj+oNTRQZ6gCzItTibxq1WHFrCtnArpdTmbvq5yzE7De5sQJBAOLe3CnG7TGArNjhaEv9HLSMBhxa3YlgTPlHgqnykUaEl4wcQtt9ULwNtrZ8DYCYeyuMhTge5KIAYokGbjcrAIMCQQDA56s7tEokw2eJ8I3dEIur8tuYXq8REUseH65PQMPExfIzSJGpTf3nqfs8YrVsPXhtSuSYytiGkcFVXRtlJ/KNAkA2N6hJ255nzCaClivErTKk+ymisRxsbjU3BZ32W1/YiGtnMoHPznzy1BwsNC1N5CLbX3Oe29Mr3AewU3cXfBFdAkAajAdBmScW9hk6n3M2d/9ws2RLDMS06ZdX1u5LE9OdMcyKCDObhBMsHXVoswDam38GM2dQK6IuqsJbeAu8GQpFAkEAllzNRgZx9fYGs5/Ms4IML1wxwAHsY3jpoYvSHkFAE/bDI7ONCQGuZjQQLk1wJOz/jx4z046eDE8lZvdifHOPIA==";
    /*============================================================================*/
    /*============================================================================*/
    /*============================================================================*/
    
    //partner和seller获取失败,提示
    if ([partner length] == 0 ||
        [seller length] == 0 ||
        [privateKey length] == 0)
    {
        [NNCommonDeal promptWithAlert:self titleOfPrompt:@"提示" tag:110 messageOfPrompt:@"缺少partner或者seller或者私钥。" cancelButtonTitle:@"确定" otherButtonTitleArray:nil];
        return;
    }
    
    /*
     *生成订单信息及签名
     */
    //将商品信息赋予AlixPayOrder的成员变量
    Order *order = [[Order alloc] init];
    order.partner = partner;
    order.seller = seller;
    
    order.tradeNO = m_payOrderM.m_orderId; //订单ID（由商家自行制定）
    order.productName = @"暖暖商城购物"; //商品标题
    order.productDescription = @"暖暖科技"; //商品描述
    order.amount = m_payOrderM.m_orderCost;//[NSString stringWithFormat:@"%@",segueValueFromMess.m_cost]; //商品价格
    
    order.notifyURL =  [NSString stringWithFormat:@"%@/api/v2/alipay/pay/callback",NNHttpServiceUrl]; //回调URL
    
    order.service = @"mobile.securitypay.pay";
    order.paymentType = @"1";
    order.inputCharset = @"utf-8";
    order.itBPay = @"30m";
    order.showUrl = @"m.alipay.com";
    
    //应用注册scheme,在AlixPayDemo-Info.plist定义URL types
    NSString *appScheme = @"alipaynn";
    
    //将商品信息拼接成字符串
    NSString *orderSpec = [order description];
    NSLog(@"orderSpec = %@",orderSpec);
    
    //获取私钥并将商户信息签名,外部商户可以根据情况存放私钥和签名,只需要遵循RSA签名规范,并将签名字符串base64编码和UrlEncode
    id<DataSigner> signer = CreateRSADataSigner(privateKey);
    NSString *signedString = [signer signString:orderSpec];
    
    //将签名成功字符串格式化为订单字符串,请严格按照该格式
    NSString *orderString = nil;
    if (signedString != nil) {
        orderString = [NSString stringWithFormat:@"%@&sign=\"%@\"&sign_type=\"%@\"",
                       orderSpec, signedString, @"RSA"];
        
        [[AlipaySDK defaultService] payOrder:orderString fromScheme:appScheme callback:^(NSDictionary *resultDic) {
            NSLog(@"reslut = %@",resultDic);
            [self payResult:[resultDic valueForKeyPath:@"resultStatus"]];
            //TODO 解析结果，成功的话跳入已付款订单
            
        }];
    }
}

-(void)payResult:(NSString*)result
{
    //显示支付结果
}


@end