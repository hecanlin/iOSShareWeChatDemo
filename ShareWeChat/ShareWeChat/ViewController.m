//
//  ViewController.m
//  ShareWeChat
//
//  Created by 贺灿林 on 2019/4/18.
//  Copyright © 2019 贺灿林. All rights reserved.
//

#import "ViewController.h"
#import "WXApi.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    //[self shareWeChatImage];
    
    [self shareWeChatVideo];
    
    //[self shareWeChatLink];
}

/** 分享图片*/
- (void)shareWeChatImage
{
    SendMessageToWXReq* req = [[SendMessageToWXReq alloc] init];
    WXMediaMessage *message = [WXMediaMessage message];
    WXImageObject *imageObject = [[WXImageObject alloc] init];
    UIImage *image = [UIImage imageNamed:@"shareTest"];
    NSData *dataObj = UIImageJPEGRepresentation(image, 1.0);
    //设置图片数据
    imageObject.imageData = dataObj;
    //多媒体数据对象
    message.mediaObject = imageObject;
    //标记不是分享文本
    req.bText = NO;
    //设置message对象
    req.message = message;
    // 分享目标场景
    // 发送到聊天界面  WXSceneSession
    // 发送到朋友圈    WXSceneTimeline
    // 发送到微信收藏  WXSceneFavorite
    req.scene = WXSceneSession;
    //发起微信分享
    BOOL isInstalled = [WXApi sendReq:req];
    if (isInstalled == NO) {
        //调用微信分享失败 如：没有安装微信
    }
}

/** 分享链接*/
- (void)shareWeChatLink
{
    SendMessageToWXReq* req = [[SendMessageToWXReq alloc] init];
    WXMediaMessage *message = [WXMediaMessage message];
    WXWebpageObject *ext = [WXWebpageObject object];
    //需要分享的链接
    ext.webpageUrl = @"http://www.baidu.com";
    //多媒体数据对象
    message.mediaObject = ext;
    //分享的链接介绍文本
    message.description = @"分享链接的介绍";
    //分享的链接标题
    message.title = @"分享链接标题";
    //给分享链接设置小图标
    [message setThumbImage:[UIImage imageNamed:@"shareTest"]];
    //标记不是分享文本
    req.bText = NO;
    //设置message对象
    req.message = message;
    // 分享目标场景
    // 发送到聊天界面  WXSceneSession
    // 发送到朋友圈    WXSceneTimeline
    // 发送到微信收藏  WXSceneFavorite
    req.scene = WXSceneSession;
    //发起微信分享
    BOOL isInstalled = [WXApi sendReq:req];
    if (isInstalled == NO) {
        //调用微信分享失败 如：没有安装微信
    }
}

/** 分享视频*/
- (void)shareWeChatVideo
{
    SendMessageToWXReq* req = [[SendMessageToWXReq alloc] init];
    WXMediaMessage *message = [WXMediaMessage message];
    WXVideoObject *ext = [WXVideoObject object];
    //需要分享的视频链接
    ext.videoUrl = @"http://47.104.72.22/video/loveChangSha.mp4";
    //多媒体数据对象
    message.mediaObject = ext;
    //分享视频的链接介绍文本
    message.description = @"分享视频链接的介绍";
    //分享视频的链接标题
    message.title = @"分享视频链接标题";
    //给分享视频链接设置小图标
    [message setThumbImage:[UIImage imageNamed:@"shareTest"]];
    //标记不是分享文本
    req.bText = NO;
    //设置message对象
    req.message = message;
    // 分享目标场景
    // 发送到聊天界面  WXSceneSession
    // 发送到朋友圈    WXSceneTimeline
    // 发送到微信收藏  WXSceneFavorite
    req.scene = WXSceneSession;
    //发起微信分享
    BOOL isInstalled = [WXApi sendReq:req];
    if (isInstalled == NO) {
        //调用微信分享失败 如：没有安装微信
    }
}


@end
