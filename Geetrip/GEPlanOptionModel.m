//
//  GEPlanOptionModel.m
//  Geetrip
//
//  Created by chengfeng on 16/1/12.
//  Copyright © 2016年 Geetrip Inc. All rights reserved.
//

#import "GEPlanOptionModel.h"

@implementation GEPlanOptionModel

+ (NSMutableArray *)getTestArray
{
    NSMutableArray *array = [NSMutableArray array];
    
    GEPlanOptionModel *model1 = [[GEPlanOptionModel alloc] init];
    model1.name = @"法国航空北京日内瓦往返国际机票";
    model1.tagimg = @"flight";
    model1.des = @"经济舱 6 张,2位儿童";
    model1.logo = @"rc";
    model1.price = @"¥6,320";
    [array addObject:model1];
    
    GEPlanOptionModel *model2 = [[GEPlanOptionModel alloc] init];
    model2.name = @"卢浮宫,VIP参观通道,专业中文讲解";
    model2.tagimg = @"museum";
    model2.des = @"1个VIP团10人";
    model2.price = @"¥3,800";
    model2.logo = @"sl";
    model2.imgList = [NSArray arrayWithObjects:@"lv01.jpg",@"lv02.jpg",@"lv03.jpg", nil];
    [array addObject:model2];
    
    GEPlanOptionModel *model3 = [[GEPlanOptionModel alloc] init];
    model3.name = @"香榭丽舍大街";
    model3.tagimg = @"shopping";
    model3.des = @"自由购物";
    model3.price = @"¥0";
    model3.logo = @"sl";
    model3.imgList = [NSArray arrayWithObjects:@"ce_01.jpg", nil];
    [array addObject:model3];
    
    GEPlanOptionModel *model4 = [[GEPlanOptionModel alloc] init];
    model4.name = @"苏格兰狩猎主题旅行";
    model4.tagimg = @"hunter";
    model4.des = @"基本套餐";
    model4.price = @"¥12,800";
    model4.logo = @"sl";
    [array addObject:model4];
    
    GEPlanOptionModel *model5 = [[GEPlanOptionModel alloc] init];
    model5.name = @"法国航空北京日内瓦往返国际机票";
    model5.tagimg = @"museum";
    model5.des = @"经济舱 6 张,2位儿童";
    model5.price = @"¥6,320";
    model5.logo = @"sl";
    [array addObject:model5];
    
    GEPlanOptionModel *model6 = [[GEPlanOptionModel alloc] init];
    model6.name = @"法国航空北京日内瓦往返国际机票";
    model6.tagimg = @"museum";
    model6.des = @"经济舱 6 张,2位儿童";
    model6.logo = @"sl";
    model6.price = @"¥6,320";
    [array addObject:model6];
    
    GEPlanOptionModel *model7 = [[GEPlanOptionModel alloc] init];
    model7.name = @"法国航空北京日内瓦往返国际机票";
    model7.tagimg = @"museum";
    model7.des = @"经济舱 6 张,2位儿童";
    model7.logo = @"sl";
    model7.price = @"¥6,320";
    [array addObject:model7];
    
    return array;
}

@end

