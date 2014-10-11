//
//  AppDelegate.m
//  kabbalahquiz
//
//  Created by Rockstar. on 1/17/14.
//  Copyright (c) 2014 Bnei Baruch USA. All rights reserved.
//

#import "AppDelegate.h"
#import <Crashlytics/Crashlytics.h>
//#import "JHCenterViewController.h"
#import "JASidePanelController.h"
#import "JHLeftViewController.h"

#import "WelcomeViewController.h"
#import "WelcomeIpadViewController.h"

#import "QuoteQuizViewController.h"

#import "kqTheme.h"


@implementation AppDelegate
@synthesize window = _window;
@synthesize background = _background;
@synthesize viewController = _viewController;

- (void)applicationDidChangeStatusBarOrientation:(NSNotification *)notification;
{
    int a = [(notification.userInfo)[UIApplicationStatusBarOrientationUserInfoKey] intValue];
    switch(a){
        case 4:
            self.window.frame =  CGRectMake(0,0,self.window.frame.size.width,self.window.frame.size.height+40);
            self.window.backgroundColor = [UIColor darkGrayColor];
            
            break;
        case 3:
            self.window.frame =  CGRectMake(0,0,self.window.frame.size.width,self.window.frame.size.height+40);
            self.window.backgroundColor = [UIColor darkGrayColor];
            break;
        case 2:
            self.window.frame =  CGRectMake(0,0,self.window.frame.size.width,self.window.frame.size.height+40);
            self.window.backgroundColor = [UIColor darkGrayColor];
            break;
        case 1:
            self.window.frame =  CGRectMake(0,0,self.window.frame.size.width,self.window.frame.size.height+40);
            self.window.backgroundColor = [UIColor darkGrayColor];
    }
}


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    [NSThread sleepForTimeInterval:1.5];
    
    [self cycleTheGlobalMailComposer];
    
    [[LocalyticsSession shared] resume];
    [[LocalyticsSession shared] upload];
    [Appirater appLaunched:YES];
    
    [Crashlytics startWithAPIKey:@"62ce332ae1de018bdee39900e29eab6ab5d39419"];
    //[Flurry setCrashReportingEnabled:NO];
    //[Flurry startSession:@"H97X7J9VPTBFKHRR5YKB"];
    
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad) {
        
        
        UISplitViewController* splitVC = [[UISplitViewController alloc] init];
        //splitVC.viewControllers = [NSArray arrayWithObjects:firstVC, secondVC, nil];
        
        _window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
        _window.rootViewController = splitVC;
        [_window makeKeyAndVisible];
        
        
        
        /*
        [application setStatusBarHidden:NO];
        [application setStatusBarStyle:UIStatusBarStyleLightContent];
        
        self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main_iPad" bundle:nil];
        UIViewController *cvc = [storyboard instantiateInitialViewController];
        self.viewController.centerPanel = cvc;
        self.viewController.leftPanel = [[JHLeftViewController alloc] init];
        self.window.rootViewController = self.viewController;
        [self.window makeKeyAndVisible];
    
    if ([WelcomeIpadViewController shouldRunWelcomeFlowIpad]) {
        WelcomeIpadViewController * welcomeViewControllerIpad;
        welcomeViewControllerIpad = [[WelcomeIpadViewController alloc] initWithNibName:@"WelcomeIpadViewController" bundle:nil];
        
        welcomeViewControllerIpad.nextViewControllerIpad = self.window.rootViewController;
        [self.window setRootViewController:welcomeViewControllerIpad];
    }*/
        
        
    }
    
    else if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        [self applyStylesheet];
        
        [application setStatusBarHidden:NO];
        [application setStatusBarStyle:UIStatusBarStyleLightContent];
        
        self.viewController = [[JASidePanelController alloc] init];
        self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main_iPhone" bundle:nil];
        UIViewController *cvc = [storyboard instantiateInitialViewController];
        self.viewController.centerPanel = cvc;
        self.viewController.leftPanel = [[JHLeftViewController alloc] init];
        self.window.rootViewController = self.viewController;
        [self.window makeKeyAndVisible];
    
    if ([WelcomeViewController shouldRunWelcomeFlow]) {
        WelcomeViewController * welcomeViewController;
        welcomeViewController = [[WelcomeViewController alloc] initWithNibName:@"WelcomeViewController" bundle:nil];
        
        welcomeViewController.nextViewController = self.window.rootViewController;
        [self.window setRootViewController:welcomeViewController];
    }
    }
    
    if ([[[UIDevice currentDevice] systemVersion] floatValue] < 7) {
        [application registerForRemoteNotificationTypes:
         UIRemoteNotificationTypeBadge |
         UIRemoteNotificationTypeAlert |
         UIRemoteNotificationTypeSound];
        
        NSDictionary* userInfo = [launchOptions valueForKey:@"UIApplicationLaunchOptionsRemoteNotificationKey"];
        NSDictionary *apsInfo = userInfo[@"aps"];
        NSInteger badge = [apsInfo[@"badge"] integerValue];
        application.applicationIconBadgeNumber = badge;
    }
    
    
    ///Push
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8) {
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(applicationDidChangeStatusBarOrientation:)
                                                     name:UIApplicationDidChangeStatusBarOrientationNotification
                                                   object:nil];
        
        self.window.clipsToBounds =YES;
    }
    
    return YES;
}

