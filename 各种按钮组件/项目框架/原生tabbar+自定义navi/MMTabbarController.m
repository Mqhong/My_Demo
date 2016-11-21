//
//  MMTabbarController.m
//  各种按钮组件
//
//  Created by mm on 2016/11/21.
//  Copyright © 2016年 mm. All rights reserved.
//

#import "vc1.h"
#import "vc2.h"
#import "vc3.h"
#import "vc4.h"
#import "MMTabbarController.h"

#import "MMNavigationController.h"

@interface MMTabbarController ()

@end

@implementation MMTabbarController

- (void)viewDidLoad {
    [super viewDidLoad];
    vc1 *v1 = [[vc1 alloc] init];
    [self addChildVc:v1 title:@"我的工作" image:@"button_normal_YFHorizontalPagingViewController" selectedImage:@"button_selected_YFHorizontalPagingViewController"];
    
    vc2 *v2 = [[vc2 alloc] init];
    [self addChildVc:v2 title:@"地图" image:@"button_normal_YFHorizontalPagingViewController" selectedImage:@"button_selected_YFHorizontalPagingViewController"];
    
    vc3 *v3 = [[vc3 alloc] init];
    [self addChildVc:v3 title:@"通讯录" image:@"button_normal_YFHorizontalPagingViewController" selectedImage:@"button_selected_YFHorizontalPagingViewController"];
    
    vc4 *v4 = [[vc4 alloc] init];
    [self addChildVc:v4 title:@"资料库" image:@"button_normal_YFHorizontalPagingViewController" selectedImage:@"button_selected_YFHorizontalPagingViewController"];
    
}

-(void)addChildVc:(UIViewController *)childVc title:(NSString *)title image:(NSString *)image selectedImage:(NSString *)selectedImage{
    // 设置子控制器的文字
//    childVc.navigationItem.MMtitle = title;//这里不设置因为tabbar的title和navigation的title不同
    childVc.tabBarItem.title = title; //设置tabbar的文字
//    childVc.navigationItem.title = title;//设置navigation的文字
    
    //设置自控制器的图片
    childVc.tabBarItem.image = [UIImage imageNamed:image];
    childVc.tabBarItem.selectedImage = [[UIImage imageNamed:selectedImage] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    //设置字体的样式
    NSMutableDictionary *textAttrs = [NSMutableDictionary dictionary];
    textAttrs[NSForegroundColorAttributeName] = [UIColor grayColor];
    [childVc.tabBarItem setTitleTextAttributes:textAttrs forState:UIControlStateNormal];//kvc设置tabitem的title没被选择的颜色
    
    NSMutableDictionary *selectTextAttrs = [NSMutableDictionary dictionary];
    selectTextAttrs[NSForegroundColorAttributeName] =  [UIColor colorWithRed:0/255.0f green:177/255.0f blue:250/255.0f alpha:1.0f];
    [childVc.tabBarItem setTitleTextAttributes:selectTextAttrs forState:UIControlStateSelected];//kvc设置tabitem的title被选择的颜色
    
    
    //在这里包装导航栏控制器
    MMNavigationController *nav = [[MMNavigationController alloc] initWithRootViewController:childVc];
    
    //添加为子控制器
    [self addChildViewController:nav];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}





@end
