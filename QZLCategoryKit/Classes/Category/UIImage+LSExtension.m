//
//  UIImage+LSExtension.m
//  LawSiri
//
//  Created by Criss on 2017/12/5.
//  Copyright © 2017年 iCourt. All rights reserved.
//

#import "UIImage+LSExtension.h"

@implementation UIImage (LSExtension)

- (UIImage *)ls_stretchableImage {
    // 设置左边端盖宽度
    NSInteger leftCapWidth = self.size.width * 0.5;
    // 设置上边端盖高度
    NSInteger topCapHeight = self.size.height * 0.5;
    
    UIImage *newImage = [self stretchableImageWithLeftCapWidth:leftCapWidth topCapHeight:topCapHeight];
    
    return newImage;
}

@end
