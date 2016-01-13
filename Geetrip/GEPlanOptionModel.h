//
//  GEPlanOptionModel.h
//  Geetrip
//
//  Created by chengfeng on 16/1/12.
//  Copyright © 2016年 Geetrip Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GEPlanOptionModel : NSObject

@property (nonatomic,strong) NSString *tagimg;
@property (nonatomic,strong) NSString *name;
@property (nonatomic,strong) NSString *des;
@property (nonatomic,strong) NSString *acttype;
@property (nonatomic,strong) NSString *actid;
@property (nonatomic,strong) NSString *price;
@property (nonatomic,strong) NSString *canDelete;
@property (nonatomic,strong) NSString *logo;
@property (nonatomic,strong) NSArray *imgList;

+ (NSMutableArray *)getTestArray;

@end
