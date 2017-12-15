//
//  UITableViewCell+LSExtension.h
//  LawSiri
//
//  Created by Criss on 2017/11/25.
//  Copyright © 2017年 iCourt. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITableViewCell (LSExtension)

/* 预计算行高 */
- (CGFloat)calHeightWithModel:(id)model;

@end
