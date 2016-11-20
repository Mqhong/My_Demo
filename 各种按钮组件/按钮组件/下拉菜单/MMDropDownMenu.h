//
//  MMDropDownMenu.h
//  各种按钮组件
//
//  Created by mm on 2016/11/20.
//  Copyright © 2016年 mm. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MMDropDownMenu;

@protocol MMDropDownMenuDelegate <NSObject>

-(void)dropdownMenuDidDismiss:(MMDropDownMenu *)menu;
-(void)dropdownMenuDidShow:(MMDropDownMenu *)menu;

@end

@interface MMDropDownMenu : UIView
@property (nonatomic,weak)id<MMDropDownMenuDelegate>delegate;


/**
 显示有多宽
 */
@property(nonatomic,assign) NSInteger DropMenuWith;

+(instancetype)menu;

/**
 显示

 @param from 以什么作为参照系
 */
-(void)ShowFrom:(UIView *)from;


/**
 销毁
 */
-(void)dismiss;


/**
 内容
 */
@property(nonatomic,strong) UIView *content;

/**
 内容控制器
 */
@property(nonatomic,strong) UIViewController *contentController;

@end
