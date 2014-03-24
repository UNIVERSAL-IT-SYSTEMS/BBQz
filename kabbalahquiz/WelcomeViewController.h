//
//  WelcomeViewController.h
//  Jewish Holidays
//
//  Created by Rockstar. on 9/2/13.
//  Copyright (c) 2013 Bnei Baruch USA. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PagedScrollView.h"

@interface WelcomeViewController : UIViewController{
    
}
@property IBOutlet PagedScrollView *pageScrollView;
@property UIViewController *nextViewController;

+ (BOOL) shouldRunWelcomeFlow;
+ (void) setShouldRunWelcomeFlow:(BOOL)should;


@end
