//
//  HiTopBarView.m
//  RACHiStarter
//
//  Created by 刘彬彬 on 16/2/2.
//  Copyright © 2016年 刘彬彬. All rights reserved.
//

#import "HiTopBarView.h"

@implementation HiTopBarView
- (instancetype)initWithFrame:(CGRect)frame topTitle:(NSString *)topText leftImage:(UIImage *)leftImage rightImage:(UIImage *)rightImage
{
    if (self = [super init]) {
        [self buildTopLabel:topText];
        [self buildLeftImage:leftImage];
        [self buildRightImage:rightImage];
    }
    return self;
}

- (void)hideRightBtn:(BOOL)isHide
{
    self.rightBtn.hidden = isHide;
}

- (void)hideLeftBtn:(BOOL)isHide
{
    self.leftBtn.hidden = isHide;
}

- (void)setRightImage:(UIImage*)image_
{
    [self.rightBtn setBackgroundImage:image_ forState:UIControlStateNormal];
}

- (void)setLeftImage:(UIImage*)image_
{
    [self.leftBtn setBackgroundImage:image_ forState:UIControlStateNormal];
}

- (void)buildTopLabel:(NSString *)topText
{
    if (!self.titleLbl) {
        self.titleLbl = [[UILabel alloc] init];
        self.titleLbl.text = topText;
        self.titleLbl.frame = CGRectMake(SCREEN_WIDTH-200, 20, 200, self.frame.size.height-20);
        self.titleLbl.numberOfLines = 1;
        self.titleLbl.font = SYSTEM_Normal_font(17.0f);
        self.titleLbl.textAlignment = NSTextAlignmentCenter;
        [self.titleLbl sizeToFit];
        [self addSubview:self.titleLbl];
    }
}

- (void)buildLeftImage:(UIImage *)leftImage
{
    if (!self.leftBtn) {
        self.leftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        self.leftBtn.frame = CGRectMake(0, 20, leftImage.size.width*GlobalautolayoutW, self.frame.size.height-20);
        [self addSubview:self.leftBtn];
    }
}

- (void)buildRightImage:(UIImage *)rightImage
{
    if (!self.rightBtn) {
        self.rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        self.rightBtn.frame = CGRectMake(SCREEN_WIDTH - rightImage.size.width*GlobalautolayoutW, 20, rightImage.size.width*GlobalautolayoutW, self.frame.size.height-20);
        [self addSubview:self.rightBtn];
    }
}
@end
