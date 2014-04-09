//
//  PurposeViewController.m
//  kabbalahquiz
//
//  Created by Rockstar. on 3/24/14.
//  Copyright (c) 2014 Bnei Baruch USA. All rights reserved.
//

#import "PurposeViewController.h"
#import "Quiz.h"
#import "UIFont+QuiziOSAdditions.h"

@interface PurposeViewController ()

@property (weak, nonatomic) IBOutlet UIButton *infoButton;

@property (assign, nonatomic) NSInteger answer;


@end

@implementation PurposeViewController{
    UIButton *_resultButton;
    UIButton *_nextButton;
    UIButton *_startButton;
    UIButton *_answer1;
    UIButton *_answer2;
    UIButton *_answer3;
    UIButton *_answer4;
    UIImageView *_background;
    UIButton *_email;
}
@synthesize answer1Button, answer2Button, answer3Button, answer4Button;
@synthesize answer1Label, answer2Label, answer3Label, answer4Label, questionLabel, statusLabel;
@synthesize questionBg = _questionBg;


- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"arches"]]];
    //self.questionLabel.backgroundColor = [UIColor redColor];
    
    UIImageView *title = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"nav-title"]];
    self.navigationItem.titleView = title;
    
	// Do any additional setup after loading the view, typically from a nib.
    self.quizIndex = 10;
    self.quiz = [[Quiz alloc] initWithQuiz:@"purpose"];
    //self.questionLabel.backgroundColor = [UIColor colorWithRed:51/255.0 green:133/255.0 blue:238/255.0 alpha:1.0];
    
    [self.popupView setHidden:YES];
    [self nextQuizQuestion];
    
    [scroller setScrollEnabled:YES];
    [scroller setContentSize:CGSizeMake(320, 480)];
    [scroller_ipad setScrollEnabled:YES];
    [scroller_ipad setContentSize:CGSizeMake(768, 1004)];
    
    
    //Question View
    [self questionView];
    
    //Button Settings
    UIImage *stretchBtn;
    UIImage *stretchBtnPressed;
    [self buttonSettings:&stretchBtn stretchBtnPressed_p:&stretchBtnPressed];
    
    //Arrow view
    [self downArrow];
    
    //Answer Buttons & Labels
    [self answerButtons:stretchBtn stretchBtnPressed:stretchBtnPressed];
    [self answerLabels];
    
    //Result Buttons
    [self resultButtons];
    [self nextButton];
    [self tryAgainButton];
    
}

- (void)questionView {
    UIImage *bg = [UIImage imageNamed:@"bg-map-embed"];
    _questionBg = [[UIImageView alloc] initWithImage:bg];
    _questionBg.frame = CGRectMake(0.0f, 0.0f, 320.0f, 200.0f);
    [scroller addSubview:_questionBg];
    
    questionLabel = [[UILabel alloc] initWithFrame: CGRectMake(5, 45, 310.0f, 140.0f)];
    questionLabel.text = self.quiz.question;
    questionLabel.backgroundColor = [UIColor clearColor];
    questionLabel.textColor = [UIColor colorWithRed:0.031f green:0.506f blue:0.702f alpha:1.0f];
    questionLabel.font = [UIFont boldQuizInterfaceFontOfSize:16.0f];
    questionLabel.textAlignment = NSTextAlignmentCenter;
    questionLabel.numberOfLines = 0;
    [scroller addSubview:questionLabel];
    
    statusLabel = [[UILabel alloc] initWithFrame:CGRectMake(12.0f, 12.0f, 248.0f, 21.0f)];
    statusLabel.text = [NSString stringWithFormat:@"Remaining questions: %ld", (long)self.quiz.quizCount];
    statusLabel.backgroundColor = [UIColor clearColor];
    statusLabel.textColor = [UIColor colorWithRed:0.031f green:0.506f blue:0.702f alpha:1.0f];
    statusLabel.font = [UIFont boldQuizInterfaceFontOfSize:13.0f];
    statusLabel.textAlignment = NSTextAlignmentLeft;
    statusLabel.numberOfLines = 1;
    [scroller addSubview:statusLabel];
    
}

