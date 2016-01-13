//
//  ADTranTableView.m
//  Geetrip
//
//  Created by chengfeng on 15/12/28.
//  Copyright © 2015年 Geetrip Inc. All rights reserved.
//

#import "ADTranTableView.h"

@implementation ADTranTableView

- (id)initWithFrame:(CGRect)frame style:(UITableViewStyle)style
{
    self = [super initWithFrame:frame style:style];
    if (self) {
        [self setTranTableView];
    }
    
    return self;
}

- (id)init
{
    self = [super init];
    if (self) {
        [self setTranTableView];
    }
    
    return self;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setTranTableView];
    }
    return self;
}

- (void)setTranTableView
{
    self.transform = CGAffineTransformMakeRotation(-M_PI / 2);
}

@end
