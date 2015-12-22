
//
//  ZCControl.m
//  Device
//
//  Created by ZhangCheng on 14-4-19.
//  Copyright (c) 2014年 zhangcheng. All rights reserved.
//

#import "ZCControl.h"

@implementation ZCControl
+(UILabel*)createLabelWithFrame:(CGRect)frame Font:(int)font Text:(NSString*)text
{
    UILabel*label=[[UILabel alloc]initWithFrame:frame];
    //限制行数
    label.numberOfLines=0;
    //对齐方式
    label.textAlignment=NSTextAlignmentLeft;
    label.backgroundColor=[UIColor clearColor];
    label.font=[UIFont systemFontOfSize:font];
    //单词折行
    label.lineBreakMode=NSLineBreakByWordWrapping;
    //默认字体颜色是黑色
    label.textColor=[UIColor blackColor];
    //自适应（行数~字体大小按照设置大小进行设置）
    label.adjustsFontSizeToFitWidth=YES;
    label.text = text;
    return [label autorelease];
}
+(UIButton*)createButtonWithFrame:(CGRect)frame ImageName:(NSString*)imageName Target:(id)target Action:(SEL)action Title:(NSString*)title
{
    UIButton*button=[UIButton buttonWithType:UIButtonTypeCustom];
    button.frame=frame;
    [button setTitle:title forState:UIControlStateNormal];
    //设置背景图片，可以使文字与图片共存
    [button setBackgroundImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    //图片与文字如果需要同时存在，就需要图片足够小 详见人人项目按钮设置
    // [button setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return button;
}
+(UIImageView*)createImageViewWithFrame:(CGRect)frame ImageName:(NSString*)imageName
{
    UIImageView*imageView=[[UIImageView alloc]initWithFrame:frame];
    imageView.image=[UIImage imageNamed:imageName];
    imageView.userInteractionEnabled=YES;
    return [imageView autorelease];
}
+(UIView*)viewWithFrame:(CGRect)frame
{
    UIView*view=[[UIView alloc]initWithFrame:frame];
    
    return [view autorelease];
}
+(UITextField*)createTextFieldWithFrame:(CGRect)frame placeholder:(NSString*)placeholder passWord:(BOOL)YESorNO leftImageView:(UIImageView*)imageView rightImageView:(UIImageView*)rightImageView Font:(float)font
{
    UITextField*textField=[[UITextField alloc]initWithFrame:frame];
    //灰色提示框
    textField.placeholder=placeholder;
    //文字对齐方式
    textField.textAlignment=NSTextAlignmentLeft;
    textField.secureTextEntry=YESorNO;
    //边框
    //textField.borderStyle=UITextBorderStyleLine;
    //键盘类型
    textField.keyboardType=UIKeyboardTypeEmailAddress;
    //关闭首字母大写
    textField.autocapitalizationType=NO;
    //清除按钮
    textField.clearButtonMode=YES;
    //左图片
    textField.leftView = imageView;
    textField.leftViewMode = UITextFieldViewModeAlways;
    //右图片
    textField.rightView = rightImageView;
    //编辑状态下一直存在
    textField.rightViewMode = UITextFieldViewModeWhileEditing;
    //自定义键盘
    //textField.inputView
    //字体
    textField.font= [UIFont systemFontOfSize:font];
    //字体颜色
    textField.textColor=[UIColor blackColor];
    return [textField autorelease];
    
}
#pragma  mark 适配器方法
+(UITextField*)createTextFieldWithFrame:(CGRect)frame placeholder:(NSString*)placeholder passWord:(BOOL)YESorNO leftImageView:(UIImageView*)imageView rightImageView:(UIImageView*)rightImageView Font:(float)font backgRoundImageName:(NSString*)imageName
{
    UITextField*text= [self createTextFieldWithFrame:frame placeholder:placeholder passWord:YESorNO leftImageView:imageView rightImageView:rightImageView Font:font];
    text.background=[UIImage imageNamed:imageName];
    return  text;
    
}
+(UIScrollView*)makeScrollViewWithFrame:(CGRect)frame andSize:(CGSize)size
{
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:frame];
    
    scrollView.pagingEnabled = YES;
    scrollView.contentSize = size;
    scrollView.showsHorizontalScrollIndicator = NO;
    scrollView.showsVerticalScrollIndicator = NO;
//    scrollView.scrollsToTop = NO;
    return [scrollView autorelease];
}
+(UIPageControl*)makePageControlWithFram:(CGRect)frame
{
    UIPageControl *pageControl = [[UIPageControl alloc] initWithFrame:frame];
    pageControl.numberOfPages = 2;
    pageControl.currentPage = 0;
    return [pageControl autorelease];
}
+(UISlider*)makeSliderWithFrame:(CGRect)rect AndImage:(UIImage*)image
{
    UISlider *slider = [[UISlider alloc]initWithFrame:rect];
    slider.minimumValue = 0;
    slider.maximumValue = 1;
    [slider setThumbImage:[UIImage imageNamed:@"qiu"] forState:UIControlStateNormal];
    slider.maximumTrackTintColor = [UIColor grayColor];
    slider.minimumTrackTintColor = [UIColor yellowColor];
    slider.continuous = YES;
    slider.enabled = YES;
    return [slider autorelease];
}
+(NSString *)stringFromDateWithHourAndMinute:(NSDate *)date
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    //zzz表示时区，zzz可以删除，这样返回的日期字符将不包含时区信息。
    [dateFormatter setDateFormat:@"HH:mm"];
    NSString *destDateString = [dateFormatter stringFromDate:date];
    [dateFormatter release];
    return destDateString;
}

