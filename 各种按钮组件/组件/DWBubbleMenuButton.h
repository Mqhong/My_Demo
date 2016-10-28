//
//  DWBubbleMenuButton.h
//  各种按钮组件
//
//  Created by mm on 2016/10/28.
//  Copyright © 2016年 mm. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger,ExpansionDirection) {
    DirectionLeft = 0,
    DirectionRight,
    DirectionUp,
    DirectionDown
};

@class DWBubbleMenuButton;

@protocol DWBubbleMenuViewDelegate <NSObject>
@optional
-(void)bubbleMenuButtonWillExpand:(DWBubbleMenuButton *)expandableView;
-(void)bubbleMenuButtonDidExpand:(DWBubbleMenuButton *)expandableView;
-(void)bubbleMenuButtonWillCollapse:(DWBubbleMenuButton *)expandableView;
-(void)bubbleMenuButtonDidCollapse:(DWBubbleMenuButton *)expandableView;
@end

@interface DWBubbleMenuButton : UIView<UIGestureRecognizerDelegate>
@property(nonatomic,weak,readonly) NSArray *buttons;
@property(nonatomic,strong)UIView *homeButtonView;
@property(nonatomic,readonly) BOOL isCollapsed;
@property(nonatomic,weak) id <DWBubbleMenuViewDelegate> delegate;

/**
 菜单栏扩展的方向
 */
@property(nonatomic) enum ExpansionDirection direction;

/**
 指示主屏幕按钮是否会使其触摸高亮显示，这是默认启用的
 */
@property(nonatomic) BOOL animatedHighlighting;

/**
 选择菜单后，菜单是否重新重叠起来
 */
@property(nonatomic) BOOL collapseAfterSelection;

/**
 重叠/打开所需要的时间
 */
@property(nonatomic) float animationDuration;

/**
 没有按下时主页按钮视图的默认的透视度
 */
@property(nonatomic) float standbyAlpha;

/**
 按下主页按钮视图的时候，主页视图显示的透明度
 */
@property(nonatomic) float highlightAlpha;

/**
 展开时，菜单按钮之间的距离
 */
@property(nonatomic) float buttonSpacing;


/**
 初始化程序

 @param frame     frame
 @param direction 展开的方向

 @return 返回初始化成功的控件
 */
-(id)initWithFrame:(CGRect)frame expansionDirection:(ExpansionDirection)direction;

//公用方法
-(void)addButtons:(NSArray *)buttons;
-(void)addButton:(UIButton *)button;
-(void)showButtons;
-(void)dismissButtons;

@end
