//
//  UIBarButtonItem+Category.m
//  各种按钮组件
//
//  Created by mm on 2016/11/20.
//  Copyright © 2016年 mm. All rights reserved.
//

#import "UIBarButtonItem+Category.h"
#import "UIView+Extension.h"
@implementation UIBarButtonItem (Category)

+(UIBarButtonItem *)itemWithTarget:(id)target action:(SEL)action image:(NSString *)image highImage:(NSString *)highImage{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    //设置图片
    [btn setBackgroundImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    [btn setBackgroundImage:[UIImage imageNamed:highImage] forState:UIControlStateHighlighted];
    // 设置尺寸
    btn.size = btn.currentBackgroundImage.size;
    return [[UIBarButtonItem alloc] initWithCustomView:btn];
}

@end
