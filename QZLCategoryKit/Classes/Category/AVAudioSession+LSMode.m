//
//  AVAudioSession+LSMode.m
//  LawSiri
//
//  Created by 兰洋 on 2017/12/12.
//  Copyright © 2017年 iCourt. All rights reserved.
//

#import "AVAudioSession+LSMode.h"
#import <objc/runtime.h>

@implementation AVAudioSession (LSMode)

+ (void)load{
    
    [self ls_swizzMethodWithOriginalMethod:@selector(setActive:error:) exchangeMethod:@selector(ls_setActive:error:)];
    [self ls_swizzMethodWithOriginalMethod:@selector(setActive:withOptions:error:) exchangeMethod:@selector(ls_setActive:withOptions:error:)];

    [self ls_swizzMethodWithOriginalMethod:@selector(setCategory:mode:routeSharingPolicy:options:error:) exchangeMethod:@selector(ls_setCategory:mode:routeSharingPolicy:options:error:)];
    [self ls_swizzMethodWithOriginalMethod:@selector(setCategory:withOptions:error:) exchangeMethod:@selector(ls_setCategory:withOptions:error:)];
    [self ls_swizzMethodWithOriginalMethod:@selector(setCategory:error:) exchangeMethod:@selector(ls_setCategory:error:)];\
    
    if (@available(iOS 11.0, *)) {
        [self ls_swizzMethodWithOriginalMethod:@selector(setCategory:mode:options:error:) exchangeMethod:@selector(ls_setCategory:mode:options:error:)];
    }
}

- (BOOL)ls_setActive:(BOOL)active error:(NSError * _Nullable __autoreleasing *)outError {
    NSLog(@"--------------------%zd", active);
    return [self ls_setActive:active error:outError];
}

- (BOOL)ls_setActive:(BOOL)active withOptions:(AVAudioSessionSetActiveOptions)options error:(NSError * _Nullable __autoreleasing *)outError {
    NSLog(@"--------------------%zd", active);
    // 百度语音说完之后会将active设置为NO(有延迟), 如果想在语音完成之后播放音乐, 需将active设置为YES，否则会有语音冲突. 如果需要语音唤醒,则必须为YES
    active = YES;
//    if ([LSMusicPlayer shared].currentStatu == LSMusicPlayerCurrentStatusPlay || [LSMusicPlayer shared].currentStatu == LSMusicPlayerCurrentStatusReadyPlay) {
//    }
    NSLog(@"--------------------%zd", active);
    return [self ls_setActive:active withOptions:options error:outError];
}

- (BOOL)ls_setCategory:(NSString *)category error:(NSError * _Nullable __autoreleasing *)outError
{
    NSLog(@"--------------------%@", category);
    return [self ls_setCategory:category error:outError];
}

- (BOOL)ls_setCategory:(NSString *)category mode:(NSString *)mode options:(AVAudioSessionCategoryOptions)options error:(NSError * _Nullable __autoreleasing *)outError
{
    NSLog(@"--------------------%@", category);
    return [self ls_setCategory:category mode:mode options:options error:outError];
}

- (BOOL)ls_setCategory:(NSString *)category mode:(NSString *)mode routeSharingPolicy:(AVAudioSessionRouteSharingPolicy)policy options:(AVAudioSessionCategoryOptions)options error:(NSError * _Nullable __autoreleasing *)outError
{
    NSLog(@"--------------------%@", category);
    return [self ls_setCategory:category mode:mode routeSharingPolicy:policy options:options error:outError];
}

- (BOOL)ls_setCategory:(NSString *)category withOptions:(AVAudioSessionCategoryOptions)options error:(NSError * _Nullable __autoreleasing *)outError
{
    NSLog(@"--------------------%@", category);
    return [self ls_setCategory:category withOptions:options error:outError];
}


+ (void)ls_swizzMethodWithOriginalMethod:(SEL)originalSel exchangeMethod:(SEL)exchangeSel {
    
    /** 获取原始方法 */
    Method originalM = class_getInstanceMethod([self class], originalSel);
    
    Method exchangeM = class_getInstanceMethod([self class], exchangeSel);
    
    BOOL didAddMethod =
    class_addMethod([self class],
                    originalSel,
                    method_getImplementation(exchangeM),
                    method_getTypeEncoding(exchangeM));
    
    if (didAddMethod) {
        class_replaceMethod([self class],
                            exchangeSel,
                            method_getImplementation(originalM),
                            method_getTypeEncoding(originalM));
    } else {
        method_exchangeImplementations(originalM, exchangeM);
    }
}
@end
