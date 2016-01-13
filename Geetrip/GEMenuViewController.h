//
//  GEMenuViewController.h
//  Geetrip
//
//  Created by chengfeng on 16/1/11.
//  Copyright © 2016年 Geetrip Inc. All rights reserved.
//

#import "GEBaseViewController.h"
#import "ICSDrawerController.h"

@interface GEMenuViewController : GEBaseViewController<ICSDrawerControllerChild,ICSDrawerControllerPresenting>

@property (nonatomic,weak) ICSDrawerController *drawer;

@end
