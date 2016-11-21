//
//  vc1.m
//  各种按钮组件
//
//  Created by mm on 2016/11/21.
//  Copyright © 2016年 mm. All rights reserved.
//

#import "vc1.h"
#import "UINavigationItem+mmtitle.h"
@interface vc1 ()

@end

@implementation vc1

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor orangeColor];
    self.navigationItem.MMtitle = @"vc1";
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
