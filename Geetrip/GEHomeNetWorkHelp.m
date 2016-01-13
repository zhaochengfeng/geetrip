//
//  GEHomeNetWorkHelp.m
//  Geetrip
//
//  Created by chengfeng on 15/10/18.
//  Copyright © 2015年 Geetrip Inc. All rights reserved.
//

#import "GEHomeNetWorkHelp.h"

//搜索页面接口
#define SearchUrlString @"https://geetrip.cn/api/beta1/properties/search"
#define SearchDestinationsUrlString @"https://geetrip.cn/api/beta/destinations"


@implementation GEHomeNetWorkHelp

+ (NSURLSessionDataTask *)getActListSuccess:(void (^)(id))successBlock failure:(void (^)(NSError *))failureBlock
{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html", nil];
    return [manager GET:@"http://api.geetrip.com/trip/app/actlist" parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (successBlock) {
            successBlock(responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (failureBlock) {
            failureBlock(error);
        }
    }];
}

+ (NSURLSessionDataTask *)getPlanWithTourId:(NSString *)tourId success:(void (^)(id))successBlock failure:(void (^)(NSError *))failureBlock
{
    NSString *urlString = [NSString stringWithFormat:@"http://api.geetrip.com/trip/app/destlist/%@",tourId];
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html", nil];
   return [manager GET:urlString parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (successBlock) {
            successBlock(responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (failureBlock) {
            failureBlock(error);
        }
    }];
}

+ (NSURLSessionDataTask *)getSearchContentWithKeyword:(NSString *)keyword success:(void (^)(id))successBlock failure:(void (^)(NSError *))failureBlock
{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager.requestSerializer setAuthorizationHeaderFieldWithUsername:@"DtcwG8mfX9A" password:@"gZVxwBaOFdoohyd3"];
    AFSecurityPolicy *policy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeNone];
    [policy setValidatesDomainName:NO];
    [policy setAllowInvalidCertificates:YES];
    manager.securityPolicy = policy;
    
    NSDictionary *parameters = [NSDictionary dictionaryWithObjectsAndKeys:keyword,@"keyword", nil];
    
    return [manager GET:SearchUrlString parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        //NSLog(@"%@",responseObject);
        if ([responseObject isKindOfClass:[NSDictionary class]]) {
            failureBlock(nil);
        }else{
            if (successBlock) {
                successBlock(responseObject);
            }
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@",error);
        if (failureBlock) {
            failureBlock(error);
        }
    }];
}

+ (NSURLSessionDataTask *)getDestinationsSuccess:(void (^)(id))successBlock failure:(void (^)(NSError *))failureBlock
{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager.requestSerializer setAuthorizationHeaderFieldWithUsername:@"DtcwG8mfX9A" password:@"gZVxwBaOFdoohyd3"];
    AFSecurityPolicy *policy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeNone];
    [policy setValidatesDomainName:NO];
    [policy setAllowInvalidCertificates:YES];
    manager.securityPolicy = policy;
    
//    NSDictionary *parameters = [NSDictionary dictionaryWithObjectsAndKeys:keyword,@"keyword", nil];
    
    return [manager GET:SearchDestinationsUrlString parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        //NSLog(@"%@",responseObject);
        if ([responseObject isKindOfClass:[NSDictionary class]]) {
            failureBlock(nil);
        }else{
            if (successBlock) {
                successBlock(responseObject);
            }
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@",error);
        if (failureBlock) {
            failureBlock(error);
        }
    }];
}

@end
