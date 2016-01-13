//
//  ADImageViewCell.h
//  SingleBUltrasound
//
//  Created by chengfeng on 15/12/2.
//  Copyright © 2015年 Adding Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ActListModel.h"

#define Cell_height 70
#define Label_height 30
#define Cell_width 70

@interface ADImageViewCell : UITableViewCell

@property (nonatomic,strong) ActListModel *recordModel;

@end
