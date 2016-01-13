//
//  ViewController.m
//  Geetrip
//
//  Created by chengfeng on 15/7/12.
//  Copyright (c) 2015年 Geetrip Inc. All rights reserved.
//

#import "ViewController.h"

#define len 60.0
#define shapSpace  -14

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor whiteColor];
    for (int j = 0; j < 10; j ++) {
        for (int i = 0; i < 10; i ++) {
            UIImageView *view = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, len, len)];
            view.center = CGPointMake(j % 2 * (len + shapSpace) / 2.0 + (len + shapSpace) * i, 10 + (len + shapSpace - 5) * j);
            view.layer.cornerRadius =  len / 2.0;
            view.layer.masksToBounds = YES;
            view.image = [UIImage imageNamed:@"六边形"];
            [self.view addSubview:view];

            UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 42, 42)];
            button.center = CGPointMake(len/ 2.0, len / 2.0);
            button.layer.cornerRadius = button.frame.size.width / 2.0;
            button.layer.masksToBounds = YES;
            button.backgroundColor = [UIColor redColor];
            [view addSubview:button];
        }
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
