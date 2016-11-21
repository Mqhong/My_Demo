//
//  UINavigationItem+mmtitle.m
//  环保通框架
//
//  Created by mm on 2016/11/4.
//  Copyright © 2016年 mm. All rights reserved.
//

#import "UINavigationItem+mmtitle.h"

@implementation UINavigationItem (mmtitle)

-(NSString *)MMtitle{
    return @"";
}
-(void)setMMtitle:(NSString *)MMtitle{
    UILabel *titlelabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 100, 30)];
    titlelabel.backgroundColor = [UIColor clearColor];
    titlelabel.text = MMtitle;
    titlelabel.textAlignment  = NSTextAlignmentCenter;
    titlelabel.textColor = [UIColor whiteColor];
    self.titleView = titlelabel;
}
@end
