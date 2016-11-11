//
//  UIKitFunction.m
//  SmartHome
//
//  Created by liubinbin on 14-8-15.
//  Copyright (c) 2014年 Het. All rights reserved.
//

#import "UIKitFunction.h"
#import<CoreText/CoreText.h>
#import <POP.h>
#define ToRad(deg) 		( (M_PI * (deg)) / 180.0 )
@implementation UIKitFunction
/**
 *  适配后控件在view中的位子和大小
 *
 *  @param rect_ 适配前的frame
 *
 *  @return 适配后的frame
 */
+ (CGRect)autoSizeScaleFrame:(CGRect)rect_
{
    CGFloat autoSizeScaleX;
    CGFloat autoSizeScaleY;
    if(SCREEN_HEIGHT > 480){
        autoSizeScaleX = SCREEN_WIDTH/375;
        autoSizeScaleY = SCREEN_HEIGHT/667;
    }else{
        autoSizeScaleX = 1.0;
        autoSizeScaleY = 1.0;
    }
    
    CGRect scaleRect;
    scaleRect.origin.x = rect_.origin.x*autoSizeScaleX;
    scaleRect.origin.y = rect_.origin.y *autoSizeScaleY;
    scaleRect.size.width = rect_.size.width * autoSizeScaleX;
    scaleRect.size.height = rect_.size.height * autoSizeScaleY;
    return scaleRect;
}

+ (UIButton*)buildBtn:(CGRect)frame_
            withTitle:(NSString*)btnTitle_
              withTag:(int)tag_
       withTitleColor:(UIColor*)color_
            withImage:(UIImage*)image_
{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.tag = tag_;
    btn.frame = frame_;
    [btn setAdjustsImageWhenHighlighted:YES];
    if (image_) {
        [btn setBackgroundImage:image_ forState:UIControlStateNormal];
    }
    if (btnTitle_) {
        [btn setTitle:btnTitle_ forState:UIControlStateNormal];
    }
    if (color_) {
        [btn setTitleColor:color_ forState:UIControlStateNormal];
    }
    return btn;
}

+ (UIButton*)buildLabelBtn:(CGRect)frame_
                 withTitle:(NSString*)btnTitle_
                   withTag:(int)tag_
            withTitleColor:(UIColor*)color_
                 withImage:(UIImage*)image_
{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.tag = tag_;
    btn.frame = frame_;
    btn.backgroundColor = [UIColor clearColor];
    [btn setAdjustsImageWhenHighlighted:YES];
    if (image_) {
        [btn setBackgroundImage:image_ forState:UIControlStateNormal];
    }
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, frame_.size.width, frame_.size.height)];
    label.tag = kLabelTag;
    label.font = [UIFont systemFontOfSize:16];
    label.textAlignment = NSTextAlignmentCenter;
    if(btnTitle_)
    {
        label.text = btnTitle_;
    }
    if(color_)
    {
        label.textColor = color_;
    }
    [btn addSubview:label];
    
    return btn;
}

+ (UILabel*)buildLabel:(CGRect)rect_
             withTitle:(NSString*)str_
         withTextColor:(UIColor*)color_
          withTextFont:(CGFloat)fontFloat
{
    UILabel *label = [[UILabel alloc] initWithFrame:rect_];
    label.backgroundColor = [UIColor clearColor];
    label.font = SYSTEM_Normal_font(fontFloat);
    label.textAlignment = NSTextAlignmentCenter;
    label.numberOfLines = 0;
    label.textColor = color_;
    if (![str_ isKindOfClass:[NSNull class]]) {
        label.text = str_;
        [label sizeToFit];
    }
    return label;
}

+ (UILabel*)buildLabelNosizeToFit:(CGRect)rect_
             withTitle:(NSString*)str_
         withTextColor:(UIColor*)color_
          withTextFont:(CGFloat)fontFloat
{
    UILabel *label = [[UILabel alloc] initWithFrame:rect_];
    label.backgroundColor = [UIColor clearColor];
    label.font = SYSTEM_Normal_font(fontFloat);
    label.textAlignment = NSTextAlignmentCenter;
    label.textColor = color_;
    if (![str_ isKindOfClass:[NSNull class]]) {
        label.text = str_;
    }
    return label;
}

