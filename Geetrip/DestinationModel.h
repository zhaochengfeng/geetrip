//
//  DestinationModel.h
//  Geetrip
//
//  Created by addinghome on 16/1/13.
//  Copyright © 2016年 Geetrip Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DestinationChildModel.h"

@interface DestinationModel : NSObject

@property (nonatomic,strong) NSString *english_name;
@property (nonatomic,strong) NSString *countryId;
@property (nonatomic,strong) NSString *name;
@property (nonatomic,strong) NSString *nationalFlag;
@property (nonatomic,strong) NSMutableArray *child_destinations;

- (id)initWithDic:(NSDictionary *)subDic;

+ (NSMutableArray *)getSortedDataArrayWithResponseObject:(id)responseObject;

@end
