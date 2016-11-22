//
//  ShowMMPagingViewController2.m
//  各种按钮组件
//
//  Created by mm on 2016/11/22.
//  Copyright © 2016年 mm. All rights reserved.
//

#import "ShowMMPagingViewController2.h"
#import "MMPagingView.h"
@interface ShowMMPagingViewController2 ()

@property(nonatomic,strong) MMPagingView *mmPagingView;
//@property(nonatomic,strong) UIScrollView *mainScroller;
@property(nonatomic,strong) UITableView *tableview1;
@property(nonatomic,strong) UITableView *tableview2;

@end

@implementation ShowMMPagingViewController2

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    
    
    self.view.backgroundColor = [UIColor whiteColor];
//    self.mainScroller = [[UIScrollView alloc] init];
//    self.mainScroller.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
//    self.mainScroller.pagingEnabled = YES;
//    self.mainScroller.backgroundColor = [UIColor grayColor];
//    self.mainScroller.contentSize = CGSizeMake([UIScreen mainScreen].bounds.size.width * 3, [UIScreen mainScreen].bounds.size.height);
//    self.mainScroller.bounces = NO;
    
    self.tableview1 = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    self.tableview1.backgroundColor = [UIColor grayColor];
//    [self.mainScroller addSubview:self.tableview1];
    
    self.tableview2 = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    self.tableview2.backgroundColor = [UIColor redColor];
//    [self.mainScroller addSubview:self.tableview2];
    
//    [self.view addSubview:self.mainScroller];
    UIView *view1 = [[UIView alloc] init];
    view1.backgroundColor = [UIColor blueColor];
    
    NSArray *titleArray = @[@"孟庆洪1",@"大萌子2",@"梦梦3"];
    NSArray *viewArray = @[self.tableview1,self.tableview2,view1];
    
    self.mmPagingView = [[MMPagingView alloc] initWithTileArray:titleArray ViewArray:viewArray];
    self.mmPagingView.frame = CGRectMake(0, 64, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.width);
    self.mmPagingView.userInteractionEnabled = YES;
    [self.view addSubview:self.mmPagingView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
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
