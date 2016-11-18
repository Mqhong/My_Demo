//
//  MMIntroductionViewController.h
//  各种按钮组件
//
//  Created by mm on 2016/11/18.
//  Copyright © 2016年 mm. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^DidSelecedEnter)();

@interface MMIntroductionViewController : UIViewController

@property (nonatomic,strong) UIScrollView *pagingScrollView;
@property (nonatomic,strong) UIButton *enterButton;

@property (nonatomic,copy) DidSelecedEnter didSeletedEnter;


/**
 @[@"image1",@"image2"]
 */
@property (nonatomic,strong) NSArray *backgroundImageNames;


/**
 @[@"coverImage1",@"coverImage2"]
 */
@property (nonatomic,strong) NSArray *coverImageNames;

-(id)initWithCoverImageNames:(NSArray *)coverNames;
-(id)initWithCoverImageNames:(NSArray *)coverNames backgroundImageNames:(NSArray *)bgNames;
-(id)initWithCoverImageNames:(NSArray *)coverNames backgroundImageNames:(NSArray *)bgNames button:(UIButton *)button;













































@end
