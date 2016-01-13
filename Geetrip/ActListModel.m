//
//  ActListModel.m
//  Geetrip
//
//  Created by chengfeng on 15/10/18.
//  Copyright © 2015年 Geetrip Inc. All rights reserved.
//

#import "ActListModel.h"

@implementation ActListModel

- (id)initWithListDic:(NSDictionary *)dic
{
    self = [super init];
    if (self) {
        _imgUrlString = [dic objectForKey:@"img"];
        _name = [dic objectForKey:@"name"];
        _tourId = [NSString stringWithFormat:@"%@",[dic objectForKey:@"tourid"]];
        
    }
    
    return self;
}

@end
