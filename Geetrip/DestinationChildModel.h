//
//  DestinationChildModel.h
//  Geetrip
//
//  Created by addinghome on 16/1/13.
//  Copyright © 2016年 Geetrip Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DestinationChildModel : NSObject

@property (nonatomic,strong)NSString *english_name;
@property (nonatomic,strong) NSString *childId;
@property (nonatomic,strong)NSString *name;

- (id)initWithDic:(NSDictionary *)childDic;

@end
