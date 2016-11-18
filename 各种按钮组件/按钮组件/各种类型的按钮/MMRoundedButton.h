//
//  MMRoundedButton.h
//  各种按钮组件
//
//  Created by mm on 2016/11/18.
//  Copyright © 2016年 mm. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MMRoundedButton : UIButton



/**
 创建按钮的方法

 @param style 可以进来看看你需要那种缺角按钮
 @return 返回你需要的按钮
 */
+(instancetype)CreateButtonWithStyle:(int)style Frame:(CGRect)rect Corner:(CGSize)corner;


@end
