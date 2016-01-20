//
//  GEUserViewController.m
//  Geetrip
//
//  Created by chengfeng on 16/1/12.
//  Copyright © 2016年 Geetrip Inc. All rights reserved.
//

#import "GEUserViewController.h"

@interface GEUserViewController ()

@end

@implementation GEUserViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"用户信息";
    
    UIButton *logoutButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 100, 40)];
    logoutButton.center = CGPointMake(SCREEN_WIDTH/2.0, SCREEN_HEIGHT/2.0);
    logoutButton.backgroundColor = [UIColor redColor];
    [logoutButton setTitle:@"退出" forState:UIControlStateNormal];
    [logoutButton addTarget:self action:@selector(logout) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:logoutButton];
}

- (void)logout
{
    [NSUserDefaults standardUserDefaults].userName = nil;
    [self.navigationController popToRootViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
