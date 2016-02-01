//
//  GEDetailVc.m
//  Geetrip
//
//  Created by chengfeng on 16/1/31.
//  Copyright © 2016年 Geetrip Inc. All rights reserved.
//

#import "GEDetailVc.h"
#import "GEPlanDetailNetworkHelp.h"

@interface GEDetailVc ()

@property (nonatomic,strong) UIView *firstStepView;
@property (nonatomic,strong) UIView *secondStepView;
@property (nonatomic,strong) UIView *thirdStepView;

@end

@implementation GEDetailVc

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"行程设计";
    self.view.backgroundColor = [UIColor backGrayColor];
    [self loadData];
}

- (void)loadData
{
    [GEPlanDetailNetworkHelp getPlanDetailWithPlanId:@"23" adult:1 child:0 airCity:@"95" success:^(id responseObject) {
        
//        NSLog(@"行程 %@",responseObject);
    } failure:^(NSError *error) {
        
    }];
    
    
}

- (void)loadFirstStep
{
    
}

- (void)loadSecondStep
{
    
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

@end
