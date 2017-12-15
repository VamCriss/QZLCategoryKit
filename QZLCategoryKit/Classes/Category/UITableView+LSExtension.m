//
//  UITableView+LSExtension.m
//  LawSiri
//
//  Created by Criss on 2017/11/16.
//  Copyright © 2017年 iCourt. All rights reserved.
//

#import "UITableView+LSExtension.h"
#import <objc/runtime.h>

static NSString *needStopAnimationKey;

@implementation UITableView (LSExtension)

- (BOOL)needStopAnimation {
    return  [objc_getAssociatedObject(self, &needStopAnimationKey) boolValue];
}

- (void)setNeedStopAnimation:(BOOL)needStopAnimation {
    objc_setAssociatedObject(self, &needStopAnimationKey, @(needStopAnimation), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

@end