#pragma -mark 判断导航的高度
+(float)isIOS7{
    float height;
    if (IOS7) {
        height=64;
    }else{
        height=44;
    }
    return height;
}
//+(NSString *)platformString{
//    // Gets a string with the device model
//    size_t size;
//    sysctlbyname("hw.machine", NULL, &size, NULL, 0);
//    char *machine = malloc(size);
//    sysctlbyname("hw.machine", machine, &size, NULL, 0);
//    NSString *platform = [NSString stringWithCString:machine encoding:NSUTF8StringEncoding];
//    free(machine);
//    NSDictionary* d = nil;
//    if (d == nil)
//    {
//        d = @{
//              @"iPhone1,1": @"iPhone 2G",
//              @"iPhone1,2": @"iPhone 3G",
//              @"iPhone2,1": @"iPhone 3GS",
//              @"iPhone3,1": @"iPhone 4",
//              @"iPhone3,2": @"iPhone 4",
//              @"iPhone3,3": @"iPhone 4 (CDMA)",
//              @"iPhone4,1": @"iPhone 4S",
//              @"iPhone5,1": @"iPhone 5",
//              @"iPhone5,2": @"iPhone 5 (GSM+CDMA)",
//              
//              @"iPod1,1": @"iPod Touch (1 Gen)",
//              @"iPod2,1": @"iPod Touch (2 Gen)",
//              @"iPod3,1": @"iPod Touch (3 Gen)",
//              @"iPod4,1": @"iPod Touch (4 Gen)",
//              @"iPod5,1": @"iPod Touch (5 Gen)",
//              
//              @"iPad1,1": @"iPad",
//              @"iPad1,2": @"iPad 3G",
//              @"iPad2,1": @"iPad 2 (WiFi)",
//              @"iPad2,2": @"iPad 2",
//              @"iPad2,3": @"iPad 2 (CDMA)",
//              @"iPad2,4": @"iPad 2",
//              @"iPad2,5": @"iPad Mini (WiFi)",
//              @"iPad2,6": @"iPad Mini",
//              @"iPad2,7": @"iPad Mini (GSM+CDMA)",
//              @"iPad3,1": @"iPad 3 (WiFi)",
//              @"iPad3,2": @"iPad 3 (GSM+CDMA)",
//              @"iPad3,3": @"iPad 3",
//              @"iPad3,4": @"iPad 4 (WiFi)",
//              @"iPad3,5": @"iPad 4",
//              @"iPad3,6": @"iPad 4 (GSM+CDMA)",
//              
//              @"i386": @"Simulator",
//              @"x86_64": @"Simulator"
//              };
//    }
//    NSString* ret = [d objectForKey: platform];
//    
//    if (ret == nil)
//    {
//        return platform;
//    }
//    return ret;
//}

#pragma mark 内涵图需要的方法
+ (NSString *)stringDateWithTimeInterval:(NSString *)timeInterval
{
    NSTimeInterval seconds = [timeInterval integerValue];
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:seconds];
    NSDateFormatter *format = [[[NSDateFormatter alloc] init] autorelease];
    format.dateFormat = @"yyyy-MM-dd HH:mm:ss";
    return [format stringFromDate:date];
}

