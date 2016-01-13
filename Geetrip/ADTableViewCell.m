//
//  ADTableViewCell.m
//  Geetrip
//
//  Created by chengfeng on 15/12/28.
//  Copyright © 2015年 Geetrip Inc. All rights reserved.
//

#import "ADTableViewCell.h"

@implementation ADTableViewCell

- (id)init
{
    self = [super init];
    if (self) {
        [self setCellTran];
    }
    
    return self;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setCellTran];
    }
    
    return self;
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setCellTran];
    }
    
    return self;
}

- (void)setCellTran
{
    self.contentView.transform = CGAffineTransformMakeRotation(M_PI/2);
}

@end
