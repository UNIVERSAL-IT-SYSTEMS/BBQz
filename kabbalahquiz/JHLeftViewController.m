//
//  JHLeftViewController.m
//  Jewish Holidays
//
//  Created by Rockstar. on 9/2/13.
//  Copyright (c) 2013 Bnei Baruch USA. All rights reserved.
//

#import "JHLeftViewController.h"
#import "JTCell.h"
#import <QuartzCore/QuartzCore.h>
#import "JASidePanelController.h"

#import "UIViewController+JASidePanel.h"



@interface JHLeftViewController ()

@property (nonatomic, retain) NSArray *list;
@property (nonatomic, retain) NSDictionary *feedbackItems;

@end

@implementation JHLeftViewController
@synthesize feedbackTableView;
@synthesize cellImage;


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIColor* bgColor = [UIColor colorWithRed:51/255.0 green:51/255.0 blue:51/255.0 alpha:1.0];
    [self.view setBackgroundColor:bgColor];
    
    [self.feedbackTableView setDelegate:self];
    [self.feedbackTableView setDataSource:self];
    
    NSArray *title = @[@"Intro to Kabbalah",
                      @"Purpose of Creation",
                      @"Perception of Reality",
                      @"The Intention",
                      @"Kabbalistc Language",
                      @"World Peace",
                      @"Free Will - Part 1",
                      @"Free Will - Part 2",
                      @"Inner Work",
                      @"Creation & Evolution"];
    
    
    [self setCellImage:@[@"icon-1-70x70.png",
                        @"icon-2-70x70.png",
                        @"icon-3-70x70.png",
                        @"icon-4-70x70.png",
                        @"icon-5-70x70.png",
                        @"icon-6-70x70.png",
                        @"icon-7-70x70.png",
                        @"icon-8-70x70.png",
                        @"icon-9-70x70.png",
                        @"icon-10-70x70.png"]];
    
    NSDictionary *temp = @{@"Menu": title};
    self.feedbackItems = temp;
    self.list = [self.feedbackItems allKeys];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return [self.list count];
}

/*
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    //UIView* headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, tableView.frame.size.width, 100)];
    //headerView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"menu_label_row_bg"]];
    UILabel *title = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, tableView.frame.size.width, 100)];
    title.text = @"   Menu";
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7) {
        title.text = @"";
    }
    title.textColor = [UIColor colorWithRed:27/255.0 green:135/255.0 blue:195/255.0 alpha:1.0];
    title.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"menu_label_row_bg"]];
    title.font = [UIFont boldSystemFontOfSize:14];
    //[headerView addSubview:title];
    
    return title;
    
    
}*/

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, tableView.frame.size.width, 0.1)];
    headerView.backgroundColor = [UIColor clearColor];
    
    return headerView;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    
    UIView* headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, tableView.frame.size.width, 0.1)];
    headerView.backgroundColor = [UIColor colorWithRed:204/255.0 green:204/255.0 blue:204/255.0 alpha:1.0];
    
    return headerView;
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 5;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return .5;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    NSArray *listData =(self.feedbackItems)[(self.list)[section]];
	return [listData count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"JTCell";
    
    NSArray *listData =(self.feedbackItems)[(self.list)[[indexPath section]]];
    
    JTCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if(cell == nil) {
        
        cell = [[JTCell alloc]
                initWithStyle:UITableViewCellStyleDefault
                reuseIdentifier:CellIdentifier];
        
		/*cell = [[[UITableViewCell alloc]
         initWithStyle:UITableViewCellStyleSubtitle
         reuseIdentifier:SimpleTableIdentifier] autorelease];
         */
	}
    
    NSUInteger row = [indexPath row];
	cell.blogTitle.text = listData[row];
    cell.blogTitle.textColor = [UIColor colorWithRed:27/255.0 green:135/255.0 blue:195/255.0 alpha:1.0];
    
    NSString *cellImagePic = [self cellImage][[indexPath row]];
    UIImage *cellIcon = [UIImage imageNamed:cellImagePic];
    [[cell blogImageView] setImage:cellIcon];
    
    UIView *bgColor = [[UIView alloc] init];
    bgColor.backgroundColor = [UIColor clearColor];
    [cell setBackgroundView:bgColor];
    
    UIView *bgColorView = [[UIView alloc] init];
    bgColorView.backgroundColor = [UIColor clearColor];
    [cell setSelectedBackgroundView:bgColorView];
    
    // Configure the cell...
    
    return cell;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSArray *listData =(self.feedbackItems)[(self.list)[[indexPath section]]];
    NSUInteger row = [indexPath row];
	NSString *rowValue = listData[row];
	NSString *str = rowValue;
    
    if ([str isEqual:@"Intro to Kabbalah"]) {
        
        self.sidePanelController.centerPanel = [self.storyboard instantiateViewControllerWithIdentifier:@"cvc"];
        
    }
    else if ([str isEqual:@"Purpose of Creation"]){
        
       self.sidePanelController.centerPanel = [self.storyboard instantiateViewControllerWithIdentifier:@"purposevc"];
        
    }
    
    else if ([str isEqual:@"Perception of Reality"]){
        
        self.sidePanelController.centerPanel = [self.storyboard instantiateViewControllerWithIdentifier:@"perceptionvc"];
    }
    
    else if ([str isEqual:@"The Intention"]){
        
        self.sidePanelController.centerPanel = [self.storyboard instantiateViewControllerWithIdentifier:@"intentionvc"];
    }
    
    else if ([str isEqual:@"Kabbalistc Language"]) {
        self.sidePanelController.centerPanel = [self.storyboard instantiateViewControllerWithIdentifier:@"languagevc"];
    }
    
    else if ([str isEqual:@"World Peace"]) {
        self.sidePanelController.centerPanel = [self.storyboard instantiateViewControllerWithIdentifier:@"worldvc"];
    }
    
    else if ([str isEqual:@"Free Will - Part 1"]) {
        self.sidePanelController.centerPanel = [self.storyboard instantiateViewControllerWithIdentifier:@"fw1vc"];
    }
    
    else if ([str isEqual:@"Free Will - Part 2"]) {
        self.sidePanelController.centerPanel = [self.storyboard instantiateViewControllerWithIdentifier:@"fw2vc"];
    }
    
    else if ([str isEqual:@"Inner Work"]) {
        self.sidePanelController.centerPanel = [self.storyboard instantiateViewControllerWithIdentifier:@"innervc"];
    }
    
    else if ([str isEqual:@"Creation & Evolution"]) {
        self.sidePanelController.centerPanel = [self. storyboard instantiateViewControllerWithIdentifier:@"creationvc"];
    }
    
    
    //[self.feedbackTableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
