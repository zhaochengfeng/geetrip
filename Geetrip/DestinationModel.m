//
//  DestinationModel.m
//  Geetrip
//
//  Created by addinghome on 16/1/13.
//  Copyright © 2016年 Geetrip Inc. All rights reserved.
//

#import "DestinationModel.h"

@implementation DestinationModel

- (id)initWithDic:(NSDictionary *)subDic
{
    self = [super init];
    if (self) {
        _name = [subDic objectForKey:@"name"];
        _english_name = [subDic objectForKey:@"english_name"];
        _nationalFlag = [self getFlagImgUrlWithCountry:_english_name];
        _countryId = [subDic objectForKey:@"id"];
        
        _child_destinations = [NSMutableArray array];
        
        NSArray *subDicArray = [subDic objectForKey:@"child_destinations"];
        if ([subDicArray isKindOfClass:[NSArray class]] && subDicArray.count != 0) {
            for (NSDictionary *childDic in subDicArray) {
                DestinationChildModel *childModel = [[DestinationChildModel alloc] initWithDic:childDic];
                [_child_destinations addObject:childModel];
            }
            
            NSArray *sortDescriptors = [NSArray arrayWithObject:[NSSortDescriptor sortDescriptorWithKey:@"english_name" ascending:YES]];
            [_child_destinations sortedArrayUsingDescriptors:sortDescriptors];
        }
        
    }
    
    return self;
}

+ (NSMutableArray *)getSortedDataArrayWithResponseObject:(id)responseObject
{
    NSMutableArray *array = [NSMutableArray array];
    for (NSDictionary *subDic in responseObject) {
        DestinationModel *model = [[DestinationModel alloc] initWithDic:subDic];
        [array addObject:model];
    }
    NSArray *sortDescriptors = [NSArray arrayWithObject:[NSSortDescriptor sortDescriptorWithKey:@"english_name" ascending:YES]];
    [array sortedArrayUsingDescriptors:sortDescriptors];
    
    return array;
}

//获取国家的旗帜url
- (NSString *)getFlagImgUrlWithCountry:(NSString *)country
{
    NSString *str1 = [country stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    NSString *strUrl = [str1 stringByReplacingOccurrencesOfString:@" " withString:@"-"];
    return [NSString stringWithFormat:@"http://geetrip.cn/flags/%@.png",strUrl];
}

@end
