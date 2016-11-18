//
//  ShowMMRoundeButton.m
//  各种按钮组件
//
//  Created by mm on 2016/11/18.
//  Copyright © 2016年 mm. All rights reserved.
//

#import "ShowMMRoundeButton.h"
#import "MMRoundedButton.h"
@interface ShowMMRoundeButton ()

@end

@implementation ShowMMRoundeButton

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"缺角的按钮";
    self.view.backgroundColor = [UIColor whiteColor];
//    MMRoundedButton *btn = [[MMRoundedButton alloc] initWithFrame:CGRectMake(50, 100, 100, 100)];
    MMRoundedButton *btn = [MMRoundedButton CreateButtonWithStyle:9 Frame:CGRectMake(50, 100, 100, 100) Corner:CGSizeMake(20.0f, 30.0f)];
    
    btn.backgroundColor = [UIColor redColor];
    [self.view addSubview:btn];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
