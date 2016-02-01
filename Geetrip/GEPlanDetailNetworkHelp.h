//
//  GEPlanDetailNetworkHelp.h
//  Geetrip
//
//  Created by addinghome on 16/1/15.
//  Copyright © 2016年 Geetrip Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GEPlanDetailNetworkHelp : NSObject

+ (NSURLSessionDataTask *)getPlanDetailWithPlanId:(NSString *)planId adult:(NSInteger)adult child:(NSInteger)child airCity:(NSString *)airCity success:(void (^)(id responseObject))successBlock failure:(void (^)(NSError *error))failureBlock;

@end
