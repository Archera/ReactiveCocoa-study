//
//  HiLoginData.h
//  HistarterProject
//
//  Created by 刘彬彬 on 15/1/30.
//  Copyright (c) 2015年 刘彬彬. All rights reserved.
//

#import <Foundation/Foundation.h>
@interface HiLoginData : NSObject
@property (nonatomic ,assign) BOOL userIsLogin;             //用户是否登录
@property (nonatomic, assign) BOOL userLoginSuccess;        //用户是否登录成功
@property (nonatomic,copy)    NSString *userAccount;        //登录成功缓存用户账号
@property (nonatomic,copy)    NSString *userSec;            //登录成功后缓存用户密码
@property (nonatomic, strong) NSString *loginToken;         //登录后后天返回的token
+ (HiLoginData *)sharedclassname;
@end
