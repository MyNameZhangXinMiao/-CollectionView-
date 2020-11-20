//
//  JKCollectionViewCurve.h
//  CollectionViewMoreCurve
//
//  Created by 王冲 on 2018/10/29.
//  Copyright © 2018年 JK科技有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JKCurve.h"
NS_ASSUME_NONNULL_BEGIN

@interface JKCollectionViewCurve : UIView


/**
   数据源
 */
@property(nonatomic,strong) NSMutableArray *dataArray;

@property(nonatomic,strong) void(^JKScrollviewBlock)(void);

@end

NS_ASSUME_NONNULL_END
