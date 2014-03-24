//
//  defines.h
//  kabbalahquiz
//
//  Created by Rockstar. on 3/11/14.
//  Copyright (c) 2014 Bnei Baruch USA. All rights reserved.
//

#import <Foundation/Foundation.h>

#ifndef DEFINES
#define DEFINES (!DEBUG && !TARGET_IPHONE_SIMULATOR)

#if !TARGET_IPHONE_SIMULATOR
#define BB_PRODUCTION_MODE 1
#endif

#define kCDKLocalyticsKey @"ae0561bbab7e3f324dd0f46-8800d350-a8db-11e3-1bef-004a77f8b47f"

#pragma mark - API



#pragma mark - Notifications

extern NSString *const kQZListDidUpdateNotificationName;
extern NSString *const kQZPlusDidChangeNotificationName;
extern NSString *const kQZUserUpdatedNotificationName;




#endif