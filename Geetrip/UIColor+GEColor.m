//
//  UIColor+GEColor.m
//  Geetrip
//
//  Created by chengfeng on 16/1/12.
//  Copyright © 2016年 Geetrip Inc. All rights reserved.
//

#import "UIColor+GEColor.h"

@implementation UIColor (GEColor)

+ (UIColor *)geetripGreenColor
{
    return [UIColor colorWithRed:16/255.0 green:57/255.0 blue:34/255.0 alpha:1];
}

+ (UIColor *)geetripYellowColor
{
    return [UIColor colorWithRed:240/255.0 green:172/255.0 blue:53/255.0 alpha:1];
}

+ (UIColor *)separator_gray_line_color
{
    return UIColorFromRGB(0xcccccc);
}

+ (UIColor *)backGrayColor
{
    return [UIColor colorWithRed:240/255.0 green:238/255.0 blue:245/255.0 alpha:1];
}

+ (UIColor *)geRedColor
{
    return [UIColor colorWithRed:255/255.0 green:64/255.0 blue:122/255.0 alpha:1];
}

+ (UIColor *)weixinBackColor
{
    return [UIColor colorWithRed:57/255.0 green:171/255.0 blue:57/255.0 alpha:1];
}

+ (UIColor *)textColor
{
    return [UIColor colorWithRed:65/255.0 green:141/255.0 blue:219/255.0 alpha:1];
}

@end
