//
//  AppDelegate.h
//  kabbalahquiz
//
//  Created by Rockstar. on 1/17/14.
//  Copyright (c) 2014 Bnei Baruch USA. All rights reserved.
//

#import <UIKit/UIKit.h>

@class JASidePanelController;

@interface AppDelegate : UIResponder <UIApplicationDelegate, UITabBarControllerDelegate, UITabBarDelegate, UIActionSheetDelegate>{
    
    UIBackgroundTaskIdentifier bgTask;
}

@property (strong, nonatomic) UIWindow *window;
@property (retain, nonatomic) UIWindow *background;

@property (strong, nonatomic) JASidePanelController *viewController;
@end
