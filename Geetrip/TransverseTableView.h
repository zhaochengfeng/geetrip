//
//  TransverseTableView.h
//  SingleBUltrasound
//
//  Created by chengfeng on 15/12/2.
//  Copyright © 2015年 Adding Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ADImageViewCell.h"

@protocol ADRecordDelegate <NSObject>

- (void)clickedRecordWithModel:(ActListModel *)model;

@end

@interface TransverseTableView : UIView

@property (nonatomic,strong) NSArray *imageArray;
@property (nonatomic ,strong) UITableView *myTableView;
@property (nonatomic,assign) id <ADRecordDelegate> recordDelegate;


@end
