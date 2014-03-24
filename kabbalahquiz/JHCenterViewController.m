//
//  JHCenterViewController.m
//  Jewish Holidays
//
//  Created by Rockstar. on 8/24/13.
//  Copyright (c) 2013 Bnei Baruch USA. All rights reserved.
//

#import "JHCenterViewController.h"
#import "AppDelegate.h"
//#import "JTCollection.h"
#import "JTCollectionViewCell.h"
//#import "JHBlogDetailViewController.h"


@interface JHCenterViewController () 
{
    NSArray *videoImages;
    NSArray *videoTitle;
    
}

@property (nonatomic, retain) NSArray *list;
@property (nonatomic, retain) NSMutableDictionary *listImages;

-(void)getAll;

@end

@implementation JHCenterViewController


- (id)init {
    self = [super init];
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    //[[LocalyticsSession shared] tagScreen:@"Center"];
    //[[LocalyticsSession shared] tagEvent:@"Main"];
    //[Flurry logEvent:@"Center"];
        
    self.listImages = [NSMutableDictionary dictionary];
    [self getAll];
    
    self.title = @"Video";
    
    UIColor* collBg = [UIColor colorWithPatternImage:[UIImage imageNamed:@"settings_bg_tile"]];
    [self.collectionView setBackgroundColor:collBg];
    
    UIColor* bgColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"general_bg_tile"]];
    [self.view setBackgroundColor:bgColor];
    
    //self.navigationItem.leftBarButtonItem = [self leftButtonForCenterPanel];
    
    //self.navigationItem.revealSidebarDelegate = self;
    
    //self.navigationItem.titleView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"nav-title.png"]];
	// Do any additional setup after loading the view.
}
/*
- (UIBarButtonItem *)leftButtonForCenterPanel {
    //return [[UIBarButtonItem alloc] initWithImage:[[self class] defaultImage] style:UIBarButtonItemStylePlain target:self action:@selector(toggleLeftPanel:)];
    _menu = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 30, 30)];
    [_menu setImage:[UIImage imageNamed:@"navigation_bar_button_icon_menu.png"] forState:UIControlStateNormal];
    [_menu addTarget:self action:@selector(revealLeftSidebar:) forControlEvents:UIControlEventTouchUpInside];
    return [[UIBarButtonItem alloc] initWithCustomView:_menu];
}*/

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - CollectionView
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return [_list count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    JTCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];
    /*JTCollection *schema = [self.list objectAtIndex:indexPath.row];
    
    [cell.title setText:schema.title];
    cell.image.image = [UIImage imageNamed:[schema cellImage]];*/
    
    [cell setBackgroundColor:[UIColor colorWithRed:25.0 green:96.0 blue:148.0 alpha:1.0]];
    
    
    return cell;
}