+ (CGFloat)textHeightWithString:(NSString *)text width:(CGFloat)width fontSize:(NSInteger)fontSize
{
    NSDictionary *dict = @{NSFontAttributeName: [UIFont systemFontOfSize:fontSize]};
    // 根据第一个参数的文本内容，使用280*float最大值的大小，使用系统14号字，返回一个真实的frame size : (280*xxx)!!
    CGRect frame = [text boundingRectWithSize:CGSizeMake(width, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin attributes:dict context:nil];
    return frame.size.height + 5;
}

// 返回一个整数字符串加1后的新字符串
+ (NSString *)addOneByIntegerString:(NSString *)integerString
{
    NSInteger integer = [integerString integerValue];
    return [NSString stringWithFormat:@"%d",integer+1];
}

// 16进制颜色转换 格式：@"#ffffff"
+(UIColor *)colorWirhNSString:(NSString *)colorString
{
    //字符串分割
    NSArray*array;
    if ([colorString hasPrefix:@"#"]) {
        array=[colorString componentsSeparatedByString:@"#"];
    }else{
        array = @[@"",colorString];
    }
    NSString * redStr = [array[1] substringWithRange:NSMakeRange(0, 2)];
    NSString * greenStr = [array[1] substringWithRange:NSMakeRange(2, 2)];
    NSString * blueStr = [array[1] substringWithRange:NSMakeRange(4, 2)];
    UIColor*textColor=[UIColor colorWithRed:strtol( [redStr UTF8String], NULL, 16)/255.0  green:strtol( [greenStr UTF8String], NULL, 16)/255.0  blue:strtol( [blueStr UTF8String], NULL, 16)/255.0  alpha:1];
    return textColor;
}

//注意colorString的格式：@"0xF3,0x2D,0x63"
+(UIColor *)convertHexadecimalColor:(NSString *)colorString
{
    //分割字体颜色字符串
    NSArray * colorArr = [colorString componentsSeparatedByString:@","];
    //字体颜色
    UIColor * color = [UIColor colorWithRed:strtol([colorArr[0] UTF8String], NULL, 16)/255.0 green:strtol([colorArr[1] UTF8String], NULL, 16)/255.0 blue:strtol([colorArr[2] UTF8String], NULL, 16)/255.0 alpha:1];
    
    return color;
}
#pragma mark  创建Segment
+(UISegmentedControl *)segmentedControlWithItems:(NSArray *)items frame:(CGRect)frame Target:(id)target Action:(SEL)action  selectedSegmentIndex:(NSInteger)index
{
    UISegmentedControl * segmented = [[UISegmentedControl alloc]initWithItems:items];
    segmented.frame = frame;
    segmented.selectedSegmentIndex = index;
    [segmented addTarget:target action:action forControlEvents:UIControlEventValueChanged];
    return segmented;
    //设置初始选择哪个分段
    //    segment1.selectedSegmentIndex = 3;
    //取得指定index上的图片
    //    [segmented imageForSegmentAtIndex:seg2.selectedSegmentIndex];
    //取得指定index 上的标题
    //    NSLog(@"%@",[segmented titleForSegmentAtIndex:seg2.selectedSegmentIndex]);
}
#pragma mark 字符串高度判断
+(CGSize)stringWithString:(NSString *)str withFont:(NSInteger)num withMaxSize:(CGSize)maxSize
{
    CGSize size;
    if ([[[UIDevice currentDevice]systemVersion ]floatValue]>=7.0) {
        //iOS7新方法
        size=[str boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:num]} context:nil].size;
    }else{
        size=[str sizeWithFont:[UIFont systemFontOfSize:num] constrainedToSize:maxSize];
    }
    return size;
}

#pragma mark 邮箱验证 MODIFIED BY HELENSONG*/
+(BOOL)isValidateEmail:(NSString *)email
{
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:email];
}

#pragma mark 手机号码验证 MODIFIED BY HELENSONG*/
//+(BOOL) isValidateMobile:(NSString *)mobile
//{
//    //手机号以13， 15，18开头，八个 \d 数字字符
//    NSString *phoneRegex = @"^((13[0-9])|(15[^4,\\D])|(18[0,0-9])|(14[0,0-9])|(17[0,0-9]))\\d{8}$";
//    NSPredicate *phoneTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",phoneRegex];
//    //    NSLog(@"phoneTest is %@",phoneTest);
//    return [phoneTest evaluateWithObject:mobile];
//}
/*
 *手机号码验证
 */
