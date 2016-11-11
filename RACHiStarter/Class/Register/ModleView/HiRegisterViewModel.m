//
//  HiRegisterViewModel.m
//  RACHiStarter
//
//  Created by 刘彬彬 on 16/3/18.
//  Copyright © 2016年 刘彬彬. All rights reserved.
//

#import "HiRegisterViewModel.h"

@interface HiRegisterViewModel ()
@property (nonatomic, strong) RACSignal *userNameSignal;
@property (nonatomic, strong) RACSignal *passwordSignal;
@property (nonatomic, strong) RACSignal *verificationCodeSignal;
@end

@implementation HiRegisterViewModel

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self initialize];
    }
    return self;
}

- (void)initialize
{
    _userNameSignal = RACObserve(self, userName);
    _passwordSignal = RACObserve(self, password);
    _verificationCodeSignal = RACObserve(self, verificationCode);
    _requestWillStart = [RACSubject subject];
}

- (id) buttonIsValid
{
    RACSignal *isValid = [RACSignal
                          combineLatest:@[_userNameSignal, _passwordSignal, _verificationCodeSignal]
                          reduce:^id(NSString *userName, NSString *password, NSString *verfication){
                              return @([LBCheckData checkText:userName condition:[NSNumber numberWithInt:3]] && [LBCheckData checkText:password condition:[NSNumber numberWithInt:3]] && [LBCheckData checkText:verfication condition:[NSNumber numberWithInt:3]]);
                          }];
    
    return isValid;
}

- (id) verificationCodeIsValid
{
    RACSignal *isValid = [RACSignal
                          combineLatest:@[_userNameSignal]
                          reduce:^id(NSString *userName){
                              return @([LBCheckData checkText:userName condition:[NSNumber numberWithInt:3]]);
                          }];
    
    return isValid;
}

- (void) requestVerificationCode
{
    ULog(@"获取验证码");
    [_requestWillStart sendNext:nil];
}

- (void) registered
{
    ULog(@"发送注册网络请求");
}
@end
