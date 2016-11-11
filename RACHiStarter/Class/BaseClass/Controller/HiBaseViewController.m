//
//  HiBaseViewController.m
//  RACHiStarter
//
//  Created by 刘彬彬 on 16/2/2.
//  Copyright © 2016年 刘彬彬. All rights reserved.
//

#import "HiBaseViewController.h"

@implementation HiBaseViewController

- (void)buildTopBarView
{
    if (!self.topBarView) {
        self.topBarView = [[HiTopBarView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 64) topTitle:@"" leftImage:[UIImage imageNamed:@"HiSquareImage08"] rightImage:[UIImage imageNamed:@"HiSettingImage_02"]];
        [self.topBarView setBackgroundColor:[HXUIColorNum colorFromHexRGB:@"4180fe"]];
        [self.view addSubview:self.topBarView];
        
        //按钮点击事件
        [[self.topBarView.leftBtn rac_signalForControlEvents:UIControlEventTouchUpInside]
         subscribeNext:^(id x) {
             [self leftEvent];
         }];
        
        [[self.topBarView.rightBtn rac_signalForControlEvents:UIControlEventTouchUpInside]
         subscribeNext:^(id x) {
             [self rightEvent];
         }];
    }
}

- (void)leftEvent
{}

- (void)rightEvent
{}
@end
