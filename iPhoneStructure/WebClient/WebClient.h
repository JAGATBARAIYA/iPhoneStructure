//
//  WebClient.h
//  iPhoneStructure
//
//  Created by Marvin on 29/04/14.
//  Copyright (c) 2014 Marvin. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^WebClientCallbackSuccess)(NSDictionary *dictionary);
typedef void(^WebClientCallbackFailure)(NSError *error);

@interface WebClient : NSObject

//Shared Client method
+ (id)sharedClient;

@end
