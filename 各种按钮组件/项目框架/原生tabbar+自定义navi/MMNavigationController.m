//
//  MMNavigationController.m
//  环保通框架
//
//  Created by mm on 2016/11/4.
//  Copyright © 2016年 mm. All rights reserved.
//

#import "MMNavigationController.h"
#import "UIBarButtonItem+Category.h"
@interface MMNavigationController ()<UIGestureRecognizerDelegate,UINavigationControllerDelegate>
@property(nonatomic,weak) UIViewController *currentShowVC;
@end

@implementation MMNavigationController

+(void)initialize{
    //设置整个项目所有item的主题样式
    UIBarButtonItem *item = [UIBarButtonItem appearance];
    
    //设置普通状态
    //key:NS*******AttributeName
    NSMutableDictionary *textAttrs = [NSMutableDictionary dictionary];
    textAttrs[NSForegroundColorAttributeName] = [UIColor orangeColor];
    textAttrs[NSFontAttributeName] = [UIFont systemFontOfSize:13];
    [item setTitleTextAttributes:textAttrs forState:UIControlStateNormal];
    
    //设置不可用状态
    NSMutableDictionary *disableTextAttrs = [NSMutableDictionary dictionary];
    disableTextAttrs[NSForegroundColorAttributeName] = [UIColor colorWithRed:0.6 green:0.6 blue:0.6 alpha:0.7];
    disableTextAttrs[NSFontAttributeName] = [UIFont systemFontOfSize:13];
    [item setTitleTextAttributes:disableTextAttrs forState:UIControlStateDisabled];
    
    // 每一个像素都有自己的颜色，每一种颜色都可以由RGB3色组成
}


- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationBar setBarTintColor:[UIColor colorWithRed:0/255.0 green:153/255.0 blue:238/255.0 alpha:1.0f]];
    
}

-(void)addSwipRecognizer{
    //初始化手势并添加执行方法
    UISwipeGestureRecognizer *swipRecognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(return)];
    //手势方向
    swipRecognizer.direction = UISwipeGestureRecognizerDirectionRight;
    
    //相应的手指数
    swipRecognizer.numberOfTouchesRequired = 1;
    
    //添加手势
    [[self view] addGestureRecognizer:swipRecognizer];
}

#pragma mark 返回上一级
-(void)return{
    //最低控制器无需返回
    if(self.viewControllers.count <= 1){
        return;
    }
    // pop返回上一级
    [self popViewControllerAnimated:YES];
}


-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    
    if (self.viewControllers.count > 0) {
        //隐藏tabbarController
        //tudo
        
        //设置右滑返回为可用
        self.interactivePopGestureRecognizer.enabled = YES;
        
        //创建下一个控制器的返回键
        viewController.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithTarget:self action:@selector(back) image:@"back_icon" highImage:@"back_icon"];
    }
    
    //MARK:在这里去除导航栏的遮挡
    viewController.edgesForExtendedLayout = UIRectEdgeBottom;
    viewController.extendedLayoutIncludesOpaqueBars = false;
    viewController.modalPresentationCapturesStatusBarAppearance = false;
    [super pushViewController:viewController animated:animated];
}

-(UIViewController *)popViewControllerAnimated:(BOOL)animated{
    UIViewController *con = [super popViewControllerAnimated:animated];
    if (self.viewControllers.count == 1) {
        //显示底部导航栏
    }
    return con;
}


-(void)back{
    [self popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
@end
