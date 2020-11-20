//
//  JKCurve.h
//  CollectionViewMoreCurve
//
//  Created by 王冲 on 2018/10/29.
//  Copyright © 2018年 JK科技有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIView+JKUiviewExtension.h"
NS_ASSUME_NONNULL_BEGIN

@interface JKCurve : UIView

- (instancetype)initWithFrame:(CGRect)frame withType:(NSString *)type;

@property (assign, nonatomic)CGPoint controlPoint;

/**
 加载更多的背景色
 */
@property (strong, nonatomic)UIColor *brColor;

/**
 加载更多字体的背景色
 */
@property (strong, nonatomic)UIColor *textColor;

/**
 加载更多字体的大小
 */
@property (assign, nonatomic)CGFloat textSize;

@end

NS_ASSUME_NONNULL_END
