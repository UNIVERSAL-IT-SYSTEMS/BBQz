//
//  PurposeViewController.h
//  kabbalahquiz
//
//  Created by Rockstar. on 3/24/14.
//  Copyright (c) 2014 Bnei Baruch USA. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MessageUI/MFMailComposeViewController.h>
#import <MessageUI/MessageUI.h>
#import <QuartzCore/QuartzCore.h>

@class Quiz;
@class Reachability;
@interface PurposeViewController : UIViewController<MFMailComposeViewControllerDelegate, UIActionSheetDelegate>{
    
    IBOutlet UIScrollView *scroller;
    IBOutlet UIScrollView *scroller_ipad;
    Reachability *internetReach;
}

@property (nonatomic, assign) NSInteger quizIndex;
@property (nonatomic, strong) NSString *grade;
@property (nonatomic, strong) Quiz *quiz;
@property (nonatomic , strong) IBOutlet UIView *popupView;
@property (nonatomic) IBOutlet UIImageView *questionBg;

-(void)ans1Action:(id)sender;
-(void)ans2Action:(id)sender;
-(void)ans3Action:(id)sender;
-(void)ans4Action:(id)sender;


-(IBAction)startAgain:(id)sender;
-(IBAction)reset:(id)sender;
-(IBAction)finishButtonTouched:(UIButton *)sender;
- (IBAction)emailResult:(UIButton *)sender;
- (IBAction)closeButtonTouched:(UIButton *)sender;



@property (strong, nonatomic) IBOutlet UIButton *answer1Button;
@property (strong, nonatomic) IBOutlet UIButton *answer2Button;
@property (strong, nonatomic) IBOutlet UIButton *answer3Button;
@property (strong, nonatomic) IBOutlet UIButton *answer4Button;

@property (strong, nonatomic)IBOutlet UILabel *answer1Label;
@property (strong, nonatomic)IBOutlet UILabel *answer2Label;
@property (strong, nonatomic)IBOutlet UILabel *answer3Label;
@property (strong, nonatomic)IBOutlet UILabel *answer4Label;

@property (nonatomic) IBOutlet UILabel *questionLabel;
@property (nonatomic) IBOutlet UILabel *statusLabel;
@property (nonatomic) IBOutlet UIButton *email;

@end

