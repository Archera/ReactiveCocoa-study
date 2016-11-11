//
//  HiLoginViewModel.m
//  RACHiStarter
//
//  Created by 刘彬彬 on 15/11/17.
//  Copyright © 2015年 刘彬彬. All rights reserved.
//

#import "HiLoginViewModel.h"
@interface HiLoginViewModel ()
@property (nonatomic, strong) RACSignal *userNameSignal;
@property (nonatomic, strong) RACSignal *passwordSignal;
@property (nonatomic, strong) NSDictionary *requestData;
@end

@implementation HiLoginViewModel

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self initialize];
    }
    return self;
}

- (void)initialize {
    _userNameSignal = RACObserve(self, userName);
    _passwordSignal = RACObserve(self, password);
    _successObject = [RACSubject subject];
    _failureObject = [RACSubject subject];
}

//合并两个输入框信号，并返回按钮bool类型的值
- (id) buttonIsValid {
    
    RACSignal *isValid = [RACSignal
                          combineLatest:@[_userNameSignal, _passwordSignal]
                          reduce:^id(NSString *userName, NSString *password){
                              return @([LBCheckData checkText:userName condition:[NSNumber numberWithInt:3]] && [LBCheckData checkText:password condition:[NSNumber numberWithInt:3]]);
                          }];
    
    return isValid;
}

- (void)login
{
    
    //网络请求进行登录
    _requestData = @{@"loginName":_userName,@"password":_password};
    [self requestHttp:_requestData withType:UserLoginType];
    
    //业务逻辑失败和网络请求失败发送fail或者error信号并传参
}


- (void)returnDictionary:(NSDictionary *)dic
{
    //成功发送成功的信号
    [_successObject sendNext:dic];
}
@end