- (void)downArrow
{
    UIImage *bgImage = [UIImage imageNamed:@"downArrow"];
    UIImageView *bg = [[UIImageView alloc] initWithImage:bgImage];
    bg.frame = CGRectMake(160.0f, 230.0f, 35.0f, 86.0f);
    _background = [[UIImageView alloc] initWithFrame:CGRectMake(140.0f, 350.0f, 35.0f, 86.0f)];
    [_background setImage:bgImage];
    [scroller addSubview:_background];
    [_background setHidden:YES];
}

- (void)buttonSettings:(UIImage **)stretchBtn_p stretchBtnPressed_p:(UIImage **)stretchBtnPressed_p
{
    /*ANSWER BUTTON*/
    UIImage *btn = [UIImage imageNamed:@"button-classic-green-up"];
    *stretchBtn_p = [btn stretchableImageWithLeftCapWidth:5.0 topCapHeight:0.0];
    UIImageView *btnImageView = [[UIImageView alloc]initWithImage:*stretchBtn_p];
    btnImageView.frame = CGRectMake(0, 200, (*stretchBtn_p).size.width, (*stretchBtn_p).size.height);
    
    UIImage *btnPressed = [UIImage imageNamed:@"button-classic-green-down"];
    *stretchBtnPressed_p = [btnPressed stretchableImageWithLeftCapWidth:5.0 topCapHeight:0.0];
    UIImageView *btnPressedImageView = [[UIImageView alloc]initWithImage:*stretchBtnPressed_p];
    btnPressedImageView.frame = CGRectMake(0, 250.0, (*stretchBtnPressed_p).size.width, (*stretchBtnPressed_p).size.height);
}

- (void)answerButtons:(UIImage *)stretchBtn stretchBtnPressed:(UIImage *)stretchBtnPressed
{
    //Answer Buttons
    
    answer1Button = [[UIButton alloc] initWithFrame:CGRectMake(24.0f, 225.0f, 272.0f, 60.0f)];
    [answer1Button setBackgroundImage:stretchBtn forState:UIControlStateNormal];
    [answer1Button setBackgroundImage:stretchBtnPressed forState:UIControlStateHighlighted];
    [answer1Button addTarget:self action:@selector(ans1Action:) forControlEvents:UIControlEventTouchUpInside];
    [scroller addSubview:answer1Button];
    
    answer2Button = [[UIButton alloc] initWithFrame:CGRectMake(24.0f, 290.0f, 272.0f, 60.0f)];
    [answer2Button setBackgroundImage:stretchBtn forState:UIControlStateNormal];
    [answer2Button setBackgroundImage:stretchBtnPressed forState:UIControlStateHighlighted];
    [answer2Button addTarget:self action:@selector(ans2Action:) forControlEvents:UIControlEventTouchUpInside];
    [scroller addSubview:answer2Button];
    
    answer3Button = [[UIButton alloc] initWithFrame:CGRectMake(24.0f, 355.0f, 272.0f, 60.0f)];
    [answer3Button setBackgroundImage:stretchBtn forState:UIControlStateNormal];
    [answer3Button setBackgroundImage:stretchBtnPressed forState:UIControlStateHighlighted];
    [answer3Button addTarget:self action:@selector(ans3Action:) forControlEvents:UIControlEventTouchUpInside];
    [scroller addSubview:answer3Button];
    
    answer4Button = [[UIButton alloc] initWithFrame:CGRectMake(24.0f, 420.0f, 272.0f, 60.0f)];
    [answer4Button setBackgroundImage:stretchBtn forState:UIControlStateNormal];
    [answer4Button setBackgroundImage:stretchBtnPressed forState:UIControlStateHighlighted];
    [answer4Button addTarget:self action:@selector(ans4Action:) forControlEvents:UIControlEventTouchUpInside];
    [scroller addSubview:answer4Button];
}

