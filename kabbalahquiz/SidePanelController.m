//
//  SidePanelController.m
//  Jewish Holidays
//
//  Created by Rockstar. on 8/24/13.
//  Copyright (c) 2013 Bnei Baruch USA. All rights reserved.
//

#import "SidePanelController.h"
#import "JASidePanelController.h"


@interface SidePanelController ()

@end

@implementation SidePanelController

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(void) awakeFromNib
{
    [self setLeftPanel:[self.storyboard instantiateViewControllerWithIdentifier:@"lvc"]];
    [self setCenterPanel:[self.storyboard instantiateViewControllerWithIdentifier:@"cvc"]];
    //[self setRightPanel:[self.storyboard instantiateViewControllerWithIdentifier:@"rvc"]];
    //[self setCenterPanel:[self.storyboard instantiateViewControllerWithIdentifier:@"purposevc"]];
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