+ (UILabel*)buildLabel:(CGRect)rect_
             withTitle:(NSString*)str_
         withTextColor:(UIColor*)color_
          withTextFont:(CGFloat)fontFloat
        withLineNumber:(int)linNum
{
    UILabel *label = [[UILabel alloc] initWithFrame:rect_];
    label.backgroundColor = [UIColor clearColor];
    label.font = [UIFont systemFontOfSize:fontFloat];
    label.numberOfLines = linNum;
    label.textAlignment = NSTextAlignmentCenter;
    label.textColor = color_;
    if (![str_ isKindOfClass:[NSNull class]]) {
        label.text = str_;
        [label sizeToFit];
    }
    return label;
}

+ (UIImageView*)buildImageView:(CGRect)rect_ withImageName:(NSString*)image_
{
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:rect_];
    if (image_) {
        [imageView setImage:[UIImage imageNamed:image_]];
    }
    return imageView;
}

+ (UIImageView*)buildImageView:(CGRect)rect_ withImage:(UIImage*)image_
{
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:rect_];
    if (image_) {
        [imageView setImage:image_];
    }
    return imageView;
}

+ (UITextField *)buildTextField:(CGRect)rect_
                withPlaceholder:(NSString*)str_
                       isSecure:(BOOL)sure_
                       withFont:(CGFloat)num_
{
    UITextField *textField = [[UITextField alloc] initWithFrame:rect_];
    [textField setBackgroundColor:[UIColor clearColor]];
    [textField setBorderStyle:UITextBorderStyleNone]; //外框类型
    textField.font = [UIFont systemFontOfSize:num_];
    textField.placeholder = str_; //默认显示的字
    
    textField.secureTextEntry = sure_; //密码
    
    textField.autocorrectionType = UITextAutocorrectionTypeNo;
    textField.autocapitalizationType = UITextAutocapitalizationTypeNone;
    textField.returnKeyType = UIReturnKeyDone;
    textField.keyboardType = UIKeyboardTypeDefault;
    textField.clearButtonMode = UITextFieldViewModeWhileEditing; //编辑时会出现个修改X
    
    return textField;
}

+ (UIScrollView*)scrollViewFrame:(CGRect)rect_ withSize:(CGSize)frame_ withPage:(BOOL)isPage
{
    UIScrollView *tempSc = [[UIScrollView alloc] init];
    
    tempSc.frame = rect_;
    
    tempSc.contentSize = frame_;  //scrollview的滚动范围
    
    tempSc.showsVerticalScrollIndicator = NO;
    
    tempSc.showsHorizontalScrollIndicator = NO;
    
    //myScrollView.clipsToBounds = YES;
    
    //    tempSc.delegate = self;
    
    tempSc.scrollEnabled = YES;
    
    tempSc.pagingEnabled = isPage; //使用翻页属性
    
//    tempSc.bounces = NO;
    return tempSc;
}

/**
 *  自定义label的行间距和字间距
 *
 *  @param targer            目标string
 *  @param line_             目标行间距
 *  @param characterSpacing_ 目标字间距
 *
 *  @return 返回处理后的string
 */
+ (NSString*)stringFreeFrameTargerString:(NSString*)targer
                     withTargerLineSpace:(long)line_
                withTargerCharacterSpace:(CGFloat)characterSpacing_
{
    NSMutableAttributedString* atrString = [[NSMutableAttributedString alloc] initWithString:targer];
    
    //设置文本行间距
    CTParagraphStyleSetting lineSpaceStyle;
    lineSpaceStyle.spec = kCTParagraphStyleSpecifierLineSpacingAdjustment;
    lineSpaceStyle.valueSize = sizeof(line_);
    lineSpaceStyle.value =&line_;
    
    //设置字间距
    long number = characterSpacing_;
    CFNumberRef num = CFNumberCreate(kCFAllocatorDefault,kCFNumberSInt8Type,&number);
    [atrString addAttribute:(id)kCTKernAttributeName value:(__bridge id)num range:NSMakeRange(0,[atrString length])];
    
    //创建设置数组
    CTParagraphStyleSetting settings[ ] ={lineSpaceStyle};
    CTParagraphStyleRef style = CTParagraphStyleCreate(settings ,1);
    
    //给文本添加设置
    [atrString addAttribute:(id)kCTParagraphStyleAttributeName value:(__bridge id)style range:NSMakeRange(0 , [atrString length])];
    return atrString.string;
}