- (void)answerLabels
{
    //Answer Labels
    answer1Label = [[UILabel alloc] initWithFrame: answer1Button.frame];
    answer1Label.text = self.quiz.ans1;
    answer1Label.backgroundColor = [UIColor clearColor];
    answer1Label.textColor = [UIColor whiteColor];
    answer1Label.font = [UIFont lightQuizInterfaceFontOfSize:14.0f];
    answer1Label.textAlignment = NSTextAlignmentCenter;
    answer1Label.numberOfLines = 3;
    [scroller addSubview:answer1Label];
    
    answer2Label = [[UILabel alloc] initWithFrame: answer2Button.frame];
    answer2Label.text = self.quiz.ans2;
    answer2Label.backgroundColor = [UIColor clearColor];
    answer2Label.textColor = [UIColor whiteColor];//colorWithRed:27/255.0 green:135/255.0 blue:195/255.0 alpha:1.0];
    answer2Label.font = [UIFont lightQuizInterfaceFontOfSize:14.0f];
    answer2Label.textAlignment = NSTextAlignmentCenter;
    answer2Label.numberOfLines = 3;
    [scroller addSubview:answer2Label];
    
    answer3Label = [[UILabel alloc] initWithFrame: answer3Button.frame];
    answer3Label.text = self.quiz.ans3;
    answer3Label.backgroundColor = [UIColor clearColor];
    answer3Label.textColor = [UIColor whiteColor];
    answer3Label.font = [UIFont lightQuizInterfaceFontOfSize:14.0f];
    answer3Label.textAlignment = NSTextAlignmentCenter;
    answer3Label.numberOfLines = 3;
    [scroller addSubview:answer3Label];
    
    answer4Label = [[UILabel alloc] initWithFrame: answer4Button.frame];
    answer4Label.text = self.quiz.ans4;
    answer4Label.backgroundColor = [UIColor clearColor];
    answer4Label.textColor = [UIColor whiteColor];
    answer4Label.font = [UIFont lightQuizInterfaceFontOfSize:14.0f];
    answer4Label.textAlignment = NSTextAlignmentCenter;
    answer4Label.numberOfLines = 3;
    [scroller addSubview:answer4Label];
}

