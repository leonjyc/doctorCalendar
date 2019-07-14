//
//  NSString+function.m
//  XT
//
//  Created by 邹圳巡 on 15/8/11.
//  Copyright (c) 2015年 CSHL. All rights reserved.
//

#import "NSString+function.h"
#import <CommonCrypto/CommonDigest.h>


@implementation NSString (function)

- (CGSize)sizeFitAllOSWithFont:(UIFont*)font constrainedToSize:(CGSize)size
{
    return [self boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:font} context:nil].size;
}

- (NSString *)timeStringTranslation
{
    long time = [self doubleValue];
    long now = [[NSDate date] timeIntervalSince1970];
    long interval = now - time;
    
    if (interval < 10 *60) {
        return @"刚刚";
    }else if (interval < 60 *60){
        return [NSString stringWithFormat:@"%ld分钟前",interval/60];
    }else if (interval < 24*60 *60){
        return [NSString stringWithFormat:@"%ld小时前",interval/(60*60)];
    }else if (interval < 24*2*60 *60){
        return @"昨天";
    }else{
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateFormat:@"yyyy-MM-dd hh:mm:ss"];
        NSDate *date = [NSDate dateWithTimeIntervalSince1970:[self doubleValue]];
        return [dateFormatter stringFromDate:date];
    }
}

+ (NSString *) md5:(NSString *)str
{
    const char *cStr = [str UTF8String];
    unsigned char result[16];
    CC_MD5( cStr, (uint32_t)strlen(cStr),result );
    NSMutableString *hash =[NSMutableString string];
    for (int i = 0; i < 16; i++)
        [hash appendFormat:@"%02X", result[i]];
    return [hash lowercaseString];
}

- (NSString *)urlEncode {
    return [self urlEncodeUsingEncoding:NSUTF8StringEncoding];
}

- (NSString *)urlEncodeUsingEncoding:(NSStringEncoding)encoding {
    return (__bridge_transfer NSString *)CFURLCreateStringByAddingPercentEscapes(NULL,
                                                                                 (__bridge CFStringRef)self,
                                                                                 NULL,
                                                                                 (CFStringRef)@"!*'\"();:@&=+$,/?%#[]%. ",
                                                                                 CFStringConvertNSStringEncodingToEncoding(encoding));
}

- (NSString *)urlDecode {
    return [self urlDecodeUsingEncoding:NSUTF8StringEncoding];
}

- (NSString *)urlDecodeUsingEncoding:(NSStringEncoding)encoding {
    return (__bridge_transfer NSString *)CFURLCreateStringByReplacingPercentEscapesUsingEncoding(NULL,
                                                                                                 (__bridge CFStringRef)self,
                                                                                                 CFSTR(""),
                                                                                                 CFStringConvertNSStringEncodingToEncoding(encoding));
}

@end
