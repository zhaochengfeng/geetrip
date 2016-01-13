//
//  SearchModel.m
//  Geetrip
//
//  Created by addinghome on 16/1/13.
//  Copyright © 2016年 Geetrip Inc. All rights reserved.
//

#import "SearchModel.h"

@implementation SearchModel

- (id)initWithDic:(NSDictionary *)dic
{
    self = [super init];
    if (self) {
        _hotelName = [dic objectForKey:@"name"];
        _hotelId = [dic objectForKey:@"code"];
    }
    
    return self;
}

@end
