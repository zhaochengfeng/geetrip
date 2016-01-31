//
//  GENationView.m
//  Geetrip
//
//  Created by chengfeng on 16/1/30.
//  Copyright © 2016年 Geetrip Inc. All rights reserved.
//

#import "GENationView.h"

@implementation GENationView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.layer.cornerRadius = frame.size.width/2.0;
        self.layer.masksToBounds = YES;
        self.backgroundColor = [UIColor grayColor];
    }
    
    return self;
}

@end
