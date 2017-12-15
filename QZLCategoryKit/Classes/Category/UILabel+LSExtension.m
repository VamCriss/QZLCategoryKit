//
//  UILabel+LSExtension.m
//  LawSiri
//
//  Created by Criss on 2017/11/18.
//  Copyright © 2017年 iCourt. All rights reserved.
//

#import "UILabel+LSExtension.h"

@implementation UILabel (LSExtension)

+ (instancetype)ls_labelWithTitle:(NSString *)title font:(UIFont *)font textColor:(UIColor *)textColor {
    UILabel *label = [[self alloc] init];
    label.textColor = textColor;
    label.text = title;
    label.font = font;
    return label;
}

@end
