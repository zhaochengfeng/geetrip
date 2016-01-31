//
//  GEGoNowView.m
//  Geetrip
//
//  Created by chengfeng on 16/1/30.
//  Copyright © 2016年 Geetrip Inc. All rights reserved.
//

#import "GEGoNowView.h"

@interface GEGoNowView ()

@property(nonatomic,strong) UIImageView *backImageView;
@property(nonatomic,strong) UIImageView *nationFlagImageView;

@end

@implementation GEGoNowView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self loadSubViews];
    }

    return self;
}

- (void)loadSubViews
{
    self.backImageView = [[UIImageView alloc] initWithFrame:self.frame];
    self.backImageView.center = CGPointMake(self.frame.size.width/2.0, self.frame.size.height/2.0);
    self.backImageView.image = [UIImage imageNamed:@"goNow"];
    [self addSubview:self.backImageView];
    
    CGFloat height = self.frame.size.height - 22;
    self.nationFlagImageView = [[UIImageView alloc] initWithFrame:CGRectMake(5, 5, height*1.5, height)];
    self.nationFlagImageView.backgroundColor = [UIColor whiteColor];
    [self addSubview:self.nationFlagImageView];
}

- (void)setNationFlag:(NSString *)nationFlag
{
    _nationFlag = nationFlag;
    [self.nationFlagImageView sd_setImageWithURL:[NSURL URLWithString:nationFlag]];
}

@end
