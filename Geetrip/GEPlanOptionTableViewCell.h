//
//  GEPlanOptionTableViewCell.h
//  Geetrip
//
//  Created by chengfeng on 16/1/12.
//  Copyright © 2016年 Geetrip Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GEPlanOptionModel.h"
@interface GEPlanOptionTableViewCell : UITableViewCell

@property (nonatomic,strong) GEPlanOptionModel *model;

+ (CGFloat)getCellHeightFromModel:(GEPlanOptionModel *)model;

@end