//宽定值，求高
+ (CGSize)lineSizeLblWithStr:(NSString*)str withFont:(UIFont*)font_ withWight:(CGFloat)hei
{
    if ([str isKindOfClass:[NSNull class]]) {
        return CGSizeMake(0, 0);
    }
//    CGSize lineSize = [str sizeWithFont:[UIFont systemFontOfSize:font_]
//                      constrainedToSize:CGSizeMake(hei, 2000)
//                          lineBreakMode:NSLineBreakByWordWrapping];
//    //    NSLog(@" lineSize.height = %f", lineSize.height);
//    return lineSize;
    
    NSMutableDictionary *attrs = [NSMutableDictionary dictionary];
    attrs[NSFontAttributeName] = font_;
    CGSize maxSize = CGSizeMake(hei, MAXFLOAT);
    return [str boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:attrs context:nil].size;
}

+ (CGSize)lineSizeLblWithStr:(NSString*)str withFont:(UIFont*)font_
{
    return [self lineSizeLblWithStr:str withFont:font_ withWight:MAXFLOAT];
//    CGSize size;
//    if (str!=nil) {
//        NSAttributedString* atrString = [[NSAttributedString alloc] initWithString:str];
//        
//        NSRange range = NSMakeRange(0, atrString.length);
//        
//        NSDictionary* dic = [atrString attributesAtIndex:0 effectiveRange:&range];
//        
//        size = [str boundingRectWithSize:CGSizeMake(237, 200)  options:NSStringDrawingUsesLineFragmentOrigin attributes:dic context:nil].size;
//    }
//    else
//    {
//        size = CGSizeMake(0, 0);
//    }
//    
//    return  size;
    
//    if (![str isKindOfClass:[NSNull class]]&&![str isEqualToString:@"<null>"]) {
//        CGSize lineSize = [str sizeWithFont:[UIFont systemFontOfSize:font_]
//                          constrainedToSize:CGSizeMake(612, 2000)
//                              lineBreakMode:NSLineBreakByWordWrapping];
//        
//        //    NSLog(@" lineSize.height = %f", lineSize.height);
//        return lineSize;
//    }
//    else
//    {
//        CGSize lineSize = CGSizeMake(0, 0);
//        return lineSize;
//    }
}

+ (CGSize)labelAutoCalculateRectWith:(NSString*)text FontSize:(CGFloat)fontSize MaxSize:(CGSize)maxSize

{
    
    NSMutableParagraphStyle* paragraphStyle = [[NSMutableParagraphStyle alloc]init];
    
    paragraphStyle.lineBreakMode=NSLineBreakByWordWrapping;
    
    NSDictionary* attributes =@{NSFontAttributeName:[UIFont systemFontOfSize:fontSize],NSParagraphStyleAttributeName:paragraphStyle.copy};
    
    //NSStringDrawingTruncatesLastVisibleLine如果文本内容超出指定的矩形限制，文本将被截去并在最后一个字符后加上省略号。 如果指定了NSStringDrawingUsesLineFragmentOrigin选项，则该选项被忽略 NSStringDrawingUsesFontLeading计算行高时使用行间距。（译者注：字体大小+行间距=行高）
    CGSize labelSize = [text boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading|NSStringDrawingTruncatesLastVisibleLine attributes:attributes context:nil].size;
    
    //    [paragraphStyle release];
    
    labelSize.height=ceil(labelSize.height);
    
    labelSize.width=ceil(labelSize.width);
    
    return labelSize;
    
}

//遮罩阴影view
+ (UIView*)addAlphView:(CGRect)rect_ withAlpha:(CGFloat)alpha_
{
    UIView *view_  = [[UIView alloc] initWithFrame:rect_];
//    [view_ setBackgroundColor:[UIConfig colorFromHexRGB:@"ffffff"]];
    [view_ setBackgroundColor:[UIColor blackColor]];
    view_.alpha = alpha_;
    return view_;
}

