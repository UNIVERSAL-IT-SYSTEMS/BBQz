//
//  kqTheme.m
//  kabbalahquiz
//
//  Created by Rockstar. on 4/5/14.
//  Copyright (c) 2014 Bnei Baruch USA. All rights reserved.
//

#import "kqTheme.h"
#import "UIImageAverageColorAddition.h"

@implementation kqTheme


+ (UIColor*)foregroundColor{
    return [UIColor whiteColor];
}

+ (UIColor*)viewBackgroundColor{
    
    NSString* backgroundImage = @"niagara";
    return [UIColor colorWithPatternImage:[UIImage imageNamed:backgroundImage]];
}

+(void)customizeTheme{
    
    NSString* backgroundImage = @"canyon";
    UIImage* image = [UIImage imageNamed:backgroundImage];
    UIColor* navigationColor = [image averageColor];
    
    [UINavigationBar appearance].tintColor = [self foregroundColor];
    [UINavigationBar appearance].barTintColor = navigationColor;
    
    NSMutableDictionary* navbarAttributes = [NSMutableDictionary dictionary];
    navbarAttributes[NSFontAttributeName] = [UIFont boldSystemFontOfSize:19.0f];
    navbarAttributes[NSForegroundColorAttributeName] = [self foregroundColor];
    [UINavigationBar appearance].titleTextAttributes = navbarAttributes;
    
    NSMutableDictionary* barButtonAttributes = [NSMutableDictionary dictionary];
    barButtonAttributes[NSFontAttributeName] = [UIFont boldSystemFontOfSize:14.0f];
    barButtonAttributes[NSForegroundColorAttributeName] = [self foregroundColor];
    
    [[UIBarButtonItem appearance] setTitleTextAttributes:barButtonAttributes forState:UIControlStateNormal];
}


@end
