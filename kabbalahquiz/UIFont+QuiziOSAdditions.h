//
//  UIFont+QuiziOSAdditions.h
//  Kabbalah Quiz
//
//  Created by Rockstar. on 4/7/14.
//  Copyright (c) 2014 Bnei Baruch USA. All rights reserved.
//

#import <UIKit/UIKit.h>

extern NSString *const kCDIFontRegularKey;
extern NSString *const kCDIFontItalicKey;
extern NSString *const kCDIFontBoldKey;
extern NSString *const kCDIFontBoldItalicKey;

extern NSString *const kCDIFontExtraBoldKey;
extern NSString *const kCDIFontExtrBoldItalicKey;
extern NSString *const kCDIFontLightKey;
extern NSString *const kCDIFontLightItalicKey;
extern NSString *const kCDIFontSemiboldKey;
extern NSString *const kCDIFontSemiboldItalicKey;

@interface UIFont (QuiziOSAdditions)

#pragma mark - Font Names

+ (NSDictionary *)quizFontMapForFontKey:(NSString *)key;
+ (NSString *)quizFontNameForFontKey:(NSString *)key style:(NSString *)style;


#pragma mark - Fonts

+ (UIFont *)quizFontOfSize:(CGFloat)fontSize fontKey:(NSString *)key;
+ (UIFont *)boldQuizFontOfSize:(CGFloat)fontSize fontKey:(NSString *)key;
+ (UIFont *)boldItalicQuizFontOfSize:(CGFloat)fontSize fontKey:(NSString *)key;
+ (UIFont *)italicQuizFontOfSize:(CGFloat)fontSize fontKey:(NSString *)key;
+ (UIFont *)extraBoldQuizFontOfSize:(CGFloat)fontSize fontKey:(NSString *)key;
+ (UIFont *)extraBoldItalicQuizFontOfSize:(CGFloat)fontSize fontKey:(NSString *)key;
+ (UIFont *)lightQuizFontOfSize:(CGFloat)fontSize fontKey:(NSString *)key;
+ (UIFont *)lightItalicQuizFontOfSize:(CGFloat)fontSize fontKey:(NSString *)key;
+ (UIFont *)semiboldQuizFontOfSize:(CGFloat)fontSize fontKey:(NSString *)key;
+ (UIFont *)semiboldItalicQuizFontOfSize:(CGFloat)fontSize fontKey:(NSString *)key;


#pragma mark - Interface

+ (UIFont *)quizInterfaceFontOfSize:(CGFloat)fontSize;
+ (UIFont *)boldQuizInterfaceFontOfSize:(CGFloat)fontSize;
+ (UIFont *)lightQuizInterfaceFontOfSize:(CGFloat)fontSize;

@end
