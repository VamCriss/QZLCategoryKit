//
//  NSString+LSExtension.h
//  LawSiri
//
//  Created by Criss on 2017/11/20.
//  Copyright © 2017年 iCourt. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (LSExtension)

- (NSString *)ls_createStringByAddingPercentEscapes;

// 删除所有的相关字符
- (NSString *)ls_deleteStrs:(NSArray<NSString *> *)strings;

@end
