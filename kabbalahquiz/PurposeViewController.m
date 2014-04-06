//
//  PurposeViewController.m
//  kabbalahquiz
//
//  Created by Rockstar. on 3/24/14.
//  Copyright (c) 2014 Bnei Baruch USA. All rights reserved.
//

#import "PurposeViewController.h"
#import "Quiz.h"

@interface QuoteQuizViewController ()

@property (weak, nonatomic) IBOutlet UILabel *questionLabel;
@property (weak, nonatomic) IBOutlet UILabel *statusLabel;
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
}
@synthesize answer1Button, answer2Button, answer3Button, answer4Button;
@synthesize answer1Label, answer2Label, answer3Label, answer4Label;

- (void)viewDidLoad
{
    [super viewDidLoad];
    //self.navigationItem.titleView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"nav-title"]];
    
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
    
    
    /*ANSWER BUTTON*/
    UIImage *btn = [UIImage imageNamed:@"primaryButtonBackground"];
    UIImage *stretchBtn = [btn stretchableImageWithLeftCapWidth:5.0 topCapHeight:0.0];
    UIImageView *btnImageView = [[UIImageView alloc]initWithImage:stretchBtn];
    btnImageView.frame = CGRectMake(0, 200, stretchBtn.size.width, stretchBtn.size.height);
    
    UIImage *btnPressed = [UIImage imageNamed:@"secondaryButtonBackground"];
    UIImage *stretchBtnPressed = [btnPressed stretchableImageWithLeftCapWidth:5.0 topCapHeight:0.0];
    UIImageView *btnPressedImageView = [[UIImageView alloc]initWithImage:stretchBtnPressed];
    btnPressedImageView.frame = CGRectMake(0, 250.0, stretchBtnPressed.size.width, stretchBtnPressed.size.height);
    
    UIImage *bgImage = [UIImage imageNamed:@"downArrow"];
    UIImageView *bg = [[UIImageView alloc] initWithImage:bgImage];
    bg.frame = CGRectMake(160.0f, 230.0f, 35.0f, 86.0f);
    _background = [[UIImageView alloc] initWithFrame:CGRectMake(140.0f, 300.0f, 35.0f, 86.0f)];
    [_background setImage:bgImage];
    [scroller addSubview:_background];
    [_background setHidden:YES];
    
    /*FIRST ANSWER*/
    //[answer1Button setBackgroundImage:stretchBtn forState:UIControlStateNormal];
    //[answer1Button setBackgroundImage:stretchBtnPressed forState:UIControlStateHighlighted];
    
    //_background = [[UIImageView alloc] initWithFrame:CGRectMake(20.0f, 180.0f, <#CGFloat width#>, <#CGFloat height#>)]
    
    
    answer1Button = [[UIButton alloc] initWithFrame:CGRectMake(24.0f, 165.0f, 272.0f, 60.0f)];
    [answer1Button setBackgroundImage:stretchBtn forState:UIControlStateNormal];
    [answer1Button setBackgroundImage:stretchBtnPressed forState:UIControlStateHighlighted];
    [answer1Button addTarget:self action:@selector(ans1Action:) forControlEvents:UIControlEventTouchUpInside];
    [scroller addSubview:answer1Button];
    
    answer1Label = [[UILabel alloc] initWithFrame: answer1Button.frame];
    answer1Label.text = self.quiz.ans1;
    answer1Label.backgroundColor = [UIColor clearColor];
    answer1Label.textColor = [UIColor whiteColor];
    answer1Label.font = [UIFont systemFontOfSize:15.0f];
    answer1Label.textAlignment = NSTextAlignmentCenter;
    answer1Label.numberOfLines = 3;
    [scroller addSubview:answer1Label];
    
    /*SECOND ANSWER*/
    //[answer2Button setBackgroundImage:stretchBtn forState:UIControlStateNormal];
    //[answer2Button setBackgroundImage:stretchBtnPressed forState:UIControlStateHighlighted];
    
    answer2Button = [[UIButton alloc] initWithFrame:CGRectMake(24.0f, 230.0f, 272.0f, 60.0f)];
    [answer2Button setBackgroundImage:stretchBtn forState:UIControlStateNormal];
    [answer2Button setBackgroundImage:stretchBtnPressed forState:UIControlStateHighlighted];
    [answer2Button addTarget:self action:@selector(ans2Action:) forControlEvents:UIControlEventTouchUpInside];
    [scroller addSubview:answer2Button];
    
    answer2Label = [[UILabel alloc] initWithFrame: answer2Button.frame];
    answer2Label.text = self.quiz.ans2;
    answer2Label.backgroundColor = [UIColor clearColor];
    answer2Label.textColor = [UIColor whiteColor];//colorWithRed:27/255.0 green:135/255.0 blue:195/255.0 alpha:1.0];
    answer2Label.font = [UIFont systemFontOfSize:15.0f];
    answer2Label.textAlignment = NSTextAlignmentCenter;
    answer2Label.numberOfLines = 3;
    [scroller addSubview:answer2Label];
    
    /*THIRD ANSWER*/
    //[answer3Button setBackgroundImage:stretchBtn forState:UIControlStateNormal];
    //[answer3Button setBackgroundImage:stretchBtnPressed forState:UIControlStateHighlighted];
    
    answer3Button = [[UIButton alloc] initWithFrame:CGRectMake(24.0f, 295.0f, 272.0f, 60.0f)];
    [answer3Button setBackgroundImage:stretchBtn forState:UIControlStateNormal];
    [answer3Button setBackgroundImage:stretchBtnPressed forState:UIControlStateHighlighted];
    [answer3Button addTarget:self action:@selector(ans3Action:) forControlEvents:UIControlEventTouchUpInside];
    [scroller addSubview:answer3Button];
    
    answer3Label = [[UILabel alloc] initWithFrame: answer3Button.frame];
    answer3Label.text = self.quiz.ans3;
    answer3Label.backgroundColor = [UIColor clearColor];
    answer3Label.textColor = [UIColor whiteColor];
    answer3Label.font = [UIFont systemFontOfSize:15.0f];
    answer3Label.textAlignment = NSTextAlignmentCenter;
    answer3Label.numberOfLines = 3;
    [scroller addSubview:answer3Label];
    
    /*FOURTH ANSWER*/
    //[answer4Button setBackgroundImage:stretchBtn forState:UIControlStateNormal];
    //[answer4Button setBackgroundImage:stretchBtnPressed forState:UIControlStateHighlighted];
    answer4Button = [[UIButton alloc] initWithFrame:CGRectMake(24.0f, 360.0f, 272.0f, 60.0f)];
    [answer4Button setBackgroundImage:stretchBtn forState:UIControlStateNormal];
    [answer4Button setBackgroundImage:stretchBtnPressed forState:UIControlStateHighlighted];
    [answer4Button addTarget:self action:@selector(ans4Action:) forControlEvents:UIControlEventTouchUpInside];
    [scroller addSubview:answer4Button];
    
    
    /*answer4Button = [[UIButton alloc] initWithFrame:CGRectMake(35.0f, 330.0f, 272.0f, 47.0f)];
     [answer4Button setBackgroundColor:[UIColor whiteColor]];
     //[answer4Button setBackgroundImage:stretchBtn forState:UIControlStateNormal];
     [answer4Button setBackgroundImage:stretchBtnPressed forState:UIControlStateHighlighted];
     [answer4Button addTarget:self action:@selector(ans4Action:) forControlEvents:UIControlEventTouchUpInside];
     [scroller addSubview:answer4Button];
     self.answer4Button.layer.borderWidth = 2.0f;
     self.answer4Button.layer.borderColor = [UIColor colorWithRed:27/255.0 green:135/255.0 blue:195/255.0 alpha:1.0].CGColor;*/
    
    answer4Label = [[UILabel alloc] initWithFrame: answer4Button.frame];
    answer4Label.text = self.quiz.ans4;
    answer4Label.backgroundColor = [UIColor clearColor];
    answer4Label.textColor = [UIColor whiteColor];
    answer4Label.font = [UIFont systemFontOfSize:15.0f];
    answer4Label.textAlignment = NSTextAlignmentCenter;
    answer4Label.numberOfLines = 3;
    [scroller addSubview:answer4Label];
    
    /*
     _answer4 = [UIButton buttonWithType:UIButtonTypeCustom];
     _answer4.frame = CGRectMake(0.0f, 400.0f, 320.0f, 42.0f);
     [_answer4 setBackgroundColor:[UIColor whiteColor]];
     [_answer4 setTitle:self.quiz.ans4 forState:UIControlStateNormal];
     [_answer4 setTitleColor:[UIColor colorWithRed:27/255.0 green:135/255.0 blue:195/255.0 alpha:1.0] forState:UIControlStateNormal];
     [_answer4 addTarget:self action:@selector(ans4Action:) forControlEvents:UIControlEventTouchUpInside];
     _answer4.titleLabel.font = [UIFont boldSystemFontOfSize:15.0f];
     [self.view addSubview:_answer4];
     _answer4.layer.borderWidth = 2.0f;
     _answer4.layer.borderColor = [UIColor colorWithRed:85/255.0 green:172/255.0 blue:238/255.0 alpha:1.0].CGColor;*/
    
    
    /*RESULT BUTTON*/
    _resultButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _resultButton.frame = CGRectMake(0.0f, 454.0f, 320.0f, 50.0f);
    [_resultButton setBackgroundColor:[UIColor colorWithRed:51/255.0 green:130/255.0 blue:190/255.0 alpha:1.0]];
    [_resultButton setTitle:@"Result" forState:UIControlStateNormal];
    [_resultButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_resultButton setTitle:@"Result" forState:UIControlStateSelected];
    [_resultButton setTitleColor:[UIColor colorWithRed:27/255.0 green:135/255.0 blue:195/255.0 alpha:1.0] forState:UIControlStateHighlighted];
    [_resultButton addTarget:self action:@selector(finishButtonTouched:) forControlEvents:UIControlEventTouchUpInside];
    _resultButton.titleLabel.font = [UIFont boldSystemFontOfSize:15.0f];
    [scroller addSubview:_resultButton];
    [_resultButton setHidden:YES];
    
    /*NEXT BUTTON*/
    _nextButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _nextButton.frame = CGRectMake(0.0f, 454.0f, 320.0f, 50.0f);
    [_nextButton setBackgroundColor:[UIColor colorWithRed:204/255.0 green:204/255.0 blue:204/255.0 alpha:1.0]];
    [_nextButton setTitle:@"Next" forState:UIControlStateNormal];
    [_nextButton setTitleColor:[UIColor colorWithRed:27/255.0 green:135/255.0 blue:195/255.0 alpha:1.0] forState:UIControlStateNormal];
    [_nextButton setTitle:@"Next" forState:UIControlStateSelected];
    [_nextButton setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
    [_nextButton setTitle:@"" forState:UIControlStateDisabled];
    [_nextButton setTitleColor:[UIColor clearColor] forState:UIControlStateDisabled];
    [_nextButton addTarget:self action:@selector(startAgain:) forControlEvents:UIControlEventTouchUpInside];
    _nextButton.titleLabel.font = [UIFont boldSystemFontOfSize:16.0f];
    [scroller addSubview:_nextButton];
    
    /*START AGAIN BUTTON*/
    _startButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _startButton.frame = CGRectMake(0.0f, 404.0f, 320.0f, 50.0f);
    [_startButton setBackgroundColor:[UIColor colorWithRed:204/255.0 green:204/255.0 blue:204/255.0 alpha:1.0]];
    [_startButton setTitle:@"Try Again" forState:UIControlStateNormal];
    [_startButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [_startButton setTitle:@"Try Again" forState:UIControlStateSelected];
    [_startButton setTitleColor:[UIColor colorWithRed:51/255.0 green:130/255.0 blue:190/255.0 alpha:1.0] forState:UIControlStateHighlighted];
    [_startButton setTitle:@"" forState:UIControlStateDisabled];
    [_startButton setTitleColor:[UIColor clearColor] forState:UIControlStateDisabled];
    [_startButton addTarget:self action:@selector(reset:) forControlEvents:UIControlEventTouchUpInside];
    _startButton.titleLabel.font = [UIFont boldSystemFontOfSize:15.0f];
    [scroller addSubview:_startButton];
    [_startButton setHidden:YES];
    
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
        [_nextButton setHidden:YES];
        [_startButton setHidden:NO];
        [_resultButton setHidden:NO];
        
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
        [_resultButton setHidden:YES];
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
        [_nextButton setHidden:YES];
        [self hideQuestionButtons];
        [_resultButton setHidden:NO];
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
- (void)quizTipDidFinish:(QuizTipViewController *)controller {
    [self dismissViewControllerAnimated:YES completion:^{}];
    
}*/

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
    [[LocalyticsSession shared] tagEvent:self.grade];
    
}

//Finish Quiz
-(IBAction)finishButtonTouched:(UIButton *)sender
{
    [self showResult];
}

- (IBAction)emailResult:(UIButton *)sender {
    
    NSString *stringSubject = @"This is my subject";
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
