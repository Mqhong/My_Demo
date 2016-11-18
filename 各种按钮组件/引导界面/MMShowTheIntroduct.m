//
//  MMShowTheIntroduct.m
//  各种按钮组件
//
//  Created by mm on 2016/11/18.
//  Copyright © 2016年 mm. All rights reserved.
//

#import "MMShowTheIntroduct.h"
#import "MMIntroductionViewController.h"
@interface MMShowTheIntroduct ()
@property (nonatomic,strong) MMIntroductionViewController *introductionView;
@end

@implementation MMShowTheIntroduct

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBarHidden = YES;
    self.view.backgroundColor = [UIColor lightGrayColor];
    
    // Added Introduction View Controller
    NSArray *coverImageNames = @[@"img_index_01txt", @"img_index_02txt", @"img_index_03txt"];
    NSArray *backgroundImageNames = @[@"img_index_01bg", @"img_index_02bg", @"img_index_03bg"];
    
    self.introductionView = [[MMIntroductionViewController alloc] initWithCoverImageNames:coverImageNames backgroundImageNames:backgroundImageNames];
    
    // Example 1 : Simple
    //    self.introductionView = [[ZWIntroductionViewController alloc] initWithCoverImageNames:backgroundImageNames];
    
    // Example 2 : Custom Button
    //    UIButton *enterButton = [UIButton new];
    //    [enterButton setBackgroundImage:[UIImage imageNamed:@"bg_bar"] forState:UIControlStateNormal];
    //    self.introductionView = [[ZWIntroductionViewController alloc] initWithCoverImageNames:coverImageNames backgroundImageNames:backgroundImageNames button:enterButton];
    [self.view addSubview:self.introductionView.view];
    
    __weak MMShowTheIntroduct *weakSelf = self;
    self.introductionView.didSeletedEnter = ^() {
        weakSelf.introductionView = nil;
    };

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
