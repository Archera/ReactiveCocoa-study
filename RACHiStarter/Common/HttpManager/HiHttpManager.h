//
//  HiHttpManager.h
//  HistarterProject
//
//  Created by 刘彬彬 on 15/1/16.
//  Copyright (c) 2015年 刘彬彬. All rights reserved.
//

typedef enum{
    POSTHIHTTP = 0,
    GETHIHTTP,
    PUTHIHTTP
    
}HttpClass;

#import <Foundation/Foundation.h>
#import "AFNetworking.h"
#import "HiHttpHead.h"
@interface HiHttpManager : AFHTTPRequestOperationManager
//一个网络连接任务对象
@property (nonatomic,assign) HttpClass hiClassHttp;
@property (nonatomic,strong)AFURLConnectionOperation * task;
@property (nonatomic,strong)AFHTTPRequestOperationManager *taskTo;
+ (HiHttpManager *)sharedInstance;
- (void)httpCancel;
/**
 *  发送post请求
 *
 *  @param type    请求唯一标示符
 *  @param params  请求发送的参数
 *  @param success 请求成功返回的json
 *  @param failure 错误返回信息
 */
- (void)sendPostHttp:(HttpRequestType)type
              params:(NSDictionary *)params
             success:(void (^)(NSDictionary * response))success
             failure:(void (^)  (NSError *error, NSInteger statusCode))failure;

/**
 *  发送包含图片,语音等文件的请求
 *
 *  @param type    请求唯一标示符
 *  @param params  请求发送的参数
 *  @param success 请求成功返回的json
 *  @param failure 错误返回信息
 */
- (void)senderImagePostHttp:(HttpRequestType)type
                     params:(NSDictionary *)params
                    success:(void (^)(NSDictionary * response))success
                    failure:(void (^)  (NSError *error, NSInteger statusCode))failure;
/**
 *  检查网络状况
 *
 *  @param status 返回网络标志位
 */
- (void)cheakNet:(void (^)(AFNetworkReachabilityStatus * status))status;
@end
