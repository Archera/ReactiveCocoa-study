//
//  HiLoginVC.m
//  RACHiStarter
//
//  Created by 刘彬彬 on 15/11/17.
//  Copyright © 2015年 刘彬彬. All rights reserved.
//

#import "HiLoginVC.h"
#import "HiLoginVCView.h"
#import "HiLoginViewModel.h"

#import "HiRegisterVC.h"
@interface HiLoginVC ()<UITextFieldDelegate>
{
    HiLoginVCView *loginObj;
    HiLoginViewModel *loginVMObj;
}
@end

@implementation HiLoginVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    if (!loginObj) {
        loginObj = [[HiLoginVCView alloc] initWithFrame:CGRectZero];
        WS(ws);
        loginObj.switchController_ = ^(NSInteger tag){
            HiRegisterVC *vc = [[HiRegisterVC alloc] init];
            [ws presentViewController:vc animated:YES completion:^{
                
            }];
            [ws.navigationController pushViewController:vc animated:YES];
        };
        [self.view addSubview:loginObj];
        
        [self bindLoginVModel];
        
        //按钮点击事件
        [[loginObj.loginBtn rac_signalForControlEvents:UIControlEventTouchUpInside]
         subscribeNext:^(id x) {
             NSLog(@"you touch me!");
             [loginVMObj login];
         }];
    }
}

/**
 *  关联viewModel
 */
- (void)bindLoginVModel
{
    if (!loginVMObj) {
        loginVMObj = [[HiLoginViewModel alloc] init];
    }
    
    RAC(loginVMObj,userName) = loginObj.accountTfd.rac_textSignal;
    RAC(loginVMObj,password) = loginObj.secureTfd.rac_textSignal;
    RAC(loginObj.loginBtn, enabled) = [loginVMObj buttonIsValid];
    
    [loginObj.accountTfd.rac_textSignal subscribeNext:^(id x) {
        DLog(@"%@",x);
    }];
    
    @weakify(self);
    //登录成功要处理的方法
    [loginVMObj.successObject subscribeNext:^(NSDictionary * x) {
        @strongify(self);
        DLog(@"%@",x);
    }];
    
    //fail
    [loginVMObj.failureObject subscribeNext:^(id x) {
        
    }];
    
    //error
    [loginVMObj.errorObject subscribeNext:^(id x) {
        
    }];
}
@end