#pragma mark Receive Wall Objects
- (void)getAll
{
    /*JTCollection* anti1 = [[JTCollection alloc]init];
    JTCollection* anti2 = [[JTCollection alloc]init];
    JTCollection* inter = [[JTCollection alloc]init];
    JTCollection* raising = [[JTCollection alloc]init];
    JTCollection* soul = [[JTCollection alloc]init];
    JTCollection* tikkun = [[JTCollection alloc]init];
    
    //Rosh
    anti1.title = @"Rosh Hashnah";
    anti1.cellImage = @"rosh-hashanah.jpg";
    anti1.detailText = @"Rosh Hashana explained from a deeper perspective with Kabbalist Dr. Michael Laitman.";
    anti1.videoBGImage = @"VideoFrame1.png";
    anti1.url = @"http://m.kab.tv/ios/JHolidays/videos/Rosh_Hashana.mp4";
    
    //Yom
    anti2.title = @"Yom Kippur";
    anti2.cellImage = @"yom-kippur.jpg";
    anti2.detailText = @"The wisdom of the Kabbalah describes the sequence of situations the creature experiences in the complex relationship between him and the Creator. These situations evolve one after the other because they lead the creature from one degree to the next, just like a chemical or a physical process that must evolve gradually, step by step.\n\nThe Creator-creature relationship is experienced by man in a very tangible manner, no less than the reality we live in. It is not about fantasy or delusions, but about the discovery of a beautiful world where the changes that occur follow strict and well-defined laws. These laws are discovered by anyone who climbs the spiritual ladder, and he knows it because he can read in the holy books that his predecessors came to the exact same places that he sees before him right now.";
    anti2.videoBGImage = @"VideoFrame2.png";
    anti2.url = @"http://m.kab.tv/ios/JHolidays/videos/Yom_Kippur.mp4";
    
    //Hannukah
    inter.title = @"Hannukah";
    inter.cellImage = @"hannukah.jpg";
    inter.detailText = @"There is a root in the spiritual world for all that exists - a root that initiates and motivates our behavior, our thoughts, our emotions, and the various events we experience. Everything that we can possibly imagine.\n\nThe wisdom of Kabbalah describes the enchanted reality as it is revealed to those who have reached the world of the spirit. Anyone wishing to understand the course of our lives can reach that world. It offers those who come to its gates a chance to consciously control their lives, to attain a supreme delight they have never felt before.";
    inter.videoBGImage = @"VideoFrame3.png";
    inter.url = @"http://m.kab.tv/ios/JHolidays/videos/Hannukah.mp4";
    
    //Passover
    raising.title = @"Passover - Part 1";
    raising.cellImage = @"passover1.jpg";
    raising.detailText = @"The holiday of Passover embodies the exodus of man from the sensation of our world to the sensation of the spiritual world. During our life, various unpleasant events are constantly coming upon us from somewhere. They come from the upper world, and descend upon us in our world. We are trying to react to them somehow but we do not know exactly how to go about doing this, because we do not understand their causes.\n\nAnd most importantly, we do not see the consequences of our steps because they also go to the upper world. We are like the blind kittens, in the middle of a chain who have no idea where the beginning and end are. Because of this, we cannot learn from our own actions without seeing their results. And we usually act completely senselessly from the perspective of the perfection of eternal life.";
    raising.videoBGImage = @"VideoFrame4.png";
    raising.url = @"http://m.kab.tv/ios/JHolidays/videos/Passover1.mp4";
    
    
    //Passover
    soul.title = @"Passover - Part 2";
    soul.cellImage = @"passover2.jpg";
    soul.detailText = @"The holiday of Passover embodies the exodus of man from the sensation of our world to the sensation of the spiritual world. During our life, various unpleasant events are constantly coming upon us from somewhere. They come from the upper world, and descend upon us in our world. We are trying to react to them somehow but we do not know exactly how to go about doing this, because we do not understand their causes.\n\nAnd most importantly, we do not see the consequences of our steps because they also go to the upper world. We are like the blind kittens, in the middle of a chain who have no idea where the beginning and end are. Because of this, we cannot learn from our own actions without seeing their results. And we usually act completely senselessly from the perspective of the perfection of eternal life.";
    soul.videoBGImage = @"VideoFrame5.png";
    soul.url = @"http://m.kab.tv/ios/JHolidays/videos/Passover2.mp4";
    
    //Purim
    tikkun.title = @"Purim";
    tikkun.cellImage = @"purim.jpg";
    tikkun.detailText = @"Purim - the holiday of opposites - joy vs. grief, concealment vs. disclosure, Mordechay vs. Haman, genocide vs. redemption.\n\nWhat is the true story behind this holiday?\n\nWhich forces act in the open and what goes on behind the scenes of this juicy holiday?\n\nA Kabbalist is a person who seeks deep inside the causes for the events in his life . It is evident to him that whatever it is he is about to discover, already lies within him, waiting. All he has to learn is how to come in contact with the force that makes things happen. That force will lead and guide him to control the future events of his life, his personal happiness and the bounty that will flow through him to the whole of mankind.";
    tikkun.videoBGImage = @"VideoFrame6.png";
    tikkun.url = @"http://m.kab.tv/ios/JHolidays/videos/Purim.mp4";

    
    self.list = [NSArray arrayWithObjects:anti1, anti2, inter, raising, soul, tikkun, nil];*/
}

#pragma mark - UICollectionViewDelegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    //[self performSegueWithIdentifier:@"detail" sender:self];
    
}
- (void)collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath {
    
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    /*JHBlogDetailViewController *tvc = (JHBlogDetailViewController *)segue.destinationViewController;
    NSIndexPath * indexPath = [[self.collectionView indexPathsForSelectedItems]lastObject];
    JTCollection * schema = [self.list objectAtIndex:indexPath.row];
    
    tvc.schema = schema;
    [self.collectionView deselectItemAtIndexPath:indexPath animated:YES];*/
    
    
    //[self.navigationController presentViewController:tvc animated:YES completion:nil];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    [self.navigationController popViewControllerAnimated:YES];
}

@end
