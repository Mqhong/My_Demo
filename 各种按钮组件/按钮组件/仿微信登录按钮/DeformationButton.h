//
//  DeformationButton.h
//  各种按钮组件
//
//  Created by mm on 2016/10/27.
//  Copyright © 2016年 mm. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MMMaterialDesignSpinner.h"
@interface DeformationButton : UIControl

/**
 赋值后，重写了setter方法，在其中判断是否还继续运转
 */
@property(nonatomic, assign) BOOL isLoading;

/**
 正在执行动画的背景色
 */
@property(nonatomic, retain) UIColor *contentColor;

/**
 正在执行动画的时候的那条线的颜色
 */
@property(nonatomic, retain) UIColor *progressColor;

@property(nonatomic, retain) UIButton *forDisplayButton;

@end