/*
 * This makese the login screens look much nicer on iPad
 */
+ (void)initialize {
    // Set user agent (the only problem is that we can't modify the User-Agent later in the program)
    NSDictionary *dictionary = @{@"UserAgent": @"Mozilla/5.0 (iPhone; CPU iPhone OS 5_0 like Mac OS X) AppleWebKit/534.46 (KHTML, like Gecko) Version/5.1 Mobile/9A334 Safari/7534.48.3"};
    [[NSUserDefaults standardUserDefaults] registerDefaults:dictionary];
}

							
- (void)applicationWillResignActive:(UIApplication *)application
{
    
    [[LocalyticsSession shared] close];
    [[LocalyticsSession shared] upload];
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    [[LocalyticsSession shared] close];
    [[LocalyticsSession shared] upload];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"didEnterBackground" object:self];
    
    UIApplication*    app = [UIApplication sharedApplication];
    
    // Request permission to run in the background. Provide an
    // expiration handler in case the task runs long.
    NSAssert(bgTask == UIBackgroundTaskInvalid, nil);
    
    bgTask = [app beginBackgroundTaskWithExpirationHandler:^{
        // Synchronize the cleanup call on the main thread in case
        // the task actually finishes at around the same time.
        dispatch_async(dispatch_get_main_queue(), ^{
            
            if (bgTask != UIBackgroundTaskInvalid)
            {
                [app endBackgroundTask:bgTask];
                bgTask = UIBackgroundTaskInvalid;
            }
        });
    }];
    
    // Start the long-running task and return immediately.
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
        NSLog(@"App status: applicationDidEnterBackground");
        // Synchronize the cleanup call on the main thread in case
        // the expiration handler is fired at the same time.
        dispatch_async(dispatch_get_main_queue(), ^{
            if (bgTask != UIBackgroundTaskInvalid)
            {
                [app endBackgroundTask:bgTask];
                bgTask = UIBackgroundTaskInvalid;
            }
        });
    });
    NSLog(@"backgroundTimeRemaining: %f", [[UIApplication sharedApplication] backgroundTimeRemaining]);
    [[LocalyticsSession sharedLocalyticsSession] close];
    [[LocalyticsSession sharedLocalyticsSession] upload];

}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    [[LocalyticsSession shared] resume];
    [[LocalyticsSession shared] upload];
    [Appirater appEnteredForeground:YES];
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    [[LocalyticsSession shared] LocalyticsSession:kCDKLocalyticsKey];
    [[LocalyticsSession shared] resume];
    [[LocalyticsSession shared] upload];
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    [[LocalyticsSession shared] close];
    [[LocalyticsSession shared] upload];
}

#pragma mark - UIAlertViewDelegate methods
- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex {
    // Quit the app
    exit(1);
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation {
	if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
		return YES;
	}
	
	return toInterfaceOrientation != UIInterfaceOrientationPortraitUpsideDown;
}

-(NSUInteger)supportedInterfaceOrientations{
    return UIInterfaceOrientationMaskAll;
}

-(BOOL)shouldAutorotate{
    return YES;
}

- (void)application:(UIApplication *)application didFailToRegisterForRemoteNotificationsWithError:(NSError *)error
{
    NSLog(@"Failed to register: %@", error.localizedDescription);
}

- (void)application:(UIApplication *)application didReceiveLocalNotification:(UILocalNotification *)notification
{
    // just pass this on to the remote notification handling routine... they serve the same purpose
    [self application:application didReceiveRemoteNotification:notification.userInfo];
}

#pragma mark - Stylesheet

- (void)applyStylesheet {
	// Navigation bar
	UINavigationBar *navigationBar = [UINavigationBar appearance];
    NSShadow *shadow = [NSShadow.alloc init];
    shadow.shadowColor = [UIColor colorWithWhite:0.0f alpha:0.2f];
    shadow.shadowOffset = CGSizeMake(0.0f, 1.0f);
	[navigationBar setBackgroundColor:[UIColor colorWithRed:0.031f green:0.506f blue:0.702f alpha:1.0f]];
	[navigationBar setTitleVerticalPositionAdjustment:-1.0f forBarMetrics:UIBarMetricsDefault];
    [navigationBar setTitleTextAttributes:@{NSFontAttributeName: [UIFont fontWithName:@"HelveticaNeue" size:20.0f],
                                                                                         NSShadowAttributeName : shadow,
                                                                                         NSForegroundColorAttributeName: [UIColor whiteColor]}];
}

-(void)cycleTheGlobalMailComposer
{
    // we are cycling the damned GlobalMailComposer... due to horrible iOS issue
    self.globalMailComposer = nil;
    self.globalMailComposer = [[MFMailComposeViewController alloc] init];
}

@end
