//
//  ADImageViewCell.m
//  SingleBUltrasound
//
//  Created by chengfeng on 15/12/2.
//  Copyright © 2015年 Adding Inc. All rights reserved.
//

#import "ADImageViewCell.h"

@interface ADImageViewCell ()

@property (nonatomic,strong) UIImageView *recordImageView;
@property (nonatomic,strong) UILabel *recodDateLabel;

@end

@implementation ADImageViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.contentView.transform = CGAffineTransformMakeRotation(M_PI/2);
        [self loadSubviews];
    }
    return self;
}

- (void)loadSubviews
{
    CGFloat imgWidth = Cell_height - Label_height - 10;
    _recordImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, imgWidth, imgWidth)];
    _recordImageView.contentMode = UIViewContentModeScaleAspectFill;
    _recordImageView.clipsToBounds = YES;
    _recordImageView.center = CGPointMake(Cell_width / 2.0, (Cell_height - Label_height) / 2.0 - 5);
    _recordImageView.userInteractionEnabled = NO;
    [self.contentView addSubview:_recordImageView];
    
    _recodDateLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, Cell_height - Label_height - 5, Cell_width, Label_height - 5)];
    _recodDateLabel.textAlignment = NSTextAlignmentCenter;
    _recodDateLabel.font = [UIFont systemFontOfSize:13];
    [self.contentView addSubview:_recodDateLabel];
}

- (void)setRecordModel:(ActListModel *)recordModel
{
    _recordModel = recordModel;
    [_recordImageView sd_setImageWithURL:[NSURL URLWithString:recordModel.imgUrlString] placeholderImage:nil options:SDWebImageRetryFailed completed:nil];
    
    self.recodDateLabel.text = recordModel.name;
}

@end
