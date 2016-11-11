//
//  HiRegisterViewModel.h
//  RACHiStarter
//
//  Created by 刘彬彬 on 16/3/18.
//  Copyright © 2016年 刘彬彬. All rights reserved.
//

#import "HiRequestManager.h"

@interface HiRegisterViewModel : HiRequestManager
@property (nonatomic, copy) NSString *userName;
@property (nonatomic, copy) NSString *password;
@property (nonatomic, copy) NSString *verificationCode;

@property (nonatomic, strong) RACSubject *requestWillStart;

/**
 *  合并tfd数据信号
 *
 *  @return 返回YES OR NO
 */
- (id) buttonIsValid;

- (id) verificationCodeIsValid;

/**
 *  开始注册
 */
- (void) registered;

/**
 *  获取验证码
 */
- (void) requestVerificationCode;
@end
