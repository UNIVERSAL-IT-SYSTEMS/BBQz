//
//  WelcomeIpadViewController.m
//  kabbalahquiz
//
//  Created by Rockstar. on 1/17/14.
//  Copyright (c) 2014 Bnei Baruch USA. All rights reserved.
//

#import "WelcomeIpadViewController.h"

@interface WelcomeIpadViewController ()
@property (weak, nonatomic) IBOutlet UIButton *viewButtonIpad;

@end

CGFloat const scrollViewHeightIpad = 578.f;
CGFloat const scrollViewMarginIpad = 0.f;

NSString *nsuserdefaultsHasRunFlowKeyNameIpad = @"com.bneibaruch.hasRunWelcomeFlowIpad";

@implementation WelcomeIpadViewController
@synthesize pageScrollViewIpad, nextViewControllerIpad;
@synthesize viewButtonIpad;

+ (BOOL) shouldRunWelcomeFlowIpad {
    //You should run if not yet run
    return ![[NSUserDefaults standardUserDefaults] boolForKey:nsuserdefaultsHasRunFlowKeyNameIpad];
}

+ (void) setShouldRunWelcomeFlowIpad:(BOOL)should {
    //ShouldRun is opposite of hasRun
    [[NSUserDefaults standardUserDefaults] setBool:!should forKey:nsuserdefaultsHasRunFlowKeyNameIpad];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    CGFloat scrollViewWidth = self.view.bounds.size.width;
    CGRect pageFrameIpad = CGRectMake((self.view.bounds.size.width - scrollViewWidth), (self.view.bounds.size.height - scrollViewHeightIpad), scrollViewWidth, scrollViewHeightIpad);
    
    pageScrollViewIpad = [pageScrollViewIpad initWithFrame:pageFrameIpad];
    
    NSMutableArray *views = [NSMutableArray arrayWithCapacity:4];
    NSMutableArray *images = [NSMutableArray arrayWithObjects:@"WelcomeThatInbox",@"WelcomeThatPDF",@"WelcomeThatPhoto",@"WelcomeThatCloud", nil];
    
    for (NSString *imageName in images) {
        UIView *welcomeScreenIpad = [[UIView alloc] init];
        UIImageView *imageViewIpad = [[UIImageView alloc] initWithImage:[UIImage imageNamed:imageName]];
        imageViewIpad.frame = CGRectMake(CGRectGetMidX(welcomeScreenIpad.bounds) - CGRectGetMidX(imageViewIpad.bounds), 0, imageViewIpad.bounds.size.width, imageViewIpad.bounds.size.height);
        imageViewIpad.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin|UIViewAutoresizingFlexibleRightMargin;
        [welcomeScreenIpad addSubview:imageViewIpad];
        welcomeScreenIpad.autoresizingMask = UIViewAutoresizingFlexibleBottomMargin | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleTopMargin;
        [views addObject:welcomeScreenIpad];
    }
    
    [pageScrollViewIpad setScrollViewContents:views];
    
    // Do any additional setup after loading the view from its nib.
}

- (void) viewWillLayoutSubviews {
    CGFloat scrollViewWidth = self.view.bounds.size.width;
    CGRect pageFrame = CGRectMake((self.view.bounds.size.width - scrollViewWidth), (self.view.bounds.size.height - scrollViewHeightIpad), scrollViewWidth, scrollViewHeightIpad);
    [self.pageScrollViewIpad setFrame:pageFrame];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)skipWelcomeFlowIpad:(id)sender {
    [WelcomeIpadViewController setShouldRunWelcomeFlowIpad:NO];
    [[[UIApplication sharedApplication] keyWindow] setRootViewController:self.nextViewControllerIpad];
}

@end
