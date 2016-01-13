//
//  SearchModel.h
//  Geetrip
//
//  Created by addinghome on 16/1/13.
//  Copyright © 2016年 Geetrip Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SearchModel : NSObject

@property (nonatomic,strong) NSString *hotelName;
@property (nonatomic,strong) NSString *hotelId;

- (id)initWithDic:(NSDictionary *)dic;

@end
