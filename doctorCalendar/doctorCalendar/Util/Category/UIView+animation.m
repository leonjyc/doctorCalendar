//
//  UIView+animation.m
//  XT
//
//  Created by 邹圳巡 on 15/8/11.
//  Copyright (c) 2015年 CSHL. All rights reserved.
//

#import "UIView+animation.h"

@implementation UIView (animation)

- (void)startFadeTransition
{
    CATransition *animation = [CATransition animation];
    [animation setType:kCATransitionFade];
    [animation setDuration:0.15f];
    [animation setRemovedOnCompletion:YES];
    [self.layer addAnimation:animation forKey:@"fade"];
}

@end
