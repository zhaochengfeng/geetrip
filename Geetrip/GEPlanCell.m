//
//  GEPlanCell.m
//  Geetrip
//
//  Created by chengfeng on 15/12/28.
//  Copyright © 2015年 Geetrip Inc. All rights reserved.
//

#import "GEPlanCell.h"

@interface GEPlanCell ()

@property (nonatomic,strong) UILabel *titleLabel;
@property (nonatomic,strong) UIImageView *planImgView;
@property (nonatomic,strong) UIImageView *logoImageView;
@property (nonatomic,strong) UIView *priceBackView;
@property (nonatomic,strong) UILabel *priceLabel;
@property (nonatomic,strong) UILabel *noteLabel;
@property (nonatomic,strong) UILabel *dateLabel;

@end

@implementation GEPlanCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self loadSubViews];
    }
    
    return self;
}

- (void)loadSubViews
{
    CGFloat startPos = 15;
    CGFloat width = 25;
    self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(width, startPos, SCREEN_WIDTH - 2 *width, 20)];
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    self.titleLabel.font = [UIFont systemFontOfSize:15];
    [self.contentView addSubview:self.titleLabel];
    
    startPos += 20 + 15 + 20;
    
    CGFloat imgHeight = 130;
    if (SCREEN_WIDTH >= 414.0) {
        imgHeight = 180;
    }else if (SCREEN_WIDTH >= 375.0){
        imgHeight = 150;
    }
    
    self.planImgView = [[UIImageView alloc] initWithFrame:CGRectMake(width, startPos, SCREEN_WIDTH - 2 * width, imgHeight)];
    self.planImgView.contentMode = UIViewContentModeScaleAspectFill;
    self.planImgView.clipsToBounds = YES;
    [self.contentView addSubview:self.planImgView];

    self.logoImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 40, 40)];
    self.logoImageView.contentMode = UIViewContentModeScaleAspectFill;
    self.logoImageView.clipsToBounds = YES;
    self.logoImageView.layer.masksToBounds = YES;
    self.logoImageView.layer.cornerRadius = 6;
    self.logoImageView.layer.borderColor = [UIColor lightGrayColor].CGColor;
    self.logoImageView.layer.borderWidth = 1;
    self.logoImageView.center = CGPointMake(SCREEN_WIDTH/2.0, startPos);
    [self.contentView addSubview:self.logoImageView];
    
    self.priceBackView = [[UIView alloc] initWithFrame:CGRectMake(0, 90, 80, 25)];
    self.priceBackView.backgroundColor = [UIColor blackColor];
    self.priceBackView.alpha = 0.7;
    [self.planImgView addSubview:self.priceBackView];
    
    self.priceLabel = [[UILabel alloc] initWithFrame:CGRectMake(5, 90, 70, 25)];
    self.priceLabel.font = [UIFont systemFontOfSize:20];
    self.priceLabel.textColor = [UIColor whiteColor];
    [self.planImgView addSubview:self.priceLabel];
    
    startPos += imgHeight + 10;
    
    self.noteLabel = [[UILabel alloc] initWithFrame:CGRectMake(width, startPos, SCREEN_WIDTH - 2 * width, 20)];
    self.noteLabel.font = [UIFont boldSystemFontOfSize:15];
    [self.contentView addSubview:self.noteLabel];
    
    startPos += 25;
    
    self.dateLabel = [[UILabel alloc] initWithFrame:CGRectMake(width, startPos, SCREEN_WIDTH - 2 * width, 20)];
    self.dateLabel.font = [UIFont systemFontOfSize:13];
    self.dateLabel.textColor = [UIColor grayColor];
    [self.contentView addSubview:self.dateLabel];
}

- (void)setModel:(PlanModel *)model
{
    _model = model;
    self.titleLabel.text = model.title;
    [self.logoImageView sd_setImageWithURL:[NSURL URLWithString:model.logo]];
    [self.planImgView sd_setImageWithURL:[NSURL URLWithString:model.img]];
    self.noteLabel.text = model.detail;
    self.dateLabel.text = model.intro;
    
    self.priceLabel.text = [NSString stringWithFormat:@"￥%@",model.priceMark];
    NSDictionary *dict=[NSDictionary dictionaryWithObjectsAndKeys:self.priceLabel.font,NSFontAttributeName, nil];
    CGFloat width = [self.priceLabel.text boundingRectWithSize:CGSizeMake(CGFLOAT_MAX, self.priceLabel.frame.size.height) options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:dict context:NULL].size.width;
    self.priceBackView.frame = CGRectMake(0, self.priceBackView.frame.origin.y, width + 10, self.priceBackView.frame.size.height);
    self.priceLabel.frame = CGRectMake(5, self.priceLabel.frame.origin.y, width, self.priceLabel.frame.size.height);
}

+ (CGFloat)getCellHeight
{
    CGFloat startPos = 15;
    startPos += 55;
    
    CGFloat imgHeight = 130;
    if (SCREEN_WIDTH >= 414.0) {
        imgHeight = 180;
    }else if (SCREEN_WIDTH >= 375.0){
        imgHeight = 150;
    }
    
    startPos += imgHeight;
    startPos += 60;
    return startPos;
}

@end
