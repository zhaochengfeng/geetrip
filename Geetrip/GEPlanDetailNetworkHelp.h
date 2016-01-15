//
//  GEPlanDetailNetworkHelp.h
//  Geetrip
//
//  Created by addinghome on 16/1/15.
//  Copyright © 2016年 Geetrip Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GEPlanDetailNetworkHelp : NSObject

+ (NSURLSessionDataTask *)getPlanDetailWithPlanId:(NSString *)planId success:(void (^)(id responseOnject))successBlock failure:(void (^)(NSError *error))failureBlock;

@end
