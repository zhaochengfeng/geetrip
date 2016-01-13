//
//  DestinationChildModel.m
//  Geetrip
//
//  Created by addinghome on 16/1/13.
//  Copyright © 2016年 Geetrip Inc. All rights reserved.
//

#import "DestinationChildModel.h"

@implementation DestinationChildModel

- (id)initWithDic:(NSDictionary *)childDic
{
    self = [super init];
    if (self) {
        _name = [childDic objectForKey:@"name"];
        _english_name = [childDic objectForKey:@"english_name"];
        _childId = [childDic objectForKey:@"id"];
    }
    
    return self;
}

@end
