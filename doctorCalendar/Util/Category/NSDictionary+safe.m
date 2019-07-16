//
//  NSDictionary+safe.m
//  XT
//
//  Created by 邹圳巡 on 15/8/31.
//  Copyright (c) 2015年 CSHL. All rights reserved.
//

#import "NSDictionary+safe.h"

@implementation NSMutableDictionary (safe)

- (void)setSafeObject:(id)anObject forKey:(id<NSCopying>)aKey
{
    if (anObject && aKey) {
        [self setObject:anObject forKey:aKey];
    }
}

@end
