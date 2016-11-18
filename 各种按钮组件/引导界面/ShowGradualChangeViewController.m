//
//  ShowGradualChangeViewController.m
//  各种按钮组件
//
//  Created by mm on 2016/11/18.
//  Copyright © 2016年 mm. All rights reserved.
//

#import "ShowGradualChangeViewController.h"

@interface ShowGradualChangeViewController ()

@end

@implementation ShowGradualChangeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.titles = @[@"滑动引导"];
    self.navigationItem.title = @"引导界面";
    
    self.classNames = @[@"MMShowTheIntroduct"];

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
