
//
//  DWBubbleMenuButton.m
//  各种按钮组件
//
//  Created by mm on 2016/10/28.
//  Copyright © 2016年 mm. All rights reserved.
//

#import "DWBubbleMenuButton.h"
static float kDefaultAnimationDuration = 0.25f;

@interface DWBubbleMenuButton()

@property (nonatomic,strong) UITapGestureRecognizer *tapGestureRecognizer;
@property (nonatomic,strong) NSMutableArray *buttonContainer;
@property (nonatomic,assign) CGRect originFrame;

@end

@implementation DWBubbleMenuButton
#pragma mark - 
#pragma makr Public Methods
-(void)addButtons:(NSArray *)buttons{
    assert(buttons != nil);//断言，在debug阶段，如果有问题，会终止程序并且提供相应的提示。
    for (UIButton *btn in buttons) {
        [self addButton:btn];
    }
    
    if (self.homeButtonView != nil) {
        [self bringSubviewToFront:self.homeButtonView];
    }
    
    
}

-(void)addButton:(UIButton *)button{
    assert(button != nil);
    if (_buttonContainer == nil) {
        self.buttonContainer = [[NSMutableArray alloc] init];
    }
    
    if ([_buttonContainer containsObject:button] == false) {
        [_buttonContainer addObject:button];
        [self addSubview:button];
        button.hidden = YES;
    }
}

-(void)showButtons{
    if ([self.delegate respondsToSelector:@selector(bubbleMenuButtonWillExpand:)]) {
        [self.delegate bubbleMenuButtonWillExpand:self];
    }
//    [self _prepareForButtonExpansion];
    self.userInteractionEnabled = NO;
    
    [CATransaction begin];
    [CATransaction setAnimationDuration:_animationDuration];
    [CATransaction setCompletionBlock:^{
        for (UIButton *button in _buttonContainer) {
            button.transform = CGAffineTransformIdentity;
        }
        if (self.delegate != nil) {
            if ([self.delegate respondsToSelector:@selector(bubbleMenuButtonDidExpand:)]) {
                [self.delegate bubbleMenuButtonDidExpand:self];
            }
        }
        self.userInteractionEnabled = YES;
    }];
    
    NSArray *buttonContainer = _buttonContainer;
    if (self.direction == DirectionUp || self.direction == DirectionLeft) {
//        buttonContainer = [self _reverseOrderFromArray:_buttonContainer];
    }
    for (int i = 0; i < buttonContainer.count; i++) {
        int index = (int)buttonContainer.count - (i+1);
        UIButton *button = [buttonContainer objectAtIndex:index];
        button.hidden = NO;
     
        // position animation
        CABasicAnimation *positionAnimation = [CABasicAnimation animationWithKeyPath:@"position"];
        
        CGPoint originPosition = CGPointZero;
        CGPoint finalPosition = CGPointZero;
        
        switch (self.direction) {
            case DirectionLeft:
                originPosition = CGPointMake(self.frame.size.width - self.homeButtonView.frame.size.width, self.frame.size.height / 2.f);
                finalPosition = CGPointMake(self.frame.size.width - self.homeButtonView.frame.size.width - button.frame.size.width / 2.f - self.buttonSpacing - ((button.frame.size.width + self.buttonSpacing) * index), self.frame.size.height/2.f);
                break;
            case DirectionRight:
                originPosition = CGPointMake(self.homeButtonView.frame.size.width, self.frame.size.height/2.f);
                finalPosition = CGPointMake(self.homeButtonView.frame.size.width + self.buttonSpacing + button.frame.size.width/2.f+ ((button.frame.size.width + self.buttonSpacing)*index), self.frame.size.height/2.f);
                break;
            case DirectionUp:
                originPosition = CGPointMake(self.frame.size.width/2.f, self.frame.size.height - self.homeButtonView.frame.size.height);
                finalPosition = CGPointMake(self.frame.size.width/2.f, self.frame.size.height - self.homeButtonView.frame.size.height - self.buttonSpacing-button.frame.size.height/2.f - ((button.frame.size.height+self.buttonSpacing)*index));
                break;
            case DirectionDown:
                originPosition = CGPointMake(self.frame.size.width/2.f, self.homeButtonView.frame.size.height);
                NSLog(@"originPosition = %@",NSStringFromCGPoint(originPosition));
                finalPosition = CGPointMake(self.frame.size.width/2.f, self.homeButtonView.frame.size.height + self.buttonSpacing + button.frame.size.height/2.f+((button.frame.size.height + self.buttonSpacing) *index));
                NSLog(@"finalPosition = %@",NSStringFromCGPoint(finalPosition));
                NSLog(@"index = %zd,button.height = %f",index,button.frame.size.height);
                break;
            default:
                break;
        }
        
        positionAnimation.duration = _animationDuration;
        positionAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
        positionAnimation.fromValue = [NSValue valueWithCGPoint:originPosition];
        positionAnimation.toValue = [NSValue valueWithCGPoint:finalPosition];
        positionAnimation.beginTime = CACurrentMediaTime() + (_animationDuration/(float)_buttonContainer.count * (float)i);
        positionAnimation.fillMode = kCAFillModeForwards;
        positionAnimation.removedOnCompletion = NO;
        
        [button.layer addAnimation:positionAnimation forKey:@"positionAnimation"];
        
        
        
    }
}



@end
