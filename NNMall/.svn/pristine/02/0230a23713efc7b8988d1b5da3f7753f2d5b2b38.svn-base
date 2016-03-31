//
//  NNShare.m
//  NNMall
//
//  Created by shaoxu on 15/11/3.
//  Copyright © 2015年 shaoxu. All rights reserved.
//

#import "NNShare.h"

#define kShareContent            @"分享一下撒"
#define kQQZoneTitle             @"暖暖商城"
#define kItunesUrl               @"https://itunes.apple.com/us/app/qing-song-ting-che/id1013741112?l=zh&ls=1&mt=8"

static NNShare *g_nnShare;

@implementation NNShare

+ (NNShare *)shareInstanceManager
{
    @synchronized(self)
    {
        if (!g_nnShare)
        {
            g_nnShare = [[NNShare alloc] init];
        }
    }
    return g_nnShare;
}

-(void)shareSDK:(NSInteger)tag
{
    switch (tag) {
        case shareWXHY:
            [self shareWeiXinfriend];
            break;
        case sharePYQ:
            [self shareToPYQ];
            break;
        case shareQQ:
            [self shareToQQ];
            break;
        case shareQQZONE:
            [self shareToQQZone];
            break;
        default:
            break;
    }
}

- (void)setThumbImage:(SendMessageToWXReq *)req
{
    UIImage *image = [UIImage imageNamed:@"qstc-logo.png"];
    [req.message setThumbImage:image];
    
    WXWebpageObject *webObject = WXWebpageObject.object;
    NSURL *url = [NSURL URLWithString:kItunesUrl];
    webObject.webpageUrl = [url absoluteString];
    req.message.mediaObject = webObject;
}

-(void)shareWeiXinfriend
{
    if ([WXApi isWXAppInstalled]) {
        SendMessageToWXReq* req = [[SendMessageToWXReq alloc] init];
        req.scene = WXSceneSession;
        req.message = WXMediaMessage.message;
        req.message.title = kQQZoneTitle;
        req.message.description = kShareContent;
        [self setThumbImage:req];
        [WXApi sendReq:req];
    }
    else{
        [NNCommonDeal promptWithAlert:self titleOfPrompt:@"提示" tag:100 messageOfPrompt:@"您尚未安装微信,无法分享." cancelButtonTitle:@"确定" otherButtonTitleArray:nil];
    }
    
}

-(void)shareToPYQ
{
    if ([WXApi isWXAppInstalled]) {
        SendMessageToWXReq* req = [[SendMessageToWXReq alloc] init];
        req.scene = WXSceneTimeline;
        req.message = WXMediaMessage.message;
        req.message.title = kQQZoneTitle;
        req.message.description = kShareContent;
        [self setThumbImage:req];
        [WXApi sendReq:req];
    }
    else{
        [NNCommonDeal promptWithAlert:self titleOfPrompt:@"提示" tag:101 messageOfPrompt:@"您尚未安装微信,无法分享." cancelButtonTitle:@"确定" otherButtonTitleArray:nil];
    }
}

-(void)shareToQQ
{
    TencentOAuth* auth = [[TencentOAuth alloc]initWithAppId:TencentID andDelegate:self];
    NSLog(@"%@",auth);
    NSURL* url = [NSURL URLWithString:kItunesUrl];
    UIImage *imageNew = [UIImage imageNamed:@"qstc-logo.png"];
    NSData *picData = UIImageJPEGRepresentation(imageNew,1.0);
    QQApiNewsObject *imgObj = [QQApiNewsObject objectWithURL:url title:kQQZoneTitle description:kShareContent previewImageData:picData];
    [imgObj setCflag:kQQAPICtrlFlagQQShare];
    
    SendMessageToQQReq* req = [SendMessageToQQReq reqWithContent:imgObj];
    
    QQApiSendResultCode sent = [QQApiInterface sendReq:req];
    [self handleSendResult:sent];
}

-(void)shareToQQZone
{
    TencentOAuth* auth = [[TencentOAuth alloc]initWithAppId:@"1104601871" andDelegate:self];
    NSLog(@"%@",auth);
    NSURL* url = [NSURL URLWithString:kItunesUrl];
    UIImage *imageNew = [UIImage imageNamed:@"ico-welcome.png"];
    NSData *picData = UIImageJPEGRepresentation(imageNew,1.0);
    QQApiNewsObject *imgObj = [QQApiNewsObject objectWithURL:url title:kQQZoneTitle description:kShareContent previewImageData:picData];
    [imgObj setCflag:kQQAPICtrlFlagQZoneShareOnStart];
    
    SendMessageToQQReq* req = [SendMessageToQQReq reqWithContent:imgObj];
    
    QQApiSendResultCode sent = [QQApiInterface SendReqToQZone:req];
    
    [self handleSendResult:sent];
}

/**
 *  腾讯请求处理方法
 *
 *  @param sendResult 请求返回结果
 */
- (void)handleSendResult:(QQApiSendResultCode)sendResult
{
    switch (sendResult)
    {
        case EQQAPIAPPNOTREGISTED:
        {
            UIAlertView *msgbox = [[UIAlertView alloc] initWithTitle:@"Error" message:@"App未注册" delegate:nil cancelButtonTitle:@"取消" otherButtonTitles:nil];
            [msgbox show];
            
            break;
        }
        case EQQAPIMESSAGECONTENTINVALID:
        case EQQAPIMESSAGECONTENTNULL:
        case EQQAPIMESSAGETYPEINVALID:
        {
            UIAlertView *msgbox = [[UIAlertView alloc] initWithTitle:@"Error" message:@"发送参数错误" delegate:nil cancelButtonTitle:@"取消" otherButtonTitles:nil];
            [msgbox show];
            
            break;
        }
        case EQQAPIQQNOTINSTALLED:
        {
            UIAlertView *msgbox = [[UIAlertView alloc] initWithTitle:@"Error" message:@"未安装手Q" delegate:nil cancelButtonTitle:@"取消" otherButtonTitles:nil];
            [msgbox show];
            
            break;
        }
        case EQQAPIQQNOTSUPPORTAPI:
        {
            UIAlertView *msgbox = [[UIAlertView alloc] initWithTitle:@"Error" message:@"API接口不支持" delegate:nil cancelButtonTitle:@"取消" otherButtonTitles:nil];
            [msgbox show];
            
            break;
        }
        case EQQAPISENDFAILD:
        {
            UIAlertView *msgbox = [[UIAlertView alloc] initWithTitle:@"Error" message:@"发送失败" delegate:nil cancelButtonTitle:@"取消" otherButtonTitles:nil];
            [msgbox show];
            
            break;
        }
        default:
        {
            break;
        }
    }
}

#pragma mark - 腾讯代理方法
-(void)tencentDidLogin
{}

-(void)tencentDidLogout
{}

-(void)tencentDidNotNetWork
{}

-(void)tencentDidNotLogin:(BOOL)cancelled
{}


@end
