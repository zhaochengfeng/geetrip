//
//  GEPlanOptionTableViewCell.m
//  Geetrip
//
//  Created by chengfeng on 16/1/12.
//  Copyright © 2016年 Geetrip Inc. All rights reserved.
//

#import "GEPlanOptionTableViewCell.h"

@interface GEPlanOptionTableViewCell ()

@property(nonatomic,strong) UIImageView *tagImageView;
@property(nonatomic,strong) UIImageView *logoImageView;
@property(nonatomic,strong) UILabel *nameLabel;
@property(nonatomic,strong) UILabel *desLabel;
@property(nonatomic,strong) UILabel *priceLabel;
@property(nonatomic,strong) UIView *imgContentView;
@property(nonatomic,strong) UIImageView *imageView1, *imageView2, *imageView3;

@end

@implementation GEPlanOptionTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

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
    CGFloat edge = 14;
    CGFloat startPosX = edge;
    
    self.tagImageView = [[UIImageView alloc] initWithFrame:CGRectMake(startPosX, 8, 22, 22)];
    self.tagImageView.backgroundColor = [UIColor lightGrayColor];
    self.tagImageView.contentMode = UIViewContentModeScaleAspectFill;
    self.tagImageView.layer.masksToBounds = YES;
    self.tagImageView.layer.cornerRadius = self.tagImageView.frame.size.width/2.0;
    [self addSubview:self.tagImageView];
    
    CGFloat logoWidth = 65;
    
    startPosX += self.tagImageView.frame.size.width + 10;
    self.logoImageView = [[UIImageView alloc] initWithFrame:CGRectMake(startPosX, 8, logoWidth, logoWidth)];
    self.logoImageView.backgroundColor = [UIColor lightGrayColor];
    self.logoImageView.layer.masksToBounds = YES;
    self.logoImageView.layer.cornerRadius = 6;
    self.logoImageView.layer.borderColor = [UIColor grayColor].CGColor;
    self.logoImageView.layer.borderWidth = 0.5;
    [self addSubview:self.logoImageView];

    startPosX += logoWidth + 10;
    self.nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(startPosX, 8 + 5, SCREEN_WIDTH - 120 - 60, logoWidth/2.0 - 5)];
    self.nameLabel.font = [UIFont systemFontOfSize:15];
    [self addSubview:self.nameLabel];
    
    self.desLabel = [[UILabel alloc] initWithFrame:CGRectMake(startPosX, 8 + logoWidth/2.0, SCREEN_WIDTH - 120 - 100, logoWidth/2.0)];
    self.desLabel.font = [UIFont systemFontOfSize:13];
    self.desLabel.textColor = [UIColor grayColor];
    [self addSubview:self.desLabel];
    
    self.priceLabel = [[UILabel alloc] initWithFrame:CGRectMake(SCREEN_WIDTH - 100, 8 + logoWidth/2.0, 100 - edge, logoWidth/2.0 - 5)];
    self.priceLabel.font = [UIFont systemFontOfSize:14];
    self.priceLabel.textAlignment = NSTextAlignmentRight;
    self.priceLabel.textColor = [UIColor grayColor];
    [self addSubview:self.priceLabel];
    
    CGFloat width = (SCREEN_WIDTH - self.nameLabel.frame.origin.x - edge * 3) / 3.0;
    
    self.imgContentView = [[UIView alloc] initWithFrame:CGRectMake(self.nameLabel.frame.origin.x, 8 + logoWidth + 10, SCREEN_WIDTH - self.nameLabel.frame.origin.x - edge, width)];
    [self addSubview:self.imgContentView];
    
    self.imageView1 = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, width, width)];
    self.imageView1.contentMode = UIViewContentModeScaleAspectFill;
    self.imageView1.clipsToBounds = YES;
    self.imageView1.backgroundColor = [UIColor lightGrayColor];
    [self.imgContentView addSubview:self.imageView1];
    
    self.imageView2 = [[UIImageView alloc] initWithFrame:CGRectMake(width + edge, 0, width, width)];
    self.imageView2.contentMode = UIViewContentModeScaleAspectFill;
    self.imageView2.clipsToBounds = YES;
    self.imageView2.backgroundColor = [UIColor lightGrayColor];
    [self.imgContentView addSubview:self.imageView2];
    
    self.imageView3 = [[UIImageView alloc] initWithFrame:CGRectMake((width + edge)*2.0, 0, width, width)];
    self.imageView3.contentMode = UIViewContentModeScaleAspectFill;
    self.imageView3.backgroundColor = [UIColor lightGrayColor];
    self.imageView3.clipsToBounds = YES;
    [self.imgContentView addSubview:self.imageView3];
}

+ (CGFloat)getCellHeightFromModel:(GEPlanOptionModel *)model
{
    if (model.imgList.count != 0) {
        CGFloat nameStartX = 14 + 65 + 10 + 22 + 10;
        CGFloat width = (SCREEN_WIDTH - nameStartX - 14 * 3) / 3.0;
        return 8 + 75 + 10 + 20 + width;
    }
    return 8 + 75 + 10;
}

- (void)setModel:(GEPlanOptionModel *)model
{
    _model = model;
    self.nameLabel.text = model.name;
    self.desLabel.text = model.des;
    self.priceLabel.text = model.price;
    self.tagImageView.image = [UIImage imageNamed:model.tagimg];
    self.logoImageView.image = [UIImage imageNamed:model.logo];
    
    if (model.imgList.count == 0) {
        self.imgContentView.alpha = 0;
    }else{
        self.imgContentView.alpha = 1;
        NSString *imgName = [model.imgList objectAtIndex:0];
        self.imageView1.image = [UIImage imageNamed:imgName];
        if (model.imgList.count >= 2) {
            NSString *name = [model.imgList objectAtIndex:1];
            self.imageView2.image = [UIImage imageNamed:name];
            self.imageView2.alpha = 1;
        }else{
            self.imageView2.image = nil;
            self.imageView2.alpha = 0;
        }
        
        if (model.imgList.count >= 3) {
            NSString *name = [model.imgList objectAtIndex:2];
            self.imageView3.image = [UIImage imageNamed:name];
            self.imageView3.alpha = 1;
        }else{
            self.imageView3.image = nil;
            self.imageView3.alpha = 0;
        }
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
