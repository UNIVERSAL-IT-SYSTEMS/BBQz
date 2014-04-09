//
//  KabbalisticLanguage.h
//  Kabbalah Quiz
//
//  Created by Rockstar. on 4/6/14.
//  Copyright (c) 2014 Bnei Baruch USA. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MessageUI/MessageUI.h>
#import <MessageUI/MFMailComposeViewController.h>
#import <QuartzCore/QuartzCore.h>

@class Quiz;
@interface KabbalisticLanguage : UIViewController<MFMailComposeViewControllerDelegate>{
    
    IBOutlet UIScrollView *scroller;
    IBOutlet UIScrollView *scroller_ipad;
}

@property (nonatomic, assign)NSInteger quizIndex;
@property (nonatomic) NSString *grade;
@property (nonatomic) Quiz *quiz;
@property (nonatomic) IBOutlet UIView *popupView;
@property (nonatomic) IBOutlet UIImageView *questionBg;

-(void)ans1Action:(id)sender;
-(void)ans2Action:(id)sender;
-(void)ans3Action:(id)sender;
-(void)ans4Action:(id)sender;

-(IBAction)startAgain:(id)sender;
-(IBAction)reset:(id)sender;
-(IBAction)finishButtonTouched:(id)sender;
- (IBAction)emailResult:(id)sender;
- (IBAction)closeButtonTouched:(id)sender;


@property(nonatomic) IBOutlet UIButton *answer1Button;
@property(nonatomic) IBOutlet UIButton *answer2Button;
@property(nonatomic) IBOutlet UIButton *answer3Button;
@property(nonatomic) IBOutlet UIButton *answer4Button;

@property (nonatomic) IBOutlet UILabel *answer1Label;
@property (nonatomic) IBOutlet UILabel *answer2Label;
@property (nonatomic) IBOutlet UILabel *answer3Label;
@property (nonatomic) IBOutlet UILabel *answer4Label;

@property (nonatomic) IBOutlet UILabel *questionLabel;
@property (nonatomic) IBOutlet UILabel *statusLabel;
@property (nonatomic) IBOutlet UIButton *email;

@end
