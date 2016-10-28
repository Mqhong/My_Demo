//
//  BaseTableViewController.m
//  各种按钮组件
//
//  Created by mm on 2016/10/28.
//  Copyright © 2016年 mm. All rights reserved.
//

#import "BaseTableViewController.h"

@interface BaseTableViewController ()

@end

@implementation BaseTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.titles.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *mainCellIndentifier = @"mainCellIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:mainCellIndentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:mainCellIndentifier];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    
    cell.selectionStyle = UITableViewCellSelectionStyleGray;
    NSString *labelText;
    if (indexPath.row < 9) {
        labelText = [NSString stringWithFormat:@"0%zd - %@",indexPath.row + 1,self.titles[indexPath.row]];
    }else{
        labelText = [NSString stringWithFormat:@"%zd - %@",indexPath.row + 1,self.titles[indexPath.row]];
    }
    cell.textLabel.text = labelText;
    cell.detailTextLabel.text = self.classNames[indexPath.row];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}

#pragma mark - Tableview Delegate
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 60;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    NSString *className = self.classNames[indexPath.row];
    
    NSInteger classNameLength = className.length;
    NSInteger storyBoardLength = @"_UIStoryboard".length;
    NSInteger xibLength = @"_xib".length;
    
    BOOL istrue = (classNameLength - storyBoardLength) > 0 ? [[className substringFromIndex:classNameLength - storyBoardLength] isEqualToString:@"_UIStoryboard"] : NO;
    
    if (istrue) {
        className = [className substringToIndex:classNameLength - storyBoardLength];
        
//        if ([className isEqualToString:@"RZSimpleViewController"]) {  // 自定义push动画
//            RZSimpleViewController *rootViewController = [[RZSimpleViewController alloc] init];
//            RZTransitionsNavigationController* rootNavController = [[RZTransitionsNavigationController alloc] initWithRootViewController:rootViewController];
//            [self presentViewController:rootNavController animated:YES completion:nil];
//        }else {
//            // 注意: 这个storyboard的名字必须是控制器的名字
//            UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:className bundle:nil];
//            UIViewController *cardVC = [storyBoard instantiateInitialViewController];
//            if (!cardVC) {
//                cardVC = [storyBoard instantiateViewControllerWithIdentifier:className];
//            }
//            cardVC.title = self.titles[indexPath.row];
//            [self.navigationController pushViewController:cardVC animated:YES ];
//        }
        
    }else if ([[className substringFromIndex:classNameLength - xibLength] isEqualToString:@"_xib"]){
        
//        className = [className substringToIndex:classNameLength - xibLength];
//        
//        UIViewController *vc = [[NSClassFromString(className) alloc]initWithNibName:className bundle:nil];
//        vc.title = self.titles[indexPath.row];
//        [self.navigationController pushViewController:vc animated:YES];
    }else{
        UIViewController *vc = [[NSClassFromString(className) alloc] init];
        vc.title = self.titles[indexPath.row];
        [self.navigationController pushViewController:vc animated:YES];
    }
}
@end
