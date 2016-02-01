//
//  PlanModel.m
//  Geetrip
//
//  Created by chengfeng on 15/10/18.
//  Copyright © 2015年 Geetrip Inc. All rights reserved.
//

#import "PlanModel.h"

@implementation PlanModel

- (id)initWithPlanDic:(NSDictionary *)planDic
{
    self = [super init];
    if (self) {
        _currencyMark = [planDic objectForKey:@"currencyMark"];
        _destid = [planDic objectForKey:@"destid"];
        _destname = [planDic objectForKey:@"destname"];
        _detail = [planDic objectForKey:@"detail"];
        _img = [planDic objectForKey:@"img"];
        _logo = [planDic objectForKey:@"logo"];
        _intro = [planDic objectForKey:@"intro"];
        _posx = [planDic objectForKey:@"posx"];
        _posy = [planDic objectForKey:@"posy"];
        _price = [planDic objectForKey:@"price"];
        _tourdestid = [planDic objectForKey:@"tourdestid"];
        _tourdestuuid = [planDic objectForKey:@"tourdestuuid"];
        _tourid = [planDic objectForKey:@"tourid"];
        _title = [planDic objectForKey:@"title"];
        _priceMark = [planDic objectForKey:@"priceMark"];
        _aircity = [NSString stringWithFormat:@"%@",[planDic objectForKey:@"aircity"]];
        _startinfo = [planDic objectForKey:@"startinfo"];
    }
    
    return self;
}

@end