+ (void) startRotationAnimation:(CALayer*)layer_
{
    CABasicAnimation *rotationAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    rotationAnimation.fromValue = [NSNumber numberWithFloat:ToRad(0)];
    rotationAnimation.toValue = [NSNumber numberWithFloat:ToRad(7200)];
    rotationAnimation.duration = 1.0f;
    rotationAnimation.removedOnCompletion = NO;
    rotationAnimation.fillMode = kCAFillModeForwards;
    rotationAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    [layer_ addAnimation:rotationAnimation forKey:@"rotationAnimation"];
}

//static int angle = 90;
+ (void)startCGAnimation:(UIView*)view_ withAngle:(float)angle_
{
//    CFTimeInterval pushedTime = 0;
//    if (finished) {
//        angle = 90;
//        pushedTime = [view_.layer beginTime];
//    }
//    
//    CGAffineTransform endAngle = CGAffineTransformMakeRotation(ToRad(angle));
//    
//    [UIView animateWithDuration:0.3
//                          delay:pushedTime
//                        options:UIViewAnimationOptionCurveLinear
//                     animations:^{
//                         view_.transform = endAngle;
//                     }
//                     completion:^(BOOL finished){
//                         angle += 90;
//                         [self startCGAnimation:view_ withBool:NO];}];
    
    //Rotation
    CABasicAnimation* rotationAnimation;
    rotationAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    rotationAnimation.toValue = [NSNumber numberWithFloat:angle_];
    rotationAnimation.duration = 0.2f;
    rotationAnimation.removedOnCompletion = NO;
    rotationAnimation.fillMode = kCAFillModeForwards;
//    rotationAnimation.autoreverses = YES;//动画完成后自动重新开始
//    rotationAnimation.repeatCount = CGFLOAT_MAX; //动画重复次数,默认为0
//    rotationAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionDefault];
    [view_.layer addAnimation:rotationAnimation forKey:@"rotationAnimation"];
}

+ (void)resumeAnimation:(CALayer*)layer_
{
    [layer_ removeAnimationForKey:@"rotationAnimation"];
    [UIView animateWithDuration:1.0f animations:^(void){
        layer_.transform = CATransform3DMakeRotation(ToRad(0), 0.0, 0.0, 1.0);
    }];
    
//    CFTimeInterval pushedTime = [layer_ timeOffset];
//    layer_.speed = 1;
//    //    layer_.timeOffset = 0.0;
//    //    layer_.beginTime = 0.0;
//    CFTimeInterval restart = [layer_ convertTime:CACurrentMediaTime() fromLayer:nil] - pushedTime;
//    layer_.beginTime = restart;
}

+ (void)rotationDeg:(CALayer*)layer_ withDeg:(CGFloat)deg
{
    CABasicAnimation* rotationAnimation;
    rotationAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    rotationAnimation.toValue = [NSNumber numberWithFloat:ToRad(deg)];
    rotationAnimation.duration = 0.5f;
    rotationAnimation.removedOnCompletion = NO;
    rotationAnimation.fillMode = kCAFillModeForwards;
    //rotationAnimation.autoreverses = YES;//动画完成后自动重新开始
    rotationAnimation.repeatCount = 0; //动画重复次数,默认为0
    //    rotationAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionDefault];
    [layer_ addAnimation:rotationAnimation forKey:@"rotationAnimation"];
    
//    [UIView animateWithDuration:1.0f animations:^(void){
//        layer_.transform = CATransform3DMakeRotation(ToRad(deg), 0.0, 0.0, 1.0);
//    }];
}

//弹出动画
+ (void)showPopWithPopStartRect:(UIButton *)aButton showPosition:(CGRect)aRect
{
    // Bounciness 反弹 Tension 拉力  Speed 速度
    //Friction 摩擦力－如果开启，动画会不断重复，幅度逐渐削弱，直到停止
    //Mass 质量－细微的影响动画的回弹力度以及速度
    POPSpringAnimation *positionAnimation = [POPSpringAnimation animationWithPropertyNamed:kPOPViewFrame];
    positionAnimation.fromValue = [NSValue valueWithCGRect:aButton.frame];
    positionAnimation.toValue = [NSValue valueWithCGRect:aRect];
    positionAnimation.springBounciness = 15.0f;
    positionAnimation.springSpeed = 10.0f;
    [aButton pop_addAnimation:positionAnimation forKey:@"frameAnimation"];
}

