//
//  Quiz.m
//  QuoteQuiz
//
//  Created by Rockstar. on 3/24/14.
//  Copyright (c) 2014 Bnei Baruch USA. All rights reserved.
//

#import "Quiz.h"

@interface Quiz()

@property (nonatomic, strong) NSString *question;
@property (nonatomic, strong) NSString *ans1;
@property (nonatomic, strong) NSString *ans2;
@property (nonatomic, strong) NSString *ans3;
@property (nonatomic, strong) NSString *ans4;

@end

@implementation Quiz

-(instancetype)initWithQuiz:(NSString *)plistName {

    if ((self = [super init])) {
        NSString *plistCatPath = [[NSBundle mainBundle] pathForResource:plistName ofType:@"plist"];
        self.quizArray = [NSMutableArray arrayWithContentsOfFile:plistCatPath];
        self.quizCount = [self.quizArray count];
        NSLog(@"Quiz Count - %ld", (long)self.quizCount);
        self.tipCount = 0;
        self.total = 0;
    }
    return self;
}

-(void) nextQuestion: (NSUInteger) idx {

    self.question = [NSString stringWithFormat:@"%@", self.quizArray[idx][@"question"]];
    self.ans1 = self.quizArray[idx][@"ans1"];
    self.ans2 = self.quizArray[idx][@"ans2"];
    self.ans3 = self.quizArray[idx][@"ans3"];
    self.ans4 = self.quizArray[idx][@"ans4"];
    self.tip = self.quizArray[idx][@"tip"];
    
    //If you are just starting the quiz
    if (idx == 0) {
        self.correctCount = 0;
        self.incorrectCount = 0;
        self.tipCount = 0;
        self.total = 0;
    }
    
}

-(BOOL) checkQuestion: (NSUInteger) question forAnswer: (NSUInteger) answer {

    NSString *correctAnswer = self.quizArray[question][@"answer"];
    if ([correctAnswer intValue] == answer) {
        self.correctCount ++;
        self.total = +1;
        return YES;
    } else {
        self.incorrectCount++;
        self.total = +1;
        return NO;
    }
    
}

@end
