//
//  DropDownContent.h
//  各种按钮组件
//
//  Created by mm on 2016/11/20.
//  Copyright © 2016年 mm. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol DropDownClickDelegate <NSObject>


@optional

/**
 点击选项后执行的方法

 @param index 点击的index
 */
-(void)DropDownClickWithIndex:(NSInteger)index;


/**
 数据源方法，获取外部给的数据

 @return 返回获取的数据源
 */
-(NSArray *)DropDownDataSource;

@end

@interface DropDownContent : UITableViewController

@property(nonatomic,weak) id<DropDownClickDelegate>delegate;

@end
