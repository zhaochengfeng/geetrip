//
//  GEAccountManager.m
//  Geetrip
//
//  Created by addinghome on 16/1/19.
//  Copyright © 2016年 Geetrip Inc. All rights reserved.
//

#import "GEAccountManager.h"

@implementation GEAccountManager

+ (void)loginWithLoginType:(LXMThirdLoginType)type return:(void (^)(void))onReturnBlcok success:(void (^)(void))successBlock failure:(void (^)(NSError *))failureBlock
{
    [[LXMThirdLoginManager sharedManager] requestLoginWithThirdType:type onReturnBlock:^{
        
    } completeBlock:^(LXMThirdLoginResult *thirdLoginResult) {
        if (thirdLoginResult != nil && thirdLoginResult.thirdLoginState == 0) {
            NSLog(@"成功,%@",thirdLoginResult.userName);
            
        }else{
            NSError *err = [[NSError alloc]initWithDomain:@"com.addinghome" code:404 userInfo:nil];
            failureBlock(err);
        }
    }];
}


+ (void)getUserInfoWithThirdLoginResult:(LXMThirdLoginManager *)manager
{
    
}

@end
