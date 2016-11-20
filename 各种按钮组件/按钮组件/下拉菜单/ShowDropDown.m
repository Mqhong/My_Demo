//
//  ShowDropDown.m
//  各种按钮组件
//
//  Created by mm on 2016/11/20.
//  Copyright © 2016年 mm. All rights reserved.
//

#import "ShowDropDown.h"
#import "MMDropDownMenu.h"
#import "DropDownContent.h"

@interface ShowDropDown ()<MMDropDownMenuDelegate,DropDownClickDelegate>
@property(nonatomic,strong) MMDropDownMenu *mmDropMenu;
@property(nonatomic,strong) UIButton *btn;

@end

@implementation ShowDropDown

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.btn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.btn.frame = CGRectMake(100, 100, 150, 150);
    self.btn.backgroundColor = [UIColor grayColor];
    [self.btn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.btn];
    
    }
-(void)btnClick{
    NSLog(@"6666");
    self.mmDropMenu = [MMDropDownMenu menu];
    DropDownContent *dropDowncontent = [[DropDownContent alloc] init];
    self.mmDropMenu.contentController = dropDowncontent;
    dropDowncontent.delegate = self;
    self.mmDropMenu.delegate = self;
    [self.mmDropMenu ShowFrom:self.btn];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

-(void)dropdownMenuDidShow:(MMDropDownMenu *)menu{
    NSLog(@"%s",__func__);
}
-(void)dropdownMenuDidDismiss:(MMDropDownMenu *)menu{
    NSLog(@"%s",__func__);
}

-(NSArray *)DropDownDataSource{
    return @[@"1",@"2",@"3"];
}

-(void)DropDownClickWithIndex:(NSInteger)index{
    NSLog(@"mm点击咯\t%ld",(long)index);
    [self.mmDropMenu dismiss];
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
