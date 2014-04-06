//
//  WelcomeViewController.m
//  Jewish Holidays
//
//  Created by Rockstar. on 9/2/13.
//  Copyright (c) 2013 Bnei Baruch USA. All rights reserved.
//

#import "WelcomeViewController.h"

@interface WelcomeViewController ()

@property (weak, nonatomic) IBOutlet UIButton *viewButton;

@end
CGFloat const scrollViewHeight = 548.f;
CGFloat const scrollViewMargin = 0.f;


NSString *nsuserdefaultsHasRunFlowKeyName = @"com.bneibaruch.hasRunWelcomeFlow";

@implementation WelcomeViewController
@synthesize pageScrollView, nextViewController;
@synthesize viewButton;

+ (BOOL) shouldRunWelcomeFlow {
    //You should run if not yet run
    return ![[NSUserDefaults standardUserDefaults] boolForKey:nsuserdefaultsHasRunFlowKeyName];
}

+ (void) setShouldRunWelcomeFlow:(BOOL)should {
    //ShouldRun is opposite of hasRun
    [[NSUserDefaults standardUserDefaults] setBool:!should forKey:nsuserdefaultsHasRunFlowKeyName];
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
    //UIColor* bgColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"general_bg_tile"]];
    //[self.view setBackgroundColor:bgColor];
    
    CGFloat scrollViewWidth = self.view.bounds.size.width;
    CGRect pageFrame = CGRectMake((self.view.bounds.size.width - scrollViewWidth), (self.view.bounds.size.height - scrollViewHeight), scrollViewWidth, scrollViewHeight);
    
    pageScrollView = [pageScrollView initWithFrame:pageFrame];
        
    NSMutableArray *views = [NSMutableArray arrayWithCapacity:4];
    NSMutableArray *images = [NSMutableArray arrayWithObjects:@"4",@"1",@"2",@"3", nil];
    
    for (NSString *imageName in images) {
        UIView *welcomeScreen = [[UIView alloc] init];
        UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:imageName]];
        imageView.frame = CGRectMake(CGRectGetMidX(welcomeScreen.bounds) - CGRectGetMidX(imageView.bounds), 0, imageView.bounds.size.width, imageView.bounds.size.height);
        imageView.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin|UIViewAutoresizingFlexibleRightMargin;
        [welcomeScreen addSubview:imageView];
        welcomeScreen.autoresizingMask = UIViewAutoresizingFlexibleBottomMargin | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleTopMargin;
        [views addObject:welcomeScreen];
    }
    
    [pageScrollView setScrollViewContents:views];
    
    UIImage *btn = [UIImage imageNamed:@"btn_standard_default~iphone.png"];
    UIImage *stretchBtn = [btn stretchableImageWithLeftCapWidth:5.0 topCapHeight:0.0];
    UIImageView *btnImageView = [[UIImageView alloc]initWithImage:stretchBtn];
    btnImageView.frame = CGRectMake(20, 468, 280.0, stretchBtn.size.height);
    [viewButton setBackgroundImage:stretchBtn forState:UIControlStateNormal];
    
    UIImage *btnPressed = [UIImage imageNamed:@"btn_standard_pressed~iphone.png"];
    UIImage *stretchBtnPressed = [btnPressed stretchableImageWithLeftCapWidth:5.0 topCapHeight:0.0];
    UIImageView *btnPressedImageView = [[UIImageView alloc]initWithImage:stretchBtnPressed];
    btnPressedImageView.frame = CGRectMake(20, 468, 280.0, stretchBtnPressed.size.height);
    [viewButton setBackgroundImage:stretchBtnPressed forState:UIControlStateHighlighted];
    
    // Do any additional setup after loading the view from its nib.
}

- (void) viewWillLayoutSubviews {
    CGFloat scrollViewWidth = self.view.bounds.size.width;
    CGRect pageFrame = CGRectMake((self.view.bounds.size.width - scrollViewWidth), (self.view.bounds.size.height - scrollViewHeight), scrollViewWidth, scrollViewHeight);
    [self.pageScrollView setFrame:pageFrame];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)skipWelcomeFlow:(id)sender {
    [WelcomeViewController setShouldRunWelcomeFlow:NO];
    [[[UIApplication sharedApplication] keyWindow] setRootViewController:self.nextViewController];
    NSLog(@"Button Tapped");
}

@end
