//
//  ShowPagingController.m
//  各种按钮组件
//
//  Created by mm on 2016/11/2.
//  Copyright © 2016年 mm. All rights reserved.
//

#import "ShowPagingController.h"
#import "MM_HorizontalPagingView.h"
#import "HHContentTableView.h"
@interface ShowPagingController ()

@end

@implementation ShowPagingController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIView *headerView = [[UIView alloc] init];
    HHContentTableView *tableView1 = [HHContentTableView contentTableView];
    tableView1.backgroundColor = [UIColor orangeColor];
    HHContentTableView *tableView2 = [HHContentTableView contentTableView];
    tableView2.backgroundColor = [UIColor redColor];
    HHContentTableView *tableView3 = [HHContentTableView contentTableView];
    tableView3.backgroundColor = [UIColor grayColor];
    UIScrollView *tableView4 = [[UIScrollView alloc]initWithFrame:CGRectZero];
    tableView4.backgroundColor = [UIColor whiteColor];
    
    NSArray *viewArray = @[tableView1,tableView2,tableView3,tableView4];
    
    
    NSMutableArray *buttonArray = [NSMutableArray array];
    for (int i = 0; i<viewArray.count; i++) {
        UIButton *segmentButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [segmentButton setBackgroundImage:[UIImage imageNamed:@"button_normal_YFHorizontalPagingViewController"] forState:UIControlStateNormal];
        [segmentButton setBackgroundImage:[UIImage imageNamed:@"button_selected_YFHorizontalPagingViewController"] forState:UIControlStateSelected];
        [segmentButton setTitle:[NSString stringWithFormat:@"view%@",@(i)] forState:UIControlStateNormal];
        [segmentButton setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
        [buttonArray addObject:segmentButton];
    }
    MM_HorizontalPagingView *pagingView = [MM_HorizontalPagingView pagingViewWithHeaderView:headerView headerHeight:0.f segmentButtons:buttonArray segmentHeight:100 contentViews:viewArray];
    pagingView.segmentTopSpace = 100;
    
    [self.view addSubview:pagingView];
}






























@end
