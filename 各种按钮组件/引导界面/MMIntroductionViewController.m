//
//  MMIntroductionViewController.m
//  各种按钮组件
//
//  Created by mm on 2016/11/18.
//  Copyright © 2016年 mm. All rights reserved.
//

#import "MMIntroductionViewController.h"

@interface MMIntroductionViewController ()<UIScrollViewDelegate>

@property(nonatomic,strong) NSArray *backgroundViews;
@property(nonatomic,strong) NSArray *scrollViewPages;
@property(nonatomic,strong) UIPageControl *pageControl;
@property(nonatomic,assign) NSInteger centerPageIndex;

@end

@implementation MMIntroductionViewController


-(void)dealloc{
    self.view = nil;
}

-(id)initWithCoverImageNames:(NSArray *)coverNames{
    if (self = [super init]) {
        [self initSelfWithCoverNames:coverNames backgroundImageNames:nil];
    }
    return self;
}

-(id)initWithCoverImageNames:(NSArray *)coverNames backgroundImageNames:(NSArray *)bgNames{
    if (self = [super init]) {
        [self initSelfWithCoverNames:coverNames backgroundImageNames:bgNames];
    }
    return self;
}

-(id)initWithCoverImageNames:(NSArray *)coverNames backgroundImageNames:(NSArray *)bgNames button:(UIButton *)button{
    if (self = [super init]) {
        [self initSelfWithCoverNames:coverNames backgroundImageNames:bgNames];
        self.enterButton = button;
    }
    return self;
}

-(void)initSelfWithCoverNames:(NSArray *)coverNames backgroundImageNames:(NSArray *)bgNames{
    self.coverImageNames = coverNames;
    self.backgroundImageNames = bgNames;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    [self addBackgroundViews];
    
    self.pagingScrollView =[[UIScrollView alloc] initWithFrame:self.view.bounds];
    self.pagingScrollView.delegate = self;
    self.pagingScrollView.pagingEnabled = YES;
    self.pagingScrollView.showsHorizontalScrollIndicator = NO;
    
    [self.view addSubview:self.pagingScrollView];
    
    self.pageControl = [[UIPageControl alloc] initWithFrame:[self frameOfPageControl]];
    self.pageControl.pageIndicatorTintColor = [UIColor grayColor];
    [self.view addSubview:self.pageControl];
    
    if (!self.enterButton) {
        self.enterButton = [[UIButton alloc] init];
        [self.enterButton setTitle:NSLocalizedString(@"Enter", nil) forState:UIControlStateNormal];
        self.enterButton.layer.borderWidth = 0.5;
        self.enterButton.layer.borderColor = [UIColor whiteColor].CGColor;
    }
    
    [self.enterButton addTarget:self action:@selector(enter:) forControlEvents:UIControlEventTouchUpInside];
    self.enterButton.frame = [self frameOfEnterButton];
    self.enterButton.alpha = 0;
    [self.view addSubview:self.enterButton];
    
    [self reloadPages];
}

-(void)addBackgroundViews{
    CGRect frame = self.view.bounds;
    NSMutableArray *tmpArray = [NSMutableArray array];
    [[[[self backgroundImageNames] reverseObjectEnumerator] allObjects] enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:obj]];
        imageView.frame = frame;
        imageView.tag = idx + 1;
        [tmpArray addObject:imageView];
        [self.view addSubview:imageView];
    }];
    self.backgroundViews = [[tmpArray reverseObjectEnumerator] allObjects];
}

-(void)reloadPages{
    self.pageControl.numberOfPages = [[self coverImageNames] count];
    self.pagingScrollView.contentSize = [self contentSizeOfScrollView];
    
    __block CGFloat x = 0;
    [[self scrollViewPages] enumerateObjectsUsingBlock:^(UIView *obj, NSUInteger idx, BOOL * _Nonnull stop) {
        obj.frame = CGRectOffset(obj.frame, x, 0);
        [self.pagingScrollView addSubview:obj];
        x += obj.frame.size.width;
    }];
    
    //如果引导页只有一个界面，点击进入界面
    if (self.pageControl.numberOfPages == 1) {
        self.enterButton.alpha = 1;
        self.pageControl.alpha = 0;
    }
    
    //如果只有一个界面，设置可以ScrollView还是能滑动
    if (self.pagingScrollView.contentSize.width == self.pagingScrollView.frame.size.width) {
        self.pagingScrollView.contentSize = CGSizeMake(self.pagingScrollView.contentSize.width + 1, self.pagingScrollView.contentSize.height);
    }
}

