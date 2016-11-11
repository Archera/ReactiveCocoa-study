//
//  HiRegisterVC.m
//  RACHiStarter
//
//  Created by 刘彬彬 on 16/3/18.
//  Copyright © 2016年 刘彬彬. All rights reserved.
//

#import "HiRegisterVC.h"
#import "HiRegisterView.h"
#import "HiRegisterViewModel.h"

@interface HiRegisterVC ()
{
    HiRegisterView *registerViewObj;
    HiRegisterViewModel *registerViewModelObj;
}
@end

@implementation HiRegisterVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self creatInstanceObjects];
}

- (void)creatInstanceObjects
{
    if (!registerViewObj)
    {
        registerViewObj = [[HiRegisterView alloc] initWithFrame:CGRectZero];
        [self.view addSubview:registerViewObj];
    }
    
    [self bindHiRegisterViewModel];
    
    //获取验证码
    [[registerViewObj.verificationCodeBtn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(id x)
    {
        [registerViewModelObj requestVerificationCode];
    }];
    
    //注册
    [[registerViewObj.finishedBtn rac_signalForControlEvents:UIControlEventTouchUpInside]
     subscribeNext:^(id x)
    {
         [registerViewModelObj registered];
     }];
}

/**
 *  关联viewModel
 */
- (void)bindHiRegisterViewModel
{
    if (!registerViewModelObj) {
        registerViewModelObj = [[HiRegisterViewModel alloc] init];
    }
    
    RAC(registerViewModelObj, userName) = registerViewObj.account.rac_textSignal;
    RAC(registerViewModelObj, password) = registerViewObj.password.rac_textSignal;
    RAC(registerViewModelObj, verificationCode) = registerViewObj.verificationCode.rac_textSignal;
    
    //相当于finishedBtn.enabled = YES OR NO
    RAC(registerViewObj.finishedBtn, enabled) = [registerViewModelObj buttonIsValid];
    RAC(registerViewObj.verificationCodeBtn, enabled) = [registerViewModelObj verificationCodeIsValid];
    
    //判断验证码按钮能否被点击
    [[registerViewModelObj verificationCodeIsValid] subscribeNext:^(NSNumber *signal) {
        if ([signal boolValue]) {
            //按钮可点
            [registerViewObj.verificationCodeBtn setBackgroundColor:[HXUIColorNum colorFromHexRGB:@"1686da"]];
        }
        else
        {
            //按钮不可点
            [registerViewObj.verificationCodeBtn setBackgroundColor:[HXUIColorNum colorFromHexRGB:@"c5c5c5"]];
        }
    }];
    
    
    //判断注册按钮能否被点击
    [[registerViewModelObj buttonIsValid] subscribeNext:^(NSNumber *signal) {
        if ([signal boolValue]) {
            //按钮可点
        }
        else
        {
            //按钮不可点
        }
    }];
    
    [registerViewModelObj.requestWillStart subscribeNext:^(id x) {
        [registerViewObj daojishi];
    }];
    
    [registerViewObj.account.rac_textSignal subscribeNext:^(id x) {
        NSLog(@"%@",x);
    }];
}

@end
