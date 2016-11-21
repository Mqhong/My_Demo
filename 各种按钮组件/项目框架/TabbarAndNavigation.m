//
//  TabbarAndNavigation.m
//  各种按钮组件
//
//  Created by mm on 2016/11/21.
//  Copyright © 2016年 mm. All rights reserved.
//

#import "TabbarAndNavigation.h"

@interface TabbarAndNavigation ()

@end

@implementation TabbarAndNavigation

- (void)viewDidLoad {
    [super viewDidLoad];
    self.titles = @[@"tabbar+navagition"];
    self.navigationItem.title = @"框架1";
    
    self.classNames = @[@"ShowFrame1"];
    
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
