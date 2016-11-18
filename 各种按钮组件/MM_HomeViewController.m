//
//  MM_HomeViewController.m
//  各种按钮组件
//
//  Created by mm on 2016/10/28.
//  Copyright © 2016年 mm. All rights reserved.
//

#import "MM_HomeViewController.h"

@implementation MM_HomeViewController

-(void)viewDidLoad{
    [super viewDidLoad];
    self.titles = @[@"按钮",
                    @"滚动悬浮视图",
                    @"引导界面"];
    
    //框架模式有哪些？
    //MVC,MTV,MVP,CBD,ORM等
    
    self.classNames = @[@"MM_Btn_Show",
                        @"ShowPagingController",
                        @"ShowGradualChangeViewController"];
    [self setupNav];
}

-(void)setupNav{
    self.title =  @"目录";
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"作 者" style:UIBarButtonItemStylePlain target:self action:@selector(rightBarClick)];
}

-(void)rightBarClick{
    NSLog(@"等着你点");
}

@end
