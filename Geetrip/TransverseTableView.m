//
//  TransverseTableView.m
//  SingleBUltrasound
//
//  Created by chengfeng on 15/12/2.
//  Copyright © 2015年 Adding Inc. All rights reserved.
//

#import "TransverseTableView.h"

@interface TransverseTableView ()<UITableViewDataSource,UITableViewDelegate>

@end

@implementation TransverseTableView

- (void)setFrame:(CGRect)frame
{
    [super setFrame:frame];
    if (self.myTableView == nil) {
        self.myTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, frame.size.height, frame.size.width) style:UITableViewStylePlain];
        self.myTableView.delegate = self;
        self.myTableView.dataSource = self;
        self.myTableView.showsVerticalScrollIndicator = NO;
        self.myTableView.showsHorizontalScrollIndicator = NO;
        self.myTableView.transform = CGAffineTransformMakeRotation(-M_PI / 2);
        [self addSubview:self.myTableView];
    }else{
        self.myTableView.frame = CGRectMake(0, 0, frame.size.height, frame.size.width);
    }
    self.myTableView.center = CGPointMake(frame.size.width/2.0, frame.size.height / 2.0);
}

- (void)setImageArray:(NSArray *)imageArray
{
//    NSLog(@"%@",imageArray);
    [self.myTableView setContentOffset:CGPointMake(0, 0)];
    _imageArray = imageArray;
//    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
//    [self.themeTableView.myTableView selectRowAtIndexPath:indexPath animated:YES scrollPosition:UITableViewScrollPositionTop];

    [self.myTableView reloadData];
}

#pragma mark - tableView 代理
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    //NSLog(@"需要加载的数量 %ld",self.imageArray.count);
    return self.imageArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *reuseableId = @"cellName";
    ADImageViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseableId];
    if (cell == nil) {
        cell = [[ADImageViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseableId];
    }
    
    cell.recordModel = [self.imageArray objectAtIndex:indexPath.row];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return Cell_width;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    ActListModel *model = [self.imageArray objectAtIndex:indexPath.row];
    if ([self.recordDelegate respondsToSelector:@selector(clickedRecordWithModel:)]) {
        [self.recordDelegate clickedRecordWithModel:model];
    }
}

@end
