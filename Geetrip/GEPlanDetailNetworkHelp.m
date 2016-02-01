//
//  GEPlanDetailNetworkHelp.m
//  Geetrip
//
//  Created by addinghome on 16/1/15.
//  Copyright © 2016年 Geetrip Inc. All rights reserved.
//

#import "GEPlanDetailNetworkHelp.h"

#define PlanDetailUrl @"http://api.geetrip.com/trip/app/planoption/%@/%ld/%ld/%@"

@implementation GEPlanDetailNetworkHelp

+ (NSURLSessionDataTask *)getPlanDetailWithPlanId:(NSString *)planId adult:(NSInteger)adult child:(NSInteger)child airCity:(NSString *)airCity success:(void (^)(id responseObject))successBlock failure:(void (^)(NSError *error))failureBlock
{
    AFHTTPSessionManager *manager = [GEBaseNetwork manager];
    NSString *urlString = [NSString stringWithFormat:PlanDetailUrl,planId,(long)adult,(long)child,airCity];
//    NSLog(@"...... %@",urlString);
    return [manager GET:urlString parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (successBlock) {
            successBlock(responseObject);
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@",error);
        if (failureBlock) {
            failureBlock(error);
        }
    }];
}

@end
