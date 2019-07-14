//
//  Util.m
//  XT
//
//  Created by 邹圳巡 on 15/8/11.
//  Copyright (c) 2015年 CSHL. All rights reserved.
//

#import "XTUtil.h"
#import <sys/utsname.h>

@implementation XTUtil
//获取设备uuid
+(NSString *)getCurrentDeviceUUID{
    NSString *uuid=[NSString stringWithFormat:@"%@",[[[UIDevice currentDevice] identifierForVendor] UUIDString]];
    return uuid;
}
+ (BOOL)isIphoneFour{
    if ([[UIScreen mainScreen] bounds].size.height == 320 ||[[UIScreen mainScreen] bounds].size.height == 480) {
        return YES;
    }
    return NO;
}

+ (float)systemVersion{
    return [[[UIDevice currentDevice] systemVersion] floatValue];
}

+ (CGFloat)getScreenScale{
    struct utsname systemInfo;
    uname(&systemInfo);
    NSString *name = [NSString stringWithCString:systemInfo.machine encoding:NSUTF8StringEncoding];
    if ([name isEqualToString:@"iPhone7,1"]||[name isEqualToString:@"iPhone7,2"]||[name isEqualToString:@"iPhone8,1"]||[name isEqualToString:@"iPhone8,2"]) {
        return 3.f;
    }else{  
        return [UIScreen mainScreen].scale;
    }
}


//遍历文件夹获得文件夹大小，返回多少M

- (float )folderSizeAtPath:(NSString*) folderPath{
    
    NSFileManager* manager = [NSFileManager defaultManager];
    
    if (![manager fileExistsAtPath:folderPath]) return 0;
    
    NSEnumerator *childFilesEnumerator = [[manager subpathsAtPath:folderPath] objectEnumerator];
    
    NSString* fileName;
    
    long long folderSize = 0;
    
    while ((fileName = [childFilesEnumerator nextObject]) != nil){
        
        NSString* fileAbsolutePath = [folderPath stringByAppendingPathComponent:fileName];
        
        folderSize += [self fileSizeAtPath:fileAbsolutePath];
        
    }

return folderSize/(1024.0*1024.0);

}
- (long long) fileSizeAtPath:(NSString*) filePath{
    
    NSFileManager* manager = [NSFileManager defaultManager];
    
    if ([manager fileExistsAtPath:filePath]){
        
        return [[manager attributesOfItemAtPath:filePath error:nil] fileSize];
        
    }
    
    return 0;
    
}

