//
//  AppDelegate.h
//  kabbalahquiz
//
//  Created by Rockstar. on 1/17/14.
//  Copyright (c) 2014 Bnei Baruch USA. All rights reserved.
//

#import <UIKit/UIKit.h>

@class JASidePanelController;

@interface AppDelegate : UIResponder <UIApplicationDelegate, UIActionSheetDelegate>{
    
    UIBackgroundTaskIdentifier bgTask;
}

@property (strong, nonatomic) UIWindow *window;
@property (retain, nonatomic) UIWindow *background;

@property (strong, nonatomic) JASidePanelController *viewController;

@property (nonatomic) UISplitViewController *splitViewController;

@property (nonatomic, strong) MFMailComposeViewController *globalMailComposer;

- (void)cycleTheGlobalMailComposer;
@end
