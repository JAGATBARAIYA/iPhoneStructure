//
//  Common.h
//  FlipIn
//
//  Created by Marvin on 20/11/13.
//  Copyright (c) 2013 Marvin. All rights reserved.
//

#ifndef iPhoneStructure_Common_h
#define iPhoneStructure_Common_h

#define isiPhone5                       (fabs((double)[[UIScreen mainScreen] bounds].size.height - (double)568) < DBL_EPSILON)
#define appDelegate                     ((AppDelegate *)[[UIApplication sharedApplication] delegate])
#define kUserDirectoryPath              NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)
#define IS_IOS7_OR_GREATER              [[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0f ? YES : NO
#define PLAYER                          [MPMusicPlayerController iPodMusicPlayer]

#define kRandomPasswordString           @"0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz"

#define DegreesToRadians(degrees)       (degrees * M_PI / 180)
#define RadiansToDegrees(radians)       (radians * 180/M_PI)

#define kGeoCodingString                @"http://maps.google.com/maps/geo?q=%f,%f&output=csv"
#define kNotificationMessage            @"Notification Message."
#define kRemindMeNotificationDataKey    @"kRemindMeNotificationDataKey"

#define kDateFormat                     @"yyyy-MM-dd"

#endif
