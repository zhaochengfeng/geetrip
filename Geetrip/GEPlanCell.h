//
//  GEPlanCell.h
//  Geetrip
//
//  Created by chengfeng on 15/12/28.
//  Copyright © 2015年 Geetrip Inc. All rights reserved.
//

#import "ADTableViewCell.h"
#import "PlanModel.h"

@interface GEPlanCell : ADTableViewCell

@property (nonatomic,strong) PlanModel *model;

+ (CGFloat)getCellHeight;

@end
