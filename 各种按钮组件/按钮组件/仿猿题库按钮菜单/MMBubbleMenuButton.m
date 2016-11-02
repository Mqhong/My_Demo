//
//  MMBubbleMenuButton.m
//  各种按钮组件
//
//  Created by mm on 2016/11/1.
//  Copyright © 2016年 mm. All rights reserved.
//

#import "MMBubbleMenuButton.h"
#import "DWBubbleMenuButton.h"
@interface MMBubbleMenuButton ()<DWBubbleMenuViewDelegate>

@end

@implementation MMBubbleMenuButton

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    //创建按钮
    UILabel *HomeLable = [self createHomeButtonView];
    
    DWBubbleMenuButton *downMenubutton = [[DWBubbleMenuButton alloc] initWithFrame:CGRectMake(100.f,
                                                                                             100.f,
                                                                                             HomeLable.frame.size.width,
                                                                                             HomeLable.frame.size.height) expansionDirection:DirectionRight];
    downMenubutton.homeButtonView = HomeLable;
    
    downMenubutton.delegate = self;
    
    [downMenubutton addButtons:[self createDemoButtonArray]];
    
    [self.view addSubview:downMenubutton];
    
    
}

-(UILabel *)createHomeButtonView{
    UILabel *lable = [[UILabel alloc] initWithFrame:CGRectMake(0.f, 0.f, 40.f, 40.f)];
    
    lable.text = @"Tap";
    lable.textColor = [UIColor whiteColor];
    lable.textAlignment = NSTextAlignmentCenter;
    lable.layer.cornerRadius = lable.frame.size.height / 2.f;
    lable.backgroundColor = [UIColor colorWithRed:0.f green:0.f blue:0.f alpha:0.5f];
    lable.clipsToBounds = YES;
    
    return lable;
}

-(NSArray *)createDemoButtonArray{
    NSMutableArray *buttonsMutable = [[NSMutableArray alloc] init];
    int i = 0;
    for (NSString *title in @[@"A",@"B",@"C",@"D",@"E",@"F",@"孟庆洪"]) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
        [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [button setTitle:title forState:UIControlStateNormal];
        
        button.frame = CGRectMake(0.f, 0.f, 30.f, 30.f);
        button.layer.cornerRadius = button.frame.size.height / 2.f;
        button.backgroundColor = [UIColor colorWithRed:0.f green:0.f blue:0.f alpha:0.5f];
        button.clipsToBounds = YES;
        button.tag = i++;
        
        [button addTarget:self action:@selector(test:) forControlEvents:UIControlEventTouchUpInside];
        
        [buttonsMutable addObject:button];
    }
    return [buttonsMutable copy];
}

-(void)test:(UIButton *)sender{
    NSLog(@"Button tapped,tag:%ld",(long)sender.tag);
}


-(UIButton *)createButtonWithName:(NSString *)imageName{
    UIButton *btn = [[UIButton alloc] init];
    [btn setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    [btn sizeToFit];
    
    [btn addTarget:self action:@selector(test:) forControlEvents:UIControlEventTouchUpInside];
    return btn;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)bubbleMenuButtonWillExpand:(DWBubbleMenuButton *)expandableView{
    NSLog(@"\t\t%s,%d",__func__,__LINE__);
}
-(void)bubbleMenuButtonDidExpand:(DWBubbleMenuButton *)expandableView{
    NSLog(@"\t\t%s,%d",__func__,__LINE__);
}
-(void)bubbleMenuButtonWillCollapse:(DWBubbleMenuButton *)expandableView{
    NSLog(@"\t\t%s,%d",__func__,__LINE__);
}

-(void)bubbleMenuButtonDidCollapse:(DWBubbleMenuButton *)expandableView{
    NSLog(@"\t\t%s,%d",__func__,__LINE__);
}

//
//
//
//


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
