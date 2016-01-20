//
//  NSUserDefaults+UserInfo.m
//  Geetrip
//
//  Created by addinghome on 16/1/20.
//  Copyright © 2016年 Geetrip Inc. All rights reserved.
//

#import "NSUserDefaults+UserInfo.h"

static NSString *userNameKey = @"UserNameKey";

@implementation NSUserDefaults (UserInfo)

- (void)setUserName:(NSString *)userName
{
    [self setObject:userName forKey:userNameKey];
    [self synchronize];
}

- (NSString *)userName
{
    return [self objectForKey:userNameKey];
}

@end