+ (BOOL)isValidateMobile:(NSString *)mobile
{
    //手机号以13， 15，18开头，八个 \d 数字字符
    //    NSString *phoneRegex = @"/^0?(13[0-9]|15[012356789]|17[678]|18[0-9]|14[57])[0-9]{8}$/";
    NSString *phoneRegex = @"^1[0-9]{10}$";
    NSPredicate *phoneTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",phoneRegex];
    return [phoneTest evaluateWithObject:mobile];
}
#pragma mark 中文判断
+ (BOOL)isValidateChinese:(NSString *)chinese
{
    NSString * phoneRegex = @"^[\u4E00-\u9FA5]*$";  //中文正则表达式
    NSPredicate * chinesePred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", phoneRegex];
    return [chinesePred evaluateWithObject:chinese];
//    NSString *phoneRegex = @"[\u4e00-\u9fa5]";
//    NSPredicate *phoneTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",phoneRegex];
//    return [phoneTest evaluateWithObject:chinese];
//    char 值处于区间[19968, 19968+20902]里的，都是汉字
    
//    for (int i = 0; i <ch.length; i++) {
//        char ch = (char)[chinese substringWithRange:NSMakeRange(i,1)];
//        NSLog(@"%@",char);
//        if (ch >= 19968 && ch <= 19968+20902) {
//            
//        }
//    }
    
    //方法二
//    NSString *str = @"i'm a 苹果。...";
//    for(int i=0; i< [str length];i++){
//        int a = [str characterAtIndex:i];
//        if( a > 0x4e00 && a < 0x9fff)
//            NSLog(@"汉字");
//    }
}

#pragma mark 检测字符串是否为空或全为空格
/*****
 * 检测字符串是否为空或全为空格
 */
+(BOOL)textIsAllSpace:(NSString *)text
{
    BOOL isSpace = YES;
    if(text == nil || [text isEqualToString:@""]){
        isSpace = YES;
    }else if([text isEqual:[NSNull null]]){
        isSpace = YES;
    }else{
        //是否全为空格
        for (int i=0; i<[text length]; i++) {
            char tmp = [text characterAtIndex:i];
            char example = ' ';
            if(tmp != example){
                isSpace = NO;
                break;
            }
        }
    }
    return isSpace;
}

#pragma mark 图片超过屏幕宽度则图片按比例缩放（宽为屏幕宽度），不超过屏幕宽度时，按原图大小 width图片最大宽度
+(CGSize)imageWithScalingImageSize:(CGSize)size withWidth:(CGFloat)width
{
    CGSize maskSize;
    if (size.width > width) {
        maskSize.width = width;
        maskSize.height = size.height/(size.width/width);
    }else{
        maskSize.width = size.width;
        maskSize.height = size.height;
    }
    return maskSize;
}
// 补充 用下面的代码 把图片穿进去,你的 imageView 的 size 传进去 自动等比例缩放.
+ (UIImage *)thumbnailWithImageWithoutScale:(UIImage *)image size:(CGSize)asize

{
    
    UIImage *newimage;
    
    if (nil == image) {
        
        newimage = nil;
        
    }
    
    else{
        
        CGSize oldsize = image.size;
        
        CGRect rect;
        
        if (asize.width/asize.height > oldsize.width/oldsize.height) {
            
            rect.size.width = asize.height*oldsize.width/oldsize.height;
            
            rect.size.height = asize.height;
            
            rect.origin.x = (asize.width - rect.size.width)/2;
            
            rect.origin.y = 0;
            
        }
        
        else{
            
            rect.size.width = asize.width;
            
            rect.size.height = asize.width*oldsize.height/oldsize.width;
            
            rect.origin.x = 0;
            
            rect.origin.y = (asize.height - rect.size.height)/2;
            
        }
        
        UIGraphicsBeginImageContext(asize);
        
        CGContextRef context = UIGraphicsGetCurrentContext();
        
        CGContextSetFillColorWithColor(context, [[UIColor clearColor] CGColor]);
        
        UIRectFill(CGRectMake(0, 0, asize.width, asize.height));
        
        [image drawInRect:rect];
        
        newimage = UIGraphicsGetImageFromCurrentImageContext();
        
        UIGraphicsEndImageContext();
        
    }
    
    return newimage;
    
}
@end
