//
//  MMPagingView.h
//  各种按钮组件
//
//  Created by mm on 2016/11/22.
//  Copyright © 2016年 mm. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol MMPagingViewDelegate <NSObject>

-(void)SelectePageViewNumber:(NSInteger)index;

@end

@interface MMPagingView : UIView

@property(nonatomic,weak) id<MMPagingViewDelegate> delegate;

-(instancetype)initWithTileArray:(NSArray *)titleArray ViewArray:(NSArray *)viewArray;

//-(void)SelecteTopPageViewNumber:(NSInteger)index;

@end
