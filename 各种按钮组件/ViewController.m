//
//  ViewController.m
//  各种按钮组件
//
//  Created by mm on 2016/10/27.
//  Copyright © 2016年 mm. All rights reserved.
//

#import "ViewController.h"
#import "DeformationButton.h"
@interface ViewController (){
    DeformationButton *deformationBtn;
}

@end

@implementation ViewController


-(UIColor *)getColor:(NSString *)hexColor{
    unsigned int red,green,blue;
    NSRange range;
    range.length = 2;
    
    range.location = 0;
    [[NSScanner scannerWithString:[hexColor substringWithRange:range] ] scanHexInt:&red];
    
    range.location = 2;
    [[NSScanner scannerWithString:[hexColor substringWithRange:range]] scanHexInt:&green];
    
    range.location = 4;
    [[NSScanner scannerWithString:[hexColor substringWithRange:range]] scanHexInt:&blue];
    
    return [UIColor colorWithRed:(float)(red/255.0f) green:(float)(green/255.0f) blue:(float)(blue/255.0f) alpha:1.0f];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    deformationBtn = [[DeformationButton alloc] initWithFrame:CGRectMake(100, 100, 140, 140)];
    deformationBtn.contentColor = [UIColor orangeColor];//[self getColor:@"52c332"];
    deformationBtn.progressColor = [UIColor blackColor];
    [self.view addSubview:deformationBtn];
    
    [deformationBtn.forDisplayButton setTitle:@"微信注册" forState:UIControlStateNormal];
    [deformationBtn.forDisplayButton.titleLabel setFont:[UIFont systemFontOfSize:15]];
    [deformationBtn.forDisplayButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [deformationBtn.forDisplayButton setTitleEdgeInsets:UIEdgeInsetsMake(0, 6, 0, 0)];
    
    [deformationBtn.forDisplayButton setImage:[UIImage imageNamed:@"logo_.png"] forState:UIControlStateNormal];
    UIImage *bgImage = [UIImage imageNamed:@"button_bg.png"];
    [deformationBtn.forDisplayButton setBackgroundImage:[bgImage resizableImageWithCapInsets:UIEdgeInsetsMake(10, 10, 10, 10)] forState:UIControlStateNormal];
    [deformationBtn addTarget:self action:@selector(btnEvent) forControlEvents:UIControlEventTouchUpInside];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)btnEvent{
    NSLog(@"btnEvent");
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(6 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        if (deformationBtn.isLoading == YES) {
            NSLog(@"执行了一哈");
            [deformationBtn setIsLoading:NO];
        }
    });
    
}

@end
