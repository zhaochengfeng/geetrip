//
//  ADNavigationController.m
//  Geetrip
//
//  Created by chengfeng on 16/1/11.
//  Copyright © 2016年 Geetrip Inc. All rights reserved.
//

#import "ADNavigationController.h"

@implementation ADNavigationController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    }
    return self;
}

- (id)initWithRootViewController:(UIViewController *)rootViewController
{
    self = [super initWithRootViewController:rootViewController];
    if (self) {
    }
    
    return self;
}

-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if (self.tabBarController != nil) {
        self.tabBarController.tabBar.hidden = YES;
    }
    
    [super pushViewController:viewController animated:animated];
}

@end
