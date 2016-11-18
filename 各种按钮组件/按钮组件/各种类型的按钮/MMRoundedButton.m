//
//  MMRoundedButton.m
//  各种按钮组件
//
//  Created by mm on 2016/11/18.
//  Copyright © 2016年 mm. All rights reserved.
//

#import "MMRoundedButton.h"
#import <QuartzCore/QuartzCore.h>

@interface MMRoundedButton()

/**
 可以点进来，看看有多少种类型
 */
@property (nonatomic,assign) int style;

/**
 圆角半径？？我也不知道为什么会是个size
 */
@property (nonatomic,assign) CGSize Corner;


/**
 圆弧具体要切的类型
 */
@property (nonatomic,assign) UIRectCorner corners;

@end

@implementation MMRoundedButton

//-(instancetype)initWithCoder:(NSCoder *)aDecoder{
//    self = [super initWithCoder:aDecoder];
//    if (self) {
//        [self makeCorner];
//    }
//    return self;
//}
//-(instancetype)initWithFrame:(CGRect)frame{
//    self = [super initWithFrame:frame];
//    if (self != nil) {
//        [self makeCorner];
//    }
//    return self;
//}
//
//-(void)awakeFromNib{
//    [super awakeFromNib];
//    [self makeCorner];
//}

+(instancetype)CreateButtonWithStyle:(int)style Frame:(CGRect)rect Corner:(CGSize)corner{
    MMRoundedButton *btn = [[MMRoundedButton alloc] initWithFrame:rect];
    btn.style = style;
    btn.Corner = corner;
    return btn;
}

-(void)makeCorner{
    switch (self.style) {
        case 0:
            self.corners = UIRectCornerBottomLeft;
            break;
        case 1:
            self.corners = UIRectCornerBottomRight;
            break;
        case 2:
            self.corners = UIRectCornerTopLeft;
            break;
        case 3:
            self.corners = UIRectCornerTopRight;
            break;
        case 4:
            self.corners = UIRectCornerBottomLeft | UIRectCornerBottomRight;
            break;
        case 5:
            self.corners = UIRectCornerTopLeft | UIRectCornerTopRight;
            break;
        case 6:
            self.corners = UIRectCornerBottomLeft | UIRectCornerTopLeft;
            break;
        case 7:
            self.corners = UIRectCornerBottomRight | UIRectCornerTopRight;
            break;
        case 8:
            self.corners = UIRectCornerBottomRight | UIRectCornerTopRight | UIRectCornerTopLeft;
            break;
        case 9:
            self.corners = UIRectCornerBottomRight | UIRectCornerTopRight | UIRectCornerBottomLeft;
            break;
        default:
            self.corners = UIRectCornerAllCorners;
            break;
    }
    
//    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds
//                                                   byRoundingCorners:self.corners
//                                                         cornerRadii:CGSizeMake(20.0f, 30.0f)];
//    
//    CAShapeLayer *maskLayer = [CAShapeLayer layer];
//    maskLayer.frame = self.bounds;
//    maskLayer.path = maskPath.CGPath;
//    self.layer.mask = maskLayer;
}

-(void)setCorner:(CGSize)Corner{
    
    [self makeCorner];
    
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds
                                                   byRoundingCorners:self.corners
                                                         cornerRadii:Corner];
    
    CAShapeLayer *maskLayer = [CAShapeLayer layer];
    maskLayer.frame = self.bounds;
    maskLayer.path = maskPath.CGPath;
    self.layer.mask = maskLayer;
}

























@end
