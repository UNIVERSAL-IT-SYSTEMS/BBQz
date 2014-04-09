//
//  UIFont+QuiziOSAdditions.m
//  Kabbalah Quiz
//
//  Created by Rockstar. on 4/7/14.
//  Copyright (c) 2014 Bnei Baruch USA. All rights reserved.
//

#import "UIFont+QuiziOSAdditions.h"

NSString *const kCDIFontRegularKey = @"Regular";
NSString *const kCDIFontItalicKey = @"Italic";
NSString *const kCDIFontBoldKey= @"Bold";
NSString *const kCDIFontBoldItalicKey = @"BoldItalic";

NSString *const kCDIFontExtraBoldKey = @"ExtraBold";
NSString *const kCDIFontExtrBoldItalicKey = @"ExtraBoldItalic";
NSString *const kCDIFontLightKey = @"Light";
NSString *const kCDIFontLightItalicKey = @"LightItalic";
NSString *const kCDIFontSemiboldKey = @"Semibold";
NSString *const kCDIFontSemiboldItalicKey = @"SemiboldItalic";

@implementation UIFont (QuiziOSAdditions)

#pragma mark - Font Names

+ (NSDictionary *)quizFontMapForFontKey:(NSString *)key {
	static NSDictionary *fontDictionary = nil;
	static dispatch_once_t onceToken;
	dispatch_once(&onceToken, ^{
		fontDictionary = [[NSDictionary alloc] initWithObjectsAndKeys:
						  [[NSDictionary alloc] initWithObjectsAndKeys:
						   kCDIRegularFontName, kCDIFontRegularKey,
						   kCDIItalicFontName, kCDIFontItalicKey,
						   kCDIBoldFontName, kCDIFontBoldKey,
						   kCDIBoldItalicFontName, kCDIFontBoldItalicKey,
						   nil], nil];
                          
	});
	return [fontDictionary objectForKey:key];
}

+ (NSString *)quizFontNameForFontKey:(NSString *)key style:(NSString *)style {
	return [[self quizFontMapForFontKey:key] objectForKey:style];
}


#pragma mark - Fonts

+ (UIFont *)quizFontOfSize:(CGFloat)fontSize fontKey:(NSString *)key {
	NSString *fontName = [self quizFontNameForFontKey:key style:kCDIFontRegularKey];
	return [self fontWithName:fontName size:fontSize];
}


+ (UIFont *)italicQuizFontOfSize:(CGFloat)fontSize fontKey:(NSString *)key {
	NSString *fontName = [self quizFontNameForFontKey:key style:kCDIFontItalicKey];
	return [self fontWithName:fontName size:fontSize];
}


+ (UIFont *)boldQuizFontOfSize:(CGFloat)fontSize fontKey:(NSString *)key {
	NSString *fontName = [self quizFontNameForFontKey:key style:kCDIFontBoldKey];
	return [self fontWithName:fontName size:fontSize];
}


+ (UIFont *)boldItalicQuizFontOfSize:(CGFloat)fontSize fontKey:(NSString *)key {
	NSString *fontName = [self quizFontNameForFontKey:key style:kCDIFontBoldItalicKey];
	return [self fontWithName:fontName size:fontSize];
}

+ (UIFont *)extraBoldQuizFontOfSize:(CGFloat)fontSize fontKey:(NSString *)key{
    NSString *fontName = [self quizFontNameForFontKey:key style:kCDIExtraBoldFontName];
	return [self fontWithName:fontName size:fontSize];
    
}


+ (UIFont *)extraBoldItalicQuizFontOfSize:(CGFloat)fontSize fontKey:(NSString *)key{
    NSString *fontName = [self quizFontNameForFontKey:key style:kCDIExtraBoldItalicFontName];
	return [self fontWithName:fontName size:fontSize];
    
}

+ (UIFont *)lightQuizFontOfSize:(CGFloat)fontSize fontKey:(NSString *)key{
    NSString *fontName = [self quizFontNameForFontKey:key style:kCDIFontLightKey];
	return [self fontWithName:fontName size:fontSize];
    
}

+ (UIFont *)lightItalicQuizFontOfSize:(CGFloat)fontSize fontKey:(NSString *)key{
    NSString *fontName = [self quizFontNameForFontKey:key style:kCDILightItalicFontName];
	return [self fontWithName:fontName size:fontSize];
    
}

+ (UIFont *)semiboldQuizFontOfSize:(CGFloat)fontSize fontKey:(NSString *)key{
    
    NSString *fontName = [self quizFontNameForFontKey:key style:kCDISemiboldFontName];
	return [self fontWithName:fontName size:fontSize];
    
}

+ (UIFont *)semiboldItalicQuizFontOfSize:(CGFloat)fontSize fontKey:(NSString *)key{
    
    NSString *fontName = [self quizFontNameForFontKey:key style:kCDISemiboldItalicFontName];
	return [self fontWithName:fontName size:fontSize];
    
}



#pragma mark - Interface

+ (UIFont *)quizInterfaceFontOfSize:(CGFloat)fontSize {
	return [self fontWithName:kCDIRegularFontName size:fontSize];
}


+ (UIFont *)boldQuizInterfaceFontOfSize:(CGFloat)fontSize {
	return [self fontWithName:kCDIBoldFontName size:fontSize];
}

+ (UIFont *)lightQuizInterfaceFontOfSize:(CGFloat)fontSize {
    
    return [self fontWithName:kCDILightFontName size:fontSize];
}


@end