+ (NSString *)appVersion{
    return  [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"];
}

+ (CGFloat)statusBarHeight{
    return [[UIApplication sharedApplication] statusBarFrame].size.height;
}

+ (float)screenWidth{
    return [[UIScreen mainScreen] bounds].size.width;
}

+ (float)screenHeight{
    return [[UIScreen mainScreen] bounds].size.height;
}

+ (NSString *)getDocumentRootPath{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    return paths[0];
}

+ (UIImage *)imageWithColor:(UIColor *)color{
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

+ (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size{
    CGRect rect = CGRectMake(0.0f, 0.0f, size.width, size.height);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

+ (UIColor *)colorWithHexString:(NSString *)hexString alpha:(float)alpha
{
    if (hexString == nil || (id)hexString == [NSNull null]) {
        return nil;
    }
    UIColor *col;
    if (![hexString hasPrefix:@"#"]) {
        hexString = [NSString stringWithFormat:@"#%@", hexString];
    }
    hexString = [hexString stringByReplacingOccurrencesOfString:@"#"
                                                     withString:@"0x"];
    uint hexValue;
    if ([[NSScanner scannerWithString:hexString] scanHexInt:&hexValue]) {
        col = [UIColor
               colorWithRed:((float)((hexValue & 0xFF0000) >> 16))/255.0
               green:((float)((hexValue & 0xFF00) >> 8))/255.0
               blue:((float)(hexValue & 0xFF))/255.0
               alpha:alpha];
    } else {
        col = [UIColor clearColor];
    }
    return col;
}

+ (UIWindow *)window{
    return [(AppDelegate *)[UIApplication sharedApplication].delegate window];
}

+ (NSString *)getTimeStamp
{
    NSDate *datenow = [NSDate date];
    NSString *timeS = [NSString stringWithFormat:@"%ld",(long)[datenow timeIntervalSince1970]];
    return timeS;
}

+ (id)findSubViewOfClass:(id)cls inView:(UIView *)view{
    
    for (UIView *sub in view.subviews) {
        if ([sub isKindOfClass:cls]) {
            return (id)sub;
        } else if (sub.subviews) {
            UITextField *tf = [self findSubViewOfClass:cls inView:sub];
            if (tf) {
                return tf;
            }
        }
    }
    return nil;
}

+ (BOOL)isValue:(id)value equalTo:(id)target
{
    return value == target || (value != [NSNull null] && [value isEqual:target]);
}


+ (BOOL)isStringValid:(NSString *)target
{
    if(![target isKindOfClass:[NSString class]]){
        return NO;
    }
    NSString *trimmed = [target stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    return trimmed.length>0;
}


+ (BOOL)isDigitCharacterString:(NSString *)string{
    NSCharacterSet* notDigits = [[NSCharacterSet decimalDigitCharacterSet] invertedSet];
    return ([string rangeOfCharacterFromSet:notDigits].location == NSNotFound);
}

+(BOOL)isUserNameValid:(NSString *)inputUserName{
    NSString *regular = @"^[\u4E00-\u9FA50-9a-zA-Z-_]{1,27}$";
    NSError *__autoreleasing error = NULL;
    NSRegularExpression *re = [NSRegularExpression regularExpressionWithPattern:regular options:NSRegularExpressionCaseInsensitive | NSRegularExpressionAnchorsMatchLines error:&error];
    BOOL result = [re matchesInString:inputUserName options:0 range:NSMakeRange(0, inputUserName.length)].count == 1;
    return result;
}

+(BOOL)isRealNameValid:(NSString *)inputRealName{
    NSString *regular = @"^[\u4E00-\u9FA50-9a-zA-Z]{2,10}$";
    NSError *__autoreleasing error = NULL;
    NSRegularExpression *re = [NSRegularExpression regularExpressionWithPattern:regular options:NSRegularExpressionCaseInsensitive | NSRegularExpressionAnchorsMatchLines error:&error];
    BOOL result = [re matchesInString:inputRealName options:0 range:NSMakeRange(0, inputRealName.length)].count == 1;
    return result;
}


+(BOOL)isEmailValid:(NSString *)inputEmail{
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [XTUtil isStringValid:inputEmail] && [emailTest evaluateWithObject:inputEmail];
}


+(BOOL)isPhoneNumberValid:(NSString *)inputPhone{
    NSString *phoneRegex = @"1[0-9]{10}";
    NSPredicate *phoneText = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", phoneRegex];
    return [XTUtil isStringValid:inputPhone] && [phoneText evaluateWithObject:inputPhone];
}

+ (NSString *)sexStrFromIdentityCard:(NSString *)numberStr
{
    if (numberStr.length == 0) {
        return nil;
    }
    int sexInt=[[numberStr substringWithRange:NSMakeRange(16,1)] intValue];
    if(sexInt%2!=0){
        return @"男";
    }else{
        return @"女";
    }
}

+ (NSString *)birthdayStrFromIdentityCard:(NSString *)numberStr{
    NSMutableString *result = [NSMutableString stringWithCapacity:0];
    NSString *year = nil;
    NSString *month = nil;
    BOOL isAllNumber = YES;
    NSString *day = nil;
    if([numberStr length]<14)
        return result;
    NSString *fontNumer = [numberStr substringWithRange:NSMakeRange(0, 13)];
    const char *str = [fontNumer UTF8String];
    const char *p = str;
    while (*p!='\0') {
        if(!(*p>='0'&&*p<='9'))
            isAllNumber = NO;
        p++;
    }
    if(!isAllNumber)
        return result;
    year = [numberStr substringWithRange:NSMakeRange(6, 4)];
    month = [numberStr substringWithRange:NSMakeRange(10, 2)];
    day = [numberStr substringWithRange:NSMakeRange(12,2)];
    [result appendString:year];
    [result appendString:@"-"];
    [result appendString:month];
    [result appendString:@"-"];
    [result appendString:day];
    return result;
}


+ (BOOL)validateIdentityCard:(NSString *)identityCard
{
    BOOL flag;
    if (identityCard.length <= 0) {
        flag = NO;
        return flag;
    }
    NSString *regex2 = @"^(\\d{17})(\\d|[xX])$";
    NSPredicate *identityCardPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex2];
    return [identityCardPredicate evaluateWithObject:identityCard];
}


+ (NSString *)convertTimeFormat:(NSString *)t1 toTimeFormat:(NSString *)t2 andTime:(NSString *)time{
    NSDateFormatter* formater = [[NSDateFormatter alloc] init];
    [formater setDateFormat:t1];
    NSDate* date = [formater dateFromString:time];
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:t2];
    NSString *strDate = [dateFormatter stringFromDate:date];
    
    return strDate;
}

+ (NSDate *)convertDateFromStr:(NSString *)dateStr andFormatter:(NSString *)formatter{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:formatter];
    NSDate *date = [dateFormatter dateFromString:dateStr];
    return date;
}

+ (int)compareOneDay:(NSDate *)oneDay withAnotherDay:(NSDate *)anotherDay
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"dd-MM-yyyy-HHmmss"];
    NSString *oneDayStr = [dateFormatter stringFromDate:oneDay];
    NSString *anotherDayStr = [dateFormatter stringFromDate:anotherDay];
    NSDate *dateA = [dateFormatter dateFromString:oneDayStr];
    NSDate *dateB = [dateFormatter dateFromString:anotherDayStr];
    NSComparisonResult result = [dateA compare:dateB];
    NSLog(@"date1 : %@, date2 : %@", oneDay, anotherDay);
    if (result == NSOrderedDescending) {
        //NSLog(@"Date1  is in the future");
        return 1;
    }
    else if (result == NSOrderedAscending){
        //NSLog(@"Date1 is in the past");
        return -1;
    }
    //NSLog(@"Both dates are the same");
    return 0;
    
}

