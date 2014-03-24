//
//  JHBlogCell.h
//  Jewish Holidays
//
//  Created by Rockstar. on 8/31/13.
//  Copyright (c) 2013 Bnei Baruch USA. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JHBlogCell : UITableViewCell

@property (nonatomic, strong) IBOutlet UILabel *blogTitle;
@property (nonatomic, strong) IBOutlet UILabel *blogSubTitle;
@property (nonatomic, strong) IBOutlet UILabel *blogThr;
@property (nonatomic, strong) IBOutlet UILabel *blogCategory;

@property (nonatomic, strong) IBOutlet UIImageView *blogImageView;
@property (nonatomic, strong) IBOutlet UIImageView *blogCellBackground;
@property (nonatomic, strong) IBOutlet UIImageView *blogImagePlaceholder;


@end
