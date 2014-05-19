//
//  WebClient.m
//  iPhoneStructure
//
//  Created by Marvin on 29/04/14.
//  Copyright (c) 2014 Marvin. All rights reserved.
//

#import "WebClient.h"
#import "NSString+extras.h"
#import "Loader.h"
#import "Common.h"
#import "WebKit.h"
#import "Messages.h"
#import "TKAlertCenter.h"
#import "AppDelegate.h"

@interface WebClient()

@end

@implementation WebClient

#pragma mark - Shared Client

+ (id)sharedClient {
    static WebClient *sharedClient = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedClient = [[self alloc] init];
    });
    return sharedClient;
}

#pragma mark - Get generic Path

- (void)getAtPath:(NSString *)path withParams:(NSDictionary *)params :(void(^)(id jsonData))onComplete failure:(void (^)(NSError *error))failure {
    [[Loader defaultLoader] displayLoadingView:msgLoading];
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    [manager POST:path parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSError *error= nil;
        if(responseObject){
            NSDictionary *json = [NSJSONSerialization JSONObjectWithData:(NSData *)responseObject options:kNilOptions error:&error];
            if (error){
                NSLog(@"JSON parsing error in %@", NSStringFromSelector(_cmd));
                [[Loader defaultLoader] hideLoadingView];
                failure(error);
            } else {
                [[Loader defaultLoader] hideLoadingView];
                onComplete(json);
            }
        }else{
            [[Loader defaultLoader] hideLoadingView];
            onComplete(nil);
            return;
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"request failed %@ (%li)", operation.request.URL, (long)operation.response.statusCode);
        [[Loader defaultLoader] hideLoadingView];
        failure(error);
    }];
}

#pragma mark - Login Call

- (void)loginIntoApplication:(NSDictionary *)params success:(WebClientCallbackSuccess)success failure:(WebClientCallbackFailure)failure{
    [self getAtPath:[kUserLogin fullPath] withParams:params:^(id jsonData) {
        success((NSDictionary*)jsonData);
    } failure:^(NSError *error) {
        failure(error);
    }];
}

#pragma mark - Forgot Password Call

- (void)forgotPassword:(NSDictionary *)params success:(WebClientCallbackSuccess)success failure:(WebClientCallbackFailure)failure{
    [self getAtPath:[kForgotPassword fullPath] withParams:params:^(id jsonData) {
        success((NSDictionary*)jsonData);
    } failure:^(NSError *error) {
        failure(error);
    }];
}

@end
