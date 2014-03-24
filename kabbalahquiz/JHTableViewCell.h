//
//  JHTableViewCell.h
//  Jewish Holidays
//
//  Created by Rockstar. on 8/31/13.
//  Copyright (c) 2013 Bnei Baruch USA. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JHTableViewCell : UITableViewCell{
	UIView* contentView;
	UIView* selectedContentView;
}

@property (nonatomic, strong) IBOutlet UILabel *title;
- (void)drawContentView:(CGRect)rect highlighted:(BOOL)highlighted; // subclasses should implement

@end

