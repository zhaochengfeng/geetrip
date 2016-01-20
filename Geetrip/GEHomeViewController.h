//
//  GeHomeViewController.h
//  Geetrip
//
//  Created by chengfeng on 15/7/12.
//  Copyright (c) 2015年 Geetrip Inc. All rights reserved.
//

#import "GEBaseViewController.h"
#import "ICSDrawerController.h"

@interface GEHomeViewController : GEBaseViewController<UIScrollViewDelegate,UISearchBarDelegate,ICSDrawerControllerChild, ICSDrawerControllerPresenting>

@property (nonatomic,weak) ICSDrawerController *drawer;

+ (GEHomeViewController *)defaultHomeManager;

- (void)cancelSarch;

@end
