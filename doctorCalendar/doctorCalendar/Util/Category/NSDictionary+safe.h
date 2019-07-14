//
//  NSDictionary+safe.h
//  XT
//
//  Created by 邹圳巡 on 15/8/31.
//  Copyright (c) 2015年 CSHL. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSMutableDictionary (safe)

- (void)setSafeObject:(id)anObject forKey:(id<NSCopying>)aKey;

@end
