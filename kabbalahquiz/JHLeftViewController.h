//
//  JHLeftViewController.h
//  Jewish Holidays
//
//  Created by Rockstar. on 9/2/13.
//  Copyright (c) 2013 Bnei Baruch USA. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JHLeftViewController : UIViewController<UITableViewDataSource, UITableViewDelegate>{
    
    NSArray *cellImage;
}

@property (nonatomic, retain) NSArray *cellImage;

@property (nonatomic, strong) IBOutlet UITableView *feedbackTableView;



@end
