//
//  ActListModel.h
//  Geetrip
//
//  Created by chengfeng on 15/10/18.
//  Copyright © 2015年 Geetrip Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ActListModel : NSObject

@property(nonatomic,strong) NSString *imgUrlString;

@property(nonatomic,strong) NSString *name;

@property(nonatomic,strong) NSString *tourId;

- (id)initWithListDic:(NSDictionary *)dic;

@end
