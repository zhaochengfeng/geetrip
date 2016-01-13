//
//  PlanModel.h
//  Geetrip
//
//  Created by chengfeng on 15/10/18.
//  Copyright © 2015年 Geetrip Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PlanModel : NSObject

@property(nonatomic,strong) NSString *currencyMark;
@property(nonatomic,strong) NSString *destid;
@property(nonatomic,strong) NSString *destname;
@property(nonatomic,strong) NSString *img;
@property(nonatomic,strong) NSString *logo;
@property(nonatomic,strong) NSString *intro;
@property(nonatomic,strong) NSString *detail;
@property(nonatomic,strong) NSString *posx;
@property(nonatomic,strong) NSString *posy;
@property(nonatomic,strong) NSString *price;
@property(nonatomic,strong) NSString *tourdestid;
@property(nonatomic,strong) NSString *tourdestuuid;
@property(nonatomic,strong) NSString *tourid;

- (id)initWithPlanDic:(NSDictionary *)planDic;

@end
