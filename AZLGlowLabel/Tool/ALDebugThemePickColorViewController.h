//
//  ALDebugThemePickColorViewController.h
//  tasker
//
//  Created by lizihong on 2020/11/13.
//  Copyright © 2020 BT. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void (^ALColorPickBlock)(UIColor *color);

@interface ALDebugThemePickColorViewController : UIViewController

@property (nonatomic, strong) UIColor *color;
@property (nonatomic, strong) NSString *colorName;

@property (nonatomic, copy) ALColorPickBlock completeBlock;

@end

NS_ASSUME_NONNULL_END