-(void)nextButton {
    
    UIImage *btn = [UIImage imageNamed:@"button-classic-gray-up"];
    UIImage *stretchBtn = [btn stretchableImageWithLeftCapWidth:5.0 topCapHeight:0.0];
    UIImageView *btnImageView = [[UIImageView alloc]initWithImage:stretchBtn];
    btnImageView.frame = CGRectMake(0, 250, stretchBtn.size.width, stretchBtn.size.height);
    
    UIImage *btnPressed = [UIImage imageNamed:@"button-classic-gray-down"];
    UIImage *stretchBtnPressed = [btnPressed stretchableImageWithLeftCapWidth:5.0 topCapHeight:0.0];
    UIImageView *btnPressedImageView = [[UIImageView alloc]initWithImage:stretchBtnPressed];
    btnPressedImageView.frame = CGRectMake(0, 250.0, stretchBtnPressed.size.width, stretchBtnPressed.size.height);
    
    /*NEXT BUTTON*/
    _nextButton = [[UIButton alloc] initWithFrame:CGRectMake(1.0f, 509.0f, 159.0f, 60.0f)];
    [_nextButton setBackgroundImage:stretchBtn forState:UIControlStateNormal];
    [_nextButton setTitle:@"Next" forState:UIControlStateNormal];
    [_nextButton setTitleColor:[UIColor colorWithRed:27/255.0 green:135/255.0 blue:195/255.0 alpha:1.0] forState:UIControlStateNormal];
    [_nextButton setTitle:@"Next" forState:UIControlStateSelected];
    [_startButton setBackgroundImage:stretchBtnPressed forState:UIControlStateHighlighted];
    [_nextButton setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
    [_nextButton setTitle:@"Quiz Done" forState:UIControlStateDisabled];
    [_nextButton setTitleColor:[UIColor whiteColor] forState:UIControlStateDisabled];
    [_nextButton addTarget:self action:@selector(startAgain:) forControlEvents:UIControlEventTouchUpInside];
    _nextButton.titleLabel.font = [UIFont boldQuizInterfaceFontOfSize:16.0f];
    [scroller addSubview:_nextButton];
    
    
}

- (void)tryAgainButton {
    
    UIImage *btn = [UIImage imageNamed:@"button-classic-red-up"];
    UIImage *stretchBtn = [btn stretchableImageWithLeftCapWidth:5.0 topCapHeight:0.0];
    UIImageView *btnImageView = [[UIImageView alloc]initWithImage:stretchBtn];
    btnImageView.frame = CGRectMake(0, 250, stretchBtn.size.width, stretchBtn.size.height);
    
    UIImage *btnPressed = [UIImage imageNamed:@"button-classic-red-down"];
    UIImage *stretchBtnPressed = [btnPressed stretchableImageWithLeftCapWidth:5.0 topCapHeight:0.0];
    UIImageView *btnPressedImageView = [[UIImageView alloc]initWithImage:stretchBtnPressed];
    btnPressedImageView.frame = CGRectMake(0, 250.0, stretchBtnPressed.size.width, stretchBtnPressed.size.height);
    
    
    /*START AGAIN BUTTON*/
    _startButton = [[UIButton alloc] initWithFrame:CGRectMake(5.0f, 444.0f, 310.0f, 60.0f)];
    [_startButton setBackgroundImage:stretchBtn forState:UIControlStateNormal];
    [_startButton setTitle:@"Try Again" forState:UIControlStateNormal];
    [_startButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_startButton setTitle:@"Try Again" forState:UIControlStateSelected];
    [_startButton setBackgroundImage:stretchBtnPressed forState:UIControlStateHighlighted];
    [_startButton setTitleColor:[UIColor colorWithRed:51/255.0 green:130/255.0 blue:190/255.0 alpha:1.0] forState:UIControlStateHighlighted];
    [_startButton setTitle:@"" forState:UIControlStateDisabled];
    [_startButton setTitleColor:[UIColor clearColor] forState:UIControlStateDisabled];
    [_startButton addTarget:self action:@selector(reset:) forControlEvents:UIControlEventTouchUpInside];
    _startButton.titleLabel.font = [UIFont boldQuizInterfaceFontOfSize:16.0f];
    [scroller addSubview:_startButton];
    [_startButton setHidden:YES];
    
    
}

- (void)resultButtons
{
    
    UIImage *btn = [UIImage imageNamed:@"button-classic-blue-up"];
    UIImage *stretchBtn = [btn stretchableImageWithLeftCapWidth:5.0 topCapHeight:0.0];
    UIImageView *btnImageView = [[UIImageView alloc]initWithImage:stretchBtn];
    btnImageView.frame = CGRectMake(0, 250, stretchBtn.size.width, stretchBtn.size.height);
    
    UIImage *btnPressed = [UIImage imageNamed:@"button-classic-blue-down"];
    UIImage *stretchBtnPressed = [btnPressed stretchableImageWithLeftCapWidth:5.0 topCapHeight:0.0];
    UIImageView *btnPressedImageView = [[UIImageView alloc]initWithImage:stretchBtnPressed];
    btnPressedImageView.frame = CGRectMake(0, 250.0, stretchBtnPressed.size.width, stretchBtnPressed.size.height);
    
    /*RESULT BUTTON*/
    _resultButton = [[UIButton alloc] initWithFrame:CGRectMake(163.0f, 509.0f, 159.0f, 60.0f)];
    [_resultButton setBackgroundImage:stretchBtn forState:UIControlStateNormal];
    [_resultButton setTitle:@"Result" forState:UIControlStateNormal];
    [_resultButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_resultButton setTitle:@"Result" forState:UIControlStateSelected];
    [_resultButton setBackgroundImage:stretchBtnPressed forState:UIControlStateHighlighted];
    [_resultButton setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
    [_resultButton addTarget:self action:@selector(finishButtonTouched:) forControlEvents:UIControlEventTouchUpInside];
    _resultButton.titleLabel.font = [UIFont boldQuizInterfaceFontOfSize:16.0f];
    [scroller addSubview:_resultButton];
    [_resultButton setHidden:NO];
    [_resultButton setEnabled:NO];
    
    
}

- (void)emailButton {
    
    UIImage *btn = [UIImage imageNamed:@"button-alerts-orange-up"];
    UIImage *stretchBtn = [btn stretchableImageWithLeftCapWidth:5.0 topCapHeight:0.0];
    UIImageView *btnImageView = [[UIImageView alloc]initWithImage:stretchBtn];
    btnImageView.frame = CGRectMake(0, 250, stretchBtn.size.width, stretchBtn.size.height);
    
    UIImage *btnPressed = [UIImage imageNamed:@"button-alerts-blue-up"];
    UIImage *stretchBtnPressed = [btnPressed stretchableImageWithLeftCapWidth:5.0 topCapHeight:0.0];
    UIImageView *btnPressedImageView = [[UIImageView alloc]initWithImage:stretchBtnPressed];
    btnPressedImageView.frame = CGRectMake(0, 250.0, stretchBtnPressed.size.width, stretchBtnPressed.size.height);
    
    _email = [[UIButton alloc] initWithFrame:CGRectMake(81.0f, 316.0f, 174.0f, 40.0f)];
    [_email setBackgroundImage:stretchBtn forState:UIControlStateNormal];
    [_email setTitle:@"Email the Result" forState:UIControlStateNormal];
    [_email setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_email setTitle:@"Email the Result" forState:UIControlStateSelected];
    [_email setBackgroundImage:stretchBtnPressed forState:UIControlStateHighlighted];
    [_email setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
    [_email addTarget:self action:@selector(emailResult:) forControlEvents:UIControlEventTouchUpInside];
    _email.titleLabel.font = [UIFont boldQuizInterfaceFontOfSize:15.0f];
    [self.popupView addSubview:_email];
    
    
}

- (void) showQuestionButtons {
    
    self.answer1Button.hidden = NO;
    self.answer2Button.hidden = NO;
    self.answer3Button.hidden = NO;
    self.answer4Button.hidden = NO;
    //_resultButton.hidden = YES;
    
    self.answer1Label.hidden = NO;
    self.answer2Label.hidden = NO;
    self.answer3Label.hidden = NO;
    self.answer4Label.hidden = NO;
    
    _answer4.hidden = NO;
    
    _background.hidden = YES;
    [_background setHidden:YES];
}

- (void) hideQuestionButtons {
    self.answer1Button.hidden = YES;
    self.answer2Button.hidden = YES;
    self.answer3Button.hidden = YES;
    self.answer4Button.hidden = YES;
    //_resultButton.hidden = NO;
    self.answer1Label.hidden = YES;
    self.answer2Label.hidden = YES;
    self.answer3Label.hidden = YES;
    self.answer4Label.hidden = YES;
    
    _answer4.hidden = YES;
    _background.hidden = NO;
    [_background setHidden:NO];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) quizDone {
    if (self.quiz.correctCount) {
        //self.statusLabel.text = [NSString stringWithFormat:@"Quiz Done - Score %d%%", self.quiz.quizCount/self.quiz.correctCount];
        //[self.startButton setTitle:@"Try Again" forState:UIControlStateNormal];
        [_nextButton setHidden:NO];
        [_nextButton setEnabled:NO];
        [_startButton setHidden:NO];
        [_resultButton setHidden:NO];
        [_resultButton setEnabled:YES];
        [self.questionLabel setHidden:YES];
        
        [self hideQuestionButtons];
        [_background setHidden:NO];
        
        [self showResult];
        
        //QuizTipViewController *results = [self.storyboard instantiateViewControllerWithIdentifier:@"results"];
        //[self.navigationController pushViewController:results animated:YES];
        
    } else {
        self.statusLabel.text = @"Quiz Done - Score 0%";
    }
    self.quizIndex = 10;
}

- (void) nextQuizQuestion {
    if (self.quizIndex == 10) {
        self.quizIndex = 0;
        self.statusLabel.text = [NSString stringWithFormat:@"Remaining questions: %ld", (long)self.quiz.quizCount];
        NSLog(@"Initial Questions");
        NSLog(@"count: %ld", (long)self.quizIndex);
        NSLog(@"count: %ld", (long)self.quiz.quizCount);
        [self showQuestionButtons];
        [_startButton setHidden:YES];
        [_resultButton setHidden:NO];
        [_resultButton setEnabled:NO];
        [_nextButton setHidden:NO];
        //[self showAll];
    }  else if (self.quizIndex < (self.quiz.quizCount - 1)){
        self.quizIndex++;
        NSLog(@"Add 1");
    }
    else {
        self.quizIndex = 0;
        //[self hideAll];
        [self quizDone];
        //[self showResult];
        //[_nextButton setEnabled:NO];
        //_nextButton.enabled = NO;
        NSLog(@"1");
        
    }
    
    if ((self.quizIndex) < self.quiz.quizCount) {
        [self.quiz nextQuestion:self.quizIndex];
        self.questionLabel.text = self.quiz.question;
        self.answer1Label.text = self.quiz.ans1;
        self.answer2Label.text = self.quiz.ans2;
        self.answer3Label.text = self.quiz.ans3;
        self.answer4Label.text = self.quiz.ans4;
        [self showQuestionButtons];
    } else {
        self.quizIndex = 0;
        [self quizDone];
        //[self showResult];
        
        //[self hideAll];
        NSLog(@"2");
        
        
    }
    //[self showQuestionButtons];
    
    
}

-(void)checkAnswer {
    
    if([self.quiz checkQuestion:self.quizIndex forAnswer:self.answer])
    {
        self.quiz.total += 1;
        UIAlertView *rightAlertView  = [[UIAlertView alloc]initWithTitle:@"CORRECT!" message: nil delegate:self cancelButtonTitle:@"Next" otherButtonTitles: nil];
        NSLog(@"Alert created");
        [rightAlertView show];
        [[LocalyticsSession shared] tagEvent:@"Correct"];
    }
    else
    {
        UIAlertView *wrongAlertView = [[UIAlertView alloc]initWithTitle:@"TRY AGAIN!" message:nil delegate:self cancelButtonTitle:@"Next" otherButtonTitles: nil];
        NSLog(@"Alert created");
        [wrongAlertView show];
        [[LocalyticsSession shared] tagEvent:@"Incorrect"];
    }
    
    self.statusLabel.text = [NSString stringWithFormat:@"Correct : %ld Incorrect : %ld", (long)self.quiz.correctCount, (long)self.quiz.incorrectCount];
    [self hideQuestionButtons];
    //self.startButton.hidden = NO;
    
    [_nextButton setTitle:@"Next" forState:UIControlStateNormal];
}

-(void)ans1Action:(id)sender {
    self.answer = 1;
    [self checkAnswer];
}

-(void)ans2Action:(id)sender {
    self.answer = 2;
    [self checkAnswer];
}

-(void)ans3Action:(id)sender {
    self.answer = 3;
    [self checkAnswer];
}

-(void)ans4Action:(id)sender {
    self.answer = 4;
    [self checkAnswer];
}

-(IBAction)startAgain:(id)sender {
    
    if ((self.quizIndex) < self.quiz.quizCount) {
        [self nextQuizQuestion];
        NSLog(@"Next");
    }
    else {
        self.quizIndex = 0;
        [self quizDone];
        [self showResult];
        [_nextButton setEnabled:NO];
        _nextButton.enabled = NO;
        [_nextButton setHidden:NO];
        [self hideQuestionButtons];
        [self.questionLabel setHidden:YES];
        [_resultButton setHidden:NO];
        [_resultButton setEnabled:YES];
        [_startButton setHidden:NO];
        NSLog(@"End");
    }
}

-(IBAction)reset:(id)sender {
    self.quizIndex = 10;
    [self nextQuizQuestion];
    [_nextButton setEnabled:YES];
}


/*
 -(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 if ([segue.identifier isEqualToString:@"TipModal"]) {
 QuizTipViewController *detailViewController = (QuizTipViewController *)segue.destinationViewController;
 detailViewController.delegate = self;
 detailViewController.tipText = self.quiz.tip;
 }
 }*/

-(void)showResult{
    
    //NSLog(@"status %ld%d,%d(long)",self.quiz.correctCount,self.quiz.incorrectCount);
    self.grade= @"";
    int sum = self.quiz.incorrectCount+self.quiz.correctCount;
    
    double percent = (double)self.quiz.correctCount/(double)sum;
    
    percent *= 100;
    if (percent >=90) {
        self.grade = [NSString stringWithFormat:@" Grade - A , You got %.0f%% ",percent];
    }
    else if (percent >= 80 &&  percent < 90)
    {
        self.grade = [NSString stringWithFormat:@" Grade - B , You got %.0f%% ",percent];
        
    }
    else if (percent >= 70 &&  percent < 80)
    {
        self.grade = [NSString stringWithFormat:@" Grade - C , You got %.0f%% ",percent];
    }
    else
    {
        self.grade = [NSString stringWithFormat:@" Grade - D , You got %.0f%% ",percent];
        
    }
    NSLog(@"%@",self.grade);
    
    [(UILabel *)[self.popupView viewWithTag:-1] setText:self.grade];
    [self hideQuestionButtons];
    [self attachPopUpAnimation];
    [self emailButton];
    [[LocalyticsSession shared] tagEvent:self.grade];
    
}

//Finish Quiz
-(IBAction)finishButtonTouched:(UIButton *)sender
{
    [self showResult];
}

- (IBAction)emailResult:(UIButton *)sender {
    
    NSString *stringSubject = @"Kabbalah Quiz Score";
    //NSString *stringMessage = @"";
    
    [self sendMail:nil
        andSubject:stringSubject
           andBody:self.grade];
    
}

- (IBAction)closeButtonTouched:(UIButton *)sender {
    
    [[self popupView] setHidden:YES];
}

- (void)sendMail:(NSArray*)mailIDs andSubject:(NSString*)subject andBody:(NSString*)body {
    
    if ([MFMailComposeViewController canSendMail])
    {
        // setup mail object
        MFMailComposeViewController * mailView = [[MFMailComposeViewController alloc] init];
        
        // set delegate
        [mailView setMailComposeDelegate:self];
        
        // set to arrays
        [mailView setToRecipients:mailIDs];
        
        // set subject
        [mailView setSubject:subject];
        
        // set body of mail
        body=[NSString stringWithFormat:@"<div><p>%@</p></div>", body];
        
        [mailView setMessageBody:body isHTML:YES];
        
        
        // show the default mail of iPhone on present view
        [self presentViewController:mailView animated:YES completion:nil];
        //        [[self navigationController] presentViewController:mailView animated:YES completion:nil];
        
    }
}

- (void)mailComposeController:(MFMailComposeViewController*)controller
          didFinishWithResult:(MFMailComposeResult)result
                        error:(NSError*)error {
    switch (result)
    {
        case MFMailComposeResultFailed:
        {
            
        }
            break;
        case MFMailComposeResultCancelled:
        {
            
        }
            break;
        case MFMailComposeResultSaved:
        {
            
        }
            
            break;
            
            
        case MFMailComposeResultSent:
            
            [[[UIAlertView alloc] initWithTitle:@"Success!"
                                        message:@"Your mail has been sent successfully."
                                       delegate:self
                              cancelButtonTitle:@"OK"
                              otherButtonTitles:nil, nil] show];
            
            break;
            
    }
    // remove model from current view
    //[self dismissModalViewControllerAnimated:YES];
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark -
#pragma mark - Other Methods
//add alert like animation

- (void) attachPopUpAnimation
{
    
    [self.popupView setHidden:NO];
    CAKeyframeAnimation *animation = [CAKeyframeAnimation
                                      animationWithKeyPath:@"transform"];
    
    CATransform3D scale1 = CATransform3DMakeScale(0.5, 0.5, 1);
    CATransform3D scale2 = CATransform3DMakeScale(1.2, 1.2, 1);
    CATransform3D scale3 = CATransform3DMakeScale(0.9, 0.9, 1);
    CATransform3D scale4 = CATransform3DMakeScale(1.0, 1.0, 1);
    
    NSArray *frameValues = [NSArray arrayWithObjects:
                            [NSValue valueWithCATransform3D:scale1],
                            [NSValue valueWithCATransform3D:scale2],
                            [NSValue valueWithCATransform3D:scale3],
                            [NSValue valueWithCATransform3D:scale4],
                            nil];
    [animation setValues:frameValues];
    
    NSArray *frameTimes = [NSArray arrayWithObjects:
                           [NSNumber numberWithFloat:0.0],
                           [NSNumber numberWithFloat:0.5],
                           [NSNumber numberWithFloat:0.9],
                           [NSNumber numberWithFloat:1.0],
                           nil];
    [animation setKeyTimes:frameTimes];
    
    animation.fillMode = kCAFillModeForwards;
    animation.removedOnCompletion = NO;
    animation.duration = .5;
    
    [self.popupView.layer addAnimation:animation forKey:@"popup"];
}

@end
