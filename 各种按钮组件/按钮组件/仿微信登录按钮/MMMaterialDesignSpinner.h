//
//  MMMaterialDesignSpinner.h
//  各种按钮组件
//
//  Created by mm on 2016/10/27.
//  Copyright © 2016年 mm. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MMMaterialDesignSpinner : UIView

//设置旋转的线的宽度
@property(nonatomic) CGFloat lineWidth;

//判断是否隐藏，当视图已经隐藏后
@property(nonatomic) BOOL hidesWhenStopped;

//指定用于空间动画的定时功能。默认为kCAMediaTimingFunctionEaseInEaseOut
@property(nonatomic,strong) CAMediaTimingFunction *timingFunction;

//获取当前是否动画在执行
@property(nonatomic, readonly) BOOL isAnimating;


/**
 用于显示的启动和停止动画的调用

 @param animate true开始动画，false停止动画
 @note 此方法仅基于animate参数的值调用startAnimating或stopAnimating方法
 */
-(void)setAnimationg:(BOOL)animate;


/**
 开始旋转
 */
-(void)startAnimating;

/**
 结束旋转
 */
-(void)stopAnimating;


@end
