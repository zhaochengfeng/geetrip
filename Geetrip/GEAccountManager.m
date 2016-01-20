//
//  GEAccountManager.m
//  Geetrip
//
//  Created by addinghome on 16/1/19.
//  Copyright © 2016年 Geetrip Inc. All rights reserved.
//

#import "GEAccountManager.h"

#define LinkToWechatUrlString @"https://geetrip.cn/api/beta/users/%@/binding_wechat"
#define UsersUrlString @"https://geetrip.cn/api/beta/users"
#define AuthenticateUrlString @"https://geetrip.cn/api/beta/users/authenticate"

@implementation GEAccountManager

+ (void)loginWithLoginType:(LXMThirdLoginType)type return:(void (^)(void))onReturnBlcok success:(void (^)(void))successBlock failure:(void (^)(NSError *))failureBlock
{
    [[LXMThirdLoginManager sharedManager] requestLoginWithThirdType:type onReturnBlock:^{
        
    } completeBlock:^(LXMThirdLoginResult *thirdLoginResult) {
        if (thirdLoginResult != nil && thirdLoginResult.thirdLoginState == 0) {
            NSLog(@"成功,%@",thirdLoginResult.userName);
            [NSUserDefaults standardUserDefaults].userName = thirdLoginResult.userName;
            if (successBlock) {
                successBlock();
            }
            
        }else{
            if (failureBlock) {
                NSError *err = [[NSError alloc]initWithDomain:@"com.addinghome" code:404 userInfo:nil];
                failureBlock(err);
            }
        }
    }];
}

+ (void)connectWeiXinWithLoginType:(LXMThirdLoginType)type return:(void (^)(void))onReturnBlcok success:(void (^)(void))successBlock failure:(void (^)(NSError *))failureBlock
{
    [[LXMThirdLoginManager sharedManager] requestLoginWithThirdType:type onReturnBlock:^{
        
    } completeBlock:^(LXMThirdLoginResult *thirdLoginResult) {
        if (thirdLoginResult != nil && thirdLoginResult.thirdLoginState == 0) {
            NSString *userId = @"id";
            NSMutableDictionary *params = [NSMutableDictionary dictionary];
            [params setObject:userId forKey:@"id"];
            [params setObject:thirdLoginResult.unionid forKey:@"wechat_user_id"];
      
            NSString *url = [NSString stringWithFormat:LinkToWechatUrlString,userId];
            
            [[GEBaseNetwork securityManager] PATCH:url parameters:params success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                
            }];

        }else{
            
        }
    }];
}

- (void)checkWeiXinUserWithParameters:(NSDictionary *)params success:(void (^)(void))success noUser:(void (^)(void))noUserBlock failure:(void (^)(NSError *error))failure
{
    [[GEBaseNetwork securityManager] GET:UsersUrlString parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];
}

//- (void)authenticate

@end
