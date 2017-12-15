//
//  NSString+LSExtension.m
//  LawSiri
//
//  Created by Criss on 2017/11/20.
//  Copyright © 2017年 iCourt. All rights reserved.
//

#import "NSString+LSExtension.h"

@implementation NSString (LSExtension)

- (NSString *)ls_createStringByAddingPercentEscapes {
    return [self stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    
}

- (NSString *)ls_deleteStrs:(NSArray<NSString *> *)strings {
    NSString *tempStr = self;
    for (NSString *str in strings) {
        tempStr = [tempStr stringByReplacingOccurrencesOfString:str withString:@""];
    }
    return tempStr;
}

@end
