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

#import "JHCenterViewController.h"
#import "JHBlogViewController.h"
#import "JHArticlesViewController.h"
#import "JHMoreViewController.h"

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
    
    NSArray *title = [[NSArray alloc] initWithObjects:
                      @"Video",
                      @"Articles",
                      @"Blog",
                      @"More Info",nil];
    
    
    [self setCellImage:[NSArray arrayWithObjects:
                  @"menu_icon_airplay.png",
                  @"menu_icon_activity.png",
                  @"menu_icon_tips_news.png",
                  @"menu_icon_settings.png", nil]];
    
    NSDictionary *temp = [[NSDictionary alloc]initWithObjectsAndKeys:title, @"Menu", nil];
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

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    //UIView* headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, tableView.frame.size.width, 100)];
    //headerView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"menu_label_row_bg"]];
    UILabel *title = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, tableView.frame.size.width, 100)];
    title.text = @"   Menu";
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7) {
        title.text = @"";
    }
    title.textColor = [UIColor colorWithRed:171/255.0 green:171/255.0 blue:171/255.0 alpha:1.0];
    title.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"menu_label_row_bg"]];
    title.font = [UIFont boldSystemFontOfSize:14];
    //[headerView addSubview:title];
    
    return title;
    
    
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    
    UIView* headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, tableView.frame.size.width, 100)];
    headerView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"menu_label_row_bg"]];
    
    return headerView;
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    NSArray *listData =[self.feedbackItems objectForKey:[self.list objectAtIndex:section]];
	return [listData count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"JTCell";
    
    NSArray *listData =[self.feedbackItems objectForKey:
                        [self.list objectAtIndex:[indexPath section]]];
    
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
	cell.blogTitle.text = [listData objectAtIndex:row];
    
    NSString *cellImagePic = [[self cellImage] objectAtIndex:[indexPath row]];
    UIImage *cellIcon = [UIImage imageNamed:cellImagePic];
    [[cell blogImageView] setImage:cellIcon];
    
    UIView *bgColor = [[UIView alloc] init];
    bgColor.backgroundColor = [UIColor colorWithRed:51/255.0 green:51/255.0 blue:51/255.0 alpha:1.0];
    [cell setBackgroundView:bgColor];
    
    UIView *bgColorView = [[UIView alloc] init];
    bgColorView.backgroundColor = [UIColor colorWithRed:32/255.0 green:32/255.0 blue:32/255.0 alpha:1.0];
    [cell setSelectedBackgroundView:bgColorView];
    
    // Configure the cell...
    
    return cell;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSArray *listData =[self.feedbackItems objectForKey:
                        [self.list objectAtIndex:[indexPath section]]];
    NSUInteger row = [indexPath row];
	NSString *rowValue = [listData objectAtIndex:row];
	NSString *str = rowValue;
    
    if ([str isEqual:@"Video"]) {
        
        self.sidePanelController.centerPanel = [self.storyboard instantiateViewControllerWithIdentifier:@"cvc"];
        
    }
    else if ([str isEqual:@"Articles"]){
        
       self.sidePanelController.centerPanel = [self.storyboard instantiateViewControllerWithIdentifier:@"avc"];
        
    }
    
    else if ([str isEqual:@"Blog"]){
        
        self.sidePanelController.centerPanel = [self.storyboard instantiateViewControllerWithIdentifier:@"bvc"];
    }
    
    else if ([str isEqual:@"More Info"]){
        
        self.sidePanelController.centerPanel = [self.storyboard instantiateViewControllerWithIdentifier:@"mvc"];
    }
    
    //[self.feedbackTableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