//计算两个日期之间的天数
+ (NSInteger) calcDaysFromBegin:(NSDate *)beginDate end:(NSDate *)endDate
{
    //创建日期格式化对象
    NSDateFormatter *dateFormatter=[[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm"];
    
    //取两个日期对象的时间间隔：
    //这里的NSTimeInterval 并不是对象，是基本型，其实是double类型，是由c定义的:typedef double NSTimeInterval;
    NSTimeInterval time=[endDate timeIntervalSinceDate:beginDate];
    
    int days=((int)time)/(3600*24);
    //int hours=((int)time)%(3600*24)/3600;
    //NSString *dateContent=[[NSString alloc] initWithFormat:@"%i天%i小时",days,hours];
    return days;
}
+ (NSString *)getCurrentTime:(NSString *)format{
    NSDateFormatter *formatter=[[NSDateFormatter alloc]init];
    [formatter setDateFormat:format];
    NSString *dateTime=[formatter stringFromDate:[NSDate date]];
    return dateTime;
}

+ (NSString *)convertTimeFromDate:(NSDate *)date andFormat:(NSString *)format{
    NSDateFormatter *formatter=[[NSDateFormatter alloc]init];
    [formatter setDateFormat:format];
    NSString *dateTime=[formatter stringFromDate:date];
    return dateTime;
}

+ (void)addBottomLine:(UIView *)view{
    CALayer *bottomBorder = [CALayer layer];
    float height=view.frame.size.height-1.0f;
    float width=view.frame.size.width;
    bottomBorder.frame = CGRectMake(0.0f, height, width, 1.0f);
    bottomBorder.backgroundColor = [XTUtil colorWithHexString:@"#EEEEEE" alpha:1].CGColor;
    [view.layer addSublayer:bottomBorder];
}

@end
