//
//  PagedScrollViewIpad.h
//  kabbalahquiz
//
//  Created by Rockstar. on 1/17/14.
//  Copyright (c) 2014 Bnei Baruch USA. All rights reserved.
//

#import <UIKit/UIKit.h>

enum PageControlIpadPosition {
    PageControlPositionIpadRightCorner = 0,
    PageControlPositionIpadCenterBottom = 1,
    PageControlPositionIpadLeftCorner = 2,
};


@interface PagedScrollViewIpad : UIView

@property (nonatomic, strong) UIScrollView *scrollViewIpad;
@property (nonatomic, strong) UIPageControl *pageControlIpad;
@property (nonatomic, assign) enum PageControlIpadPosition pageControlPos; //default is PageControlPositionRightCorner

- (void)setScrollViewContents: (NSArray *)views;

@end