+ (NSString*)phpTimeToObj:(NSString*)strTime
{
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:[strTime doubleValue]];
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"YYYY-MM-dd"];
    NSString *dateStr = [dateFormat stringFromDate:date];
    DLog(@"The date is: %@", dateStr);
    return dateStr;
}

+ (NSDate*)NSStringToNSDate:(NSString*)stringTime
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    NSTimeZone *timeZone = [NSTimeZone localTimeZone];
    
    [formatter setTimeZone:timeZone];
    [formatter setDateFormat : @"M/d/yyyy h:m a"];
    
    NSDate *dateTime = [formatter dateFromString:stringTime];
    return dateTime;
}
+ (NSString*)NSDateToNSString:(NSDate*)DateTime
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    NSTimeZone *timeZone = [NSTimeZone localTimeZone];
    
    [formatter setTimeZone:timeZone];
    [formatter setDateFormat : @"yyyy-MM-dd"];
    return [formatter stringFromDate:DateTime];
}

+ (NSString*)dateToCompleteString:(NSDate*)DateTime
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    NSTimeZone *timeZone = [NSTimeZone localTimeZone];
    
    [formatter setTimeZone:timeZone];
    [formatter setDateFormat : @"yyyy-MM-dd HH:mm"];
    return [formatter stringFromDate:DateTime];
}

+ (NSString *)intervalSinceNow: (NSString *) theDate
{
    
    NSDateFormatter *date=[[NSDateFormatter alloc] init];
    [date setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSDate *d=[date dateFromString:theDate];
    
    NSTimeInterval late=[d timeIntervalSince1970]*1;
    
    
    NSDate* dat = [NSDate dateWithTimeIntervalSinceNow:0];
    NSTimeInterval now=[dat timeIntervalSince1970]*1;
    NSString *timeString=@"";
    
    NSTimeInterval cha=now-late;
    
    if (cha/3600<1) {
        timeString = [NSString stringWithFormat:@"%f", cha/60];
        timeString = [timeString substringToIndex:timeString.length-7];
        timeString=[NSString stringWithFormat:@"%@分钟前", timeString];
        
    }
    if (cha/3600>1&&cha/86400<1) {
        timeString = [NSString stringWithFormat:@"%f", cha/3600];
        timeString = [timeString substringToIndex:timeString.length-7];
        timeString=[NSString stringWithFormat:@"%@小时前", timeString];
    }
    if (cha/86400>1)
    {
        timeString = [NSString stringWithFormat:@"%f", cha/86400];
        timeString = [timeString substringToIndex:timeString.length-7];
        timeString=[NSString stringWithFormat:@"%@天前", timeString];
        
    }
    return timeString;
}

+ (BOOL)theObjectListIsNull:(id)objc_
{
    if (objc_ !=nil) {
        return YES;
    }
    else
    {
        return NO;
    }
}

+ (id)isObjectDic:(NSDictionary*)objDic contentTheKey:(NSString*)objKey_
{
    if (objDic) {
        if ([[objDic allKeys] containsObject:objKey_])
        {
            id objc_ = [objDic objectForKey:objKey_];
            if (objc_!=nil) {
                return objc_;
            }
            else
            {
                return nil;
            }
        }
        else
        {
            return nil;
        }

    }
    else
    {
        return nil;
    }
}

NSUInteger DeviceSystemMajorVersion()
{
    static NSUInteger _deviceSystemMajorVersion = -1;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _deviceSystemMajorVersion = [[[[[UIDevice currentDevice] systemVersion] componentsSeparatedByString:@"."] objectAtIndex:0] intValue];
    });
    if (_deviceSystemMajorVersion>=7) {
        return 20;
    }
    else
    {
        return 0;
    }
    return _deviceSystemMajorVersion;
}
@end
