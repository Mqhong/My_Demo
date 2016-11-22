//
//  MMPagingView.m
//  各种按钮组件
//
//  Created by mm on 2016/11/22.
//  Copyright © 2016年 mm. All rights reserved.
//

#import "MMPagingView.h"
//#define navigaH 64
@interface MMPagingView()<UIScrollViewDelegate>

/**
 titlebtn下面的滑动的按钮
 */
@property(nonatomic,strong) UIButton *BottomBtn;

/**
 显示内容的容器
 */
@property(nonatomic,strong) UIScrollView *mainscrollview;

/**
 当前显示的页面的数
 */
@property(nonatomic,assign) NSInteger index;

/**
 内部装View的title (NSString)
 */
@property(nonatomic,strong) NSArray *titleArray;

/**
 内部装的view的信息
 */
@property(nonatomic,strong) NSArray *viewArray;


@property(nonatomic,assign) NSInteger totalViewNumber;

@end

@implementation MMPagingView

-(instancetype)initWithTileArray:(NSArray *)titleArray ViewArray:(NSArray *)viewArray{
    self = [super initWithFrame:CGRectMake(0, 0, 0, 0)];
    self.titleArray = titleArray;
    self.viewArray = viewArray;
    self.totalViewNumber = [viewArray count];
    [self _initView];
    self.userInteractionEnabled = YES;
    return self;
}

-(void)_initView{
    NSInteger totleView = [self.viewArray count];
    CGFloat TopViewHeight = 44.0f;
    CGFloat BtnW = [UIScreen mainScreen].bounds.size.width / totleView;
    CGFloat BottomH = 3;
    //init Top btn
    for (int i = 0; i < totleView; i++) {
        UIButton *btn = [[UIButton alloc] init];
        btn.tag = i + 1000;
        [btn addTarget:self action:@selector(btnclick:) forControlEvents:UIControlEventTouchUpInside];
        btn.frame = CGRectMake(BtnW * i, 0 , BtnW, TopViewHeight);
        [btn setTitle:self.titleArray[i] forState:UIControlStateNormal];
        btn.backgroundColor = [UIColor  orangeColor];
        [self addSubview:btn];
    }
    
    //init bottom Btn
    self.BottomBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, TopViewHeight - BottomH , BtnW, BottomH)];
    self.BottomBtn.backgroundColor = [UIColor redColor];
    [self addSubview:self.BottomBtn];
    
    //init Scrollview
    self.mainscrollview = [[UIScrollView alloc] init];
    self.mainscrollview.delegate = self;
    self.mainscrollview.frame = CGRectMake(0, TopViewHeight, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
    self.mainscrollview.contentSize = CGSizeMake([UIScreen mainScreen].bounds.size.width * totleView, [UIScreen mainScreen].bounds.size.height);
    self.mainscrollview.backgroundColor = [UIColor whiteColor];
    self.mainscrollview.pagingEnabled = YES;
    self.mainscrollview.showsVerticalScrollIndicator = NO;
    self.mainscrollview.showsHorizontalScrollIndicator = NO;
    
    NSInteger index = 0;
    for (UIView *itemview in self.viewArray) {
        itemview.frame = CGRectMake(index * [UIScreen mainScreen].bounds.size.width, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height - TopViewHeight);
        [self.mainscrollview addSubview:itemview];
        index++;
    }
    [self addSubview:self.mainscrollview];
}

-(void)btnclick:(UIButton *)btn{
    [self.mainscrollview setContentOffset:CGPointMake((btn.tag - 1000) * [UIScreen mainScreen].bounds.size.width, 0) animated:YES];
}

//设置头部选择栏的那个底部显示条，和下面的uiscrollview一起动
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    self.BottomBtn.frame = CGRectMake(scrollView.contentOffset.x/self.totalViewNumber, self.BottomBtn.frame.origin.y, self.BottomBtn.frame.size.width, self.BottomBtn.frame.size.height);
}


@end
