//
//  GEPlanDetailNetworkHelp.m
//  Geetrip
//
//  Created by addinghome on 16/1/15.
//  Copyright © 2016年 Geetrip Inc. All rights reserved.
//

#import "GEPlanDetailNetworkHelp.h"

#define PlanDetailUrl @"http://api.geetrip.com/trip/app/planoption/%@"

@implementation GEPlanDetailNetworkHelp

+ (NSURLSessionDataTask *)getPlanDetailWithPlanId:(NSString *)planId success:(void (^)(id))successBlock failure:(void (^)(NSError *))failureBlock
{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    return [manager GET:[NSString stringWithFormat:PlanDetailUrl,planId] parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"%@",responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@",error);
    }];
}

@end
