//
//  GEBaseViewController.m
//  Geetrip
//
//  Created by chengfeng on 15/7/12.
//  Copyright (c) 2015年 Geetrip Inc. All rights reserved.
//

#import "GEBaseViewController.h"

#define bar_image_tag 10700
#define bar_blurView_tag 10800

@interface GEBaseViewController ()

@property (nonatomic,strong) UIImageView *navBarHairlineImageView;

@end

@implementation GEBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    self.navBarHairlineImageView = [self findHairlineImageViewUnder:self.navigationController.navigationBar];
    self.view.backgroundColor = [UIColor whiteColor];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [UIView setAnimationsEnabled:YES];
}

- (void)setBarColorClear:(BOOL)clear
{
    if (clear) {
        self.navigationController.navigationBar.translucent = NO;
        [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
        self.navBarHairlineImageView.alpha = 0;
    }else{
        self.navigationController.navigationBar.translucent = YES;
        [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault];
        self.navBarHairlineImageView.alpha = 1;
    }
    
    UIView *navigationBarBackground;
    for(UIView *view in self.navigationController.navigationBar.subviews){
        NSString *str = NSStringFromClass(view.class);;
        if ([str isEqualToString:@"_UINavigationBarBackground"]) {
            navigationBarBackground = view;
            break;
        }
    }
    navigationBarBackground.backgroundColor = [UIColor clearColor];
}

- (UIImageView *)findHairlineImageViewUnder:(UIView *)view {
    if ([view isKindOfClass:UIImageView.class] && view.bounds.size.height <= 1.0) {
        return (UIImageView *)view;
    }
    for (UIView *subview in view.subviews) {
        UIImageView *imageView = [self findHairlineImageViewUnder:subview];
        if (imageView) {
            return imageView;
        }
    }
    return nil;
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
