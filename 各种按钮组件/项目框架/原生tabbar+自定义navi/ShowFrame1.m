//
//  ShowFrame1.m
//  各种按钮组件
//
//  Created by mm on 2016/11/21.
//  Copyright © 2016年 mm. All rights reserved.
//

#import "ShowFrame1.h"
#import "MMTabbarController.h"
#import "AppDelegate.h"
@interface ShowFrame1 ()

@end

@implementation ShowFrame1

- (void)viewDidLoad {
    [super viewDidLoad];
    AppDelegate *delegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    
    #pragma mark - 自定义了tabbar之后 在这种记性跳转的时候 需要让之前的动画先走一下，不然要报警告：
     #pragma mark  Unbalanced calls to begin/end appearance transitions for <TabbarAndNavigation: 0x7f8518c4cae0>
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        delegate.window.rootViewController = [[MMTabbarController alloc] init];
    });
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
