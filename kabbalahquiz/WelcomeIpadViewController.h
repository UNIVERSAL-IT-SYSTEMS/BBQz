//
//  WelcomeIpadViewController.h
//  kabbalahquiz
//
//  Created by Rockstar. on 1/17/14.
//  Copyright (c) 2014 Bnei Baruch USA. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PagedScrollViewIpad.h"

@interface WelcomeIpadViewController : UIViewController
@property IBOutlet PagedScrollViewIpad *pageScrollViewIpad;
@property UIViewController *nextViewControllerIpad ;

+ (BOOL) shouldRunWelcomeFlowIpad;
+ (void) setShouldRunWelcomeFlowIpad:(BOOL)should;

@end
