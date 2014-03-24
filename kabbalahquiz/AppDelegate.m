//
//  AppDelegate.m
//  kabbalahquiz
//
//  Created by Rockstar. on 1/17/14.
//  Copyright (c) 2014 Bnei Baruch USA. All rights reserved.
//

#import "AppDelegate.h"
//#import "JHCenterViewController.h"
#import "JASidePanelController.h"
#import "JHLeftViewController.h"

#import "WelcomeViewController.h"
#import "WelcomeIpadViewController.h"

#import "QuoteQuizViewController.h"


@implementation AppDelegate
@synthesize window = _window;
@synthesize background = _background;
@synthesize viewController = _viewController;

- (void)applicationDidChangeStatusBarOrientation:(NSNotification *)notification;
{
    int a = [[notification.userInfo objectForKey: UIApplicationStatusBarOrientationUserInfoKey] intValue];
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
    
    [[LocalyticsSession shared] resume];
    [[LocalyticsSession shared] upload];
    //[Flurry setCrashReportingEnabled:NO];
    //[Flurry startSession:@"H97X7J9VPTBFKHRR5YKB"];
    
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad) {
        /*
        UISplitViewController *splitViewController = (UISplitViewController *)self.window.rootViewController;
        UINavigationController *navigationController = [splitViewController.viewControllers lastObject];
        splitViewController.delegate = (id)navigationController.topViewController;*/
        
        //MyFirstViewController* firstVC = [[MyFirstViewController alloc] init];
        //MySecondViewController* secondVC = [[MySecondViewController alloc] init];
        
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
    
    ///Push
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7) {
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(applicationDidChangeStatusBarOrientation:)
                                                     name:UIApplicationDidChangeStatusBarOrientationNotification
                                                   object:nil];
        
        self.window.clipsToBounds =YES;
    }
    
    [application registerForRemoteNotificationTypes:
     UIRemoteNotificationTypeBadge |
     UIRemoteNotificationTypeAlert |
     UIRemoteNotificationTypeSound];
    
    NSDictionary* userInfo = [launchOptions valueForKey:@"UIApplicationLaunchOptionsRemoteNotificationKey"];
    NSDictionary *apsInfo = [userInfo objectForKey:@"aps"];
    NSInteger badge = [[apsInfo objectForKey:@"badge"] integerValue];
    application.applicationIconBadgeNumber = badge;
    
    return YES;
}

/*
 * This makese the login screens look much nicer on iPad
 */
+ (void)initialize {
    // Set user agent (the only problem is that we can't modify the User-Agent later in the program)
    NSDictionary *dictionary = [[NSDictionary alloc] initWithObjectsAndKeys:@"Mozilla/5.0 (iPhone; CPU iPhone OS 5_0 like Mac OS X) AppleWebKit/534.46 (KHTML, like Gecko) Version/5.1 Mobile/9A334 Safari/7534.48.3", @"UserAgent", nil];
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
    //[[LocalyticsSession sharedLocalyticsSession] close];
    //[[LocalyticsSession sharedLocalyticsSession] upload];

}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    [[LocalyticsSession shared] resume];
    [[LocalyticsSession shared] upload];
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

@end