-(CGRect)frameOfPageControl{
    return CGRectMake(0, self.view.bounds.size.height - 30, self.view.bounds.size.width, 30);
}

-(CGRect)frameOfEnterButton{
    CGSize size = self.enterButton.bounds.size;
    if (CGSizeEqualToSize(size, CGSizeZero)) {
        size = CGSizeMake(self.view.frame.size.width * 0.6, 40);
    }
    return CGRectMake(self.view.frame.size.width / 2 - size.width / 2, self.pageControl.frame.origin.y - size.height, size.width, size.height);
}

#pragma mark - UIScrollViewDelegate
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    NSInteger index = scrollView.contentOffset.x / self.view.frame.size.width;
    CGFloat alpha = 1 - ((scrollView.contentOffset.x - index * self.view.frame.size.width) / self.view.frame.size.width);
    
    if ([self.backgroundViews count] > index) {
        UIView *v = [self.backgroundViews objectAtIndex:index];
        if (v) {
            [v setAlpha:alpha];
        }
    }
    
    self.pageControl.currentPage = scrollView.contentOffset.x / (scrollView.contentSize.width / [self numberOfPagesInPagingScrollView]);
    [self pagingScrollViewDidChangePages:scrollView];
}
-(void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView{
    if ([scrollView.panGestureRecognizer translationInView:scrollView.superview].x < 0) {
        if (![self hasNext:self.pageControl]) {
            [self enter:nil];
        }
    }
}

#pragma mark - UIScrollView & UIPageControl DataSource

-(BOOL)hasNext:(UIPageControl *)pageControl{
    return pageControl.numberOfPages > pageControl.currentPage + 1;
}

-(BOOL)isLast:(UIPageControl *)pageControl{
    return pageControl.numberOfPages == pageControl.currentPage + 1;
}

-(NSInteger)numberOfPagesInPagingScrollView{
    return [[self coverImageNames] count];
}
-(void)pagingScrollViewDidChangePages:(UIScrollView *)pagingScrollView{
    if ([self isLast:self.pageControl]) {
        if (self.pageControl.alpha == 1) {
            self.enterButton.alpha = 0;
            
            [UIView animateWithDuration:0.4 animations:^{
                self.enterButton.alpha = 1;
                self.pageControl.alpha = 0;
            }];
        }
    }else{
        if (self.pageControl.alpha == 0) {
            [UIView animateWithDuration:0.4 animations:^{
                self.enterButton.alpha = 0;
                self.pageControl.alpha = 1;
            }];
        }
    }
}

-(BOOL)hasEnterButtonInView:(UIView *)page{
    __block BOOL result = NO;
    [page.subviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if (obj && obj == self.enterButton) {
            result = YES;
        }
    }];
    return result;
}

-(UIImageView *)scrollViewPage:(NSString *)imageName{
    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:imageName]];
    CGSize size = {[[UIScreen mainScreen] bounds].size.width,[[UIScreen mainScreen] bounds].size.height};
    imageView.frame = CGRectMake(imageView.frame.origin.x, imageView.frame.origin.y, size.width, size.height);
    return imageView;
}

-(NSArray *)scrollViewPages{
    if ([self numberOfPagesInPagingScrollView] == 0) {
        return  nil;
    }
    
    if (_scrollViewPages) {
        return _scrollViewPages;
    }
    
    NSMutableArray *tmpArray = [NSMutableArray array];
    [self.coverImageNames enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        UIImageView *v = [self scrollViewPage:obj];
        [tmpArray addObject:v];
    }];
    
    _scrollViewPages = tmpArray;
    return _scrollViewPages;
    
}

-(CGSize)contentSizeOfScrollView{
    UIView *view = [[self scrollViewPages] firstObject];
    return CGSizeMake(view.frame.size.width * self.scrollViewPages.count, view.frame.size.height);
}

#pragma mark- Action

-(void)enter:(id)object{
    if (self.didSeletedEnter) {
        self.didSeletedEnter();
    }
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
