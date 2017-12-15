//
//  UITableViewCell+LSExtension.m
//  LawSiri
//
//  Created by Criss on 2017/11/25.
//  Copyright © 2017年 iCourt. All rights reserved.
//

#import "UITableViewCell+LSExtension.h"

@implementation UITableViewCell (LSExtension)

- (CGFloat)calHeightWithModel:(id)model {
    SEL selector = @selector(setModel:);
    if ([self respondsToSelector:selector]) {
        IMP imp = [self methodForSelector:selector];
        void (*func)(id, SEL, id) = (void *)imp;
        func(self, selector, model);
        for (UILabel *subLabel in self.contentView.subviews) {
            if ([subLabel isKindOfClass:[UILabel class]]) {
                [subLabel setNeedsUpdateConstraints];
                [subLabel updateConstraints];
                [subLabel updateConstraintsIfNeeded];
                [subLabel setNeedsLayout];
                [subLabel layoutIfNeeded];
                subLabel.preferredMaxLayoutWidth = subLabel.bounds.size.width;
            }
        }
        
        CGSize cellSize= [self.contentView systemLayoutSizeFittingSize:UILayoutFittingCompressedSize];
        // +1 是因为分割线
        CGFloat bottom = cellSize.height;
        return bottom;
    }
    return 0;
}

@end
