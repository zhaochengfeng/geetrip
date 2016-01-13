//
//  DefineMethodHeader.h
//  Geetrip
//
//  Created by chengfeng on 15/7/13.
//  Copyright (c) 2015年 Geetrip Inc. All rights reserved.
//

#ifndef Geetrip_DefineMethodHeader_h
#define Geetrip_DefineMethodHeader_h

#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height
#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

#endif
