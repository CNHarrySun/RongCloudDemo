//
//  UserService.m
//  RongCloudDemo
//
//  Created by 孙浩 on 2018/11/28.
//  Copyright © 2018 孙浩. All rights reserved.
//

#import "UserService.h"
#import <RongIMKit/RongIMKit.h>

@implementation UserService

- (instancetype)init{
    if (self = [super init]) {
        [RCIM sharedRCIM].userInfoDataSource = self;
        [RCIM sharedRCIM].groupInfoDataSource = self;
    }
    return self;
}

+ (UserService *)share {
    
    static UserService *userService = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        userService = [[[self class] alloc] init];
    });
    return userService;
}

- (BOOL)isLogin {
    return [[NSUserDefaults standardUserDefaults] objectForKey:@"isLogin"];
}

- (void)getUserInfoWithUserId:(NSString *)userId completion:(void (^)(RCUserInfo * _Nonnull))completion {
    for (RCUserInfo *userInfo in [self contacts]) {
        if ([userInfo.userId isEqualToString:userId]) {
            completion(userInfo);
        }
    }
}

- (void)getGroupInfoWithGroupId:(NSString *)groupId completion:(void (^)(RCGroup * _Nonnull))completion {
    for (RCGroup *group in [self groups]) {
        if ([group.groupId isEqualToString:groupId]) {
            completion(group);
        }
    }
}

- (NSArray *)groups {
    RCGroup *group1 = [[RCGroup alloc] initWithGroupId:@"123456" groupName:@"测试群组1" portraitUri:@"https://upload-images.jianshu.io/upload_images/1253108-86c3301deb4da960.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240"];
    RCGroup *group2 = [[RCGroup alloc] initWithGroupId:@"123457" groupName:@"测试群组2" portraitUri:@"https://upload-images.jianshu.io/upload_images/1253108-86c3301deb4da960.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240"];
    RCGroup *group3 = [[RCGroup alloc] initWithGroupId:@"123458" groupName:@"测试群组3" portraitUri:@"https://upload-images.jianshu.io/upload_images/1253108-86c3301deb4da960.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240"];
    return @[group1, group2, group3];
}

- (NSArray *)contacts {
    
    RCUserInfo *test1 = [[RCUserInfo alloc] initWithUserId:@"15510269373" name:@"测试1" portrait:@"https://upload-images.jianshu.io/upload_images/1253108-86c3301deb4da960.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240"];
    RCUserInfo *test2 = [[RCUserInfo alloc] initWithUserId:@"15510269374" name:@"测试2" portrait:@"https://upload-images.jianshu.io/upload_images/1253108-86c3301deb4da960.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240"];
    RCUserInfo *test3 = [[RCUserInfo alloc] initWithUserId:@"15510269375" name:@"测试3" portrait:@"https://upload-images.jianshu.io/upload_images/1253108-86c3301deb4da960.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240"];
    RCUserInfo *test4 = [[RCUserInfo alloc] initWithUserId:@"15510269376" name:@"测试4" portrait:@"https://upload-images.jianshu.io/upload_images/1253108-86c3301deb4da960.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240"];
    RCUserInfo *test5 = [[RCUserInfo alloc] initWithUserId:@"15510269377" name:@"测试5" portrait:@"https://upload-images.jianshu.io/upload_images/1253108-86c3301deb4da960.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240"];
    RCUserInfo *testHarrySun = [[RCUserInfo alloc] initWithUserId:@"15510269371" name:@"HarrySun" portrait:@"https://upload-images.jianshu.io/upload_images/1253108-86c3301deb4da960.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240"];
    RCUserInfo *test007 = [[RCUserInfo alloc] initWithUserId:@"15510269372" name:@"007" portrait:@"https://upload-images.jianshu.io/upload_images/1253108-86c3301deb4da960.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240"];
    
    return @[test1, test2, test3, test4, test5, testHarrySun, test007];
}

@end
