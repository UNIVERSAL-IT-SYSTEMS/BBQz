//
//  QuoteQuizViewController.h
//  QuoteQuiz
//
//  Created by Burak Firik on 7/14/12.
//  Copyright (c) 2012 Burak Firik. All rights reserved.
//

#import <UIKit/UIKit.h>
// EMail SMS lib
#import <MessageUI/MFMailComposeViewController.h>
#import <MessageUI/MessageUI.h>
#import <QuartzCore/QuartzCore.h>

@class Quiz;

@interface QuoteQuizViewController : UIViewController <MFMailComposeViewControllerDelegate>{
    
    IBOutlet UIScrollView *scroller;
    IBOutlet UIScrollView *scroller_ipad;
}

@property (nonatomic, assign) NSInteger quizIndex;
@property (nonatomic, strong) NSString *grade;
@property (nonatomic, strong) Quiz *quiz;
@property (nonatomic , strong) IBOutlet UIView *popupView;

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

@end

@protocol QuizTipViewControllerDelegate <NSObject>


@end