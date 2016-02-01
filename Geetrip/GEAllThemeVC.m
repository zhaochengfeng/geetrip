//
//  GEAllThemeVC.m
//  Geetrip
//
//  Created by chengfeng on 16/1/30.
//  Copyright © 2016年 Geetrip Inc. All rights reserved.
//

#import "GEAllThemeVC.h"

@implementation GEAllThemeVC

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"全部主题";
    [self setLeftNavBarWithTitle:@"关闭"];
    self.view.backgroundColor = [UIColor backGrayColor];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)leftBarClicked
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
