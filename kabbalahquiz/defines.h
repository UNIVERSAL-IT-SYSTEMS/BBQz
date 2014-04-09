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
#define kCDMessageT @"I just tried Kabbalah Quiz!"
#define kCDUrlT @"https://itunes.apple.com/us/app/kabbalah-quiz/id847571952?ls=1&mt=8"
#define kCDMessageF @"I just tried Kabbalah Quiz!"
#define kCDUrlF @"https://itunes.apple.com/us/app/kabbalah-quiz/id847571952?ls=1&mt=8"

#pragma mark - API



#pragma mark - Notifications

extern NSString *const kQZListDidUpdateNotificationName;
extern NSString *const kQZPlusDidChangeNotificationName;
extern NSString *const kQZUserUpdatedNotificationName;

#pragma mark - Fonts

extern NSString *const kCDIRegularFontName;
extern NSString *const kCDIBoldFontName;
extern NSString *const kCDIBoldItalicFontName;
extern NSString *const kCDIItalicFontName;
extern NSString *const kCDIExtraBoldFontName;
extern NSString *const kCDIExtraBoldItalicFontName;
extern NSString *const kCDILightFontName;
extern NSString *const kCDILightItalicFontName;
extern NSString *const kCDISemiboldFontName;
extern NSString *const kCDISemiboldItalicFontName;


#endif