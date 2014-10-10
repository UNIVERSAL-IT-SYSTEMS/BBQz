//
//  PagedScrollViewIpad.m
//  kabbalahquiz
//
//  Created by Rockstar. on 1/17/14.
//  Copyright (c) 2014 Bnei Baruch USA. All rights reserved.
//

#import "PagedScrollViewIpad.h"

@interface PagedScrollViewIpad ()<UIScrollViewDelegate>
@property (nonatomic) BOOL pageControlIsChangingPage;
@end

@implementation PagedScrollViewIpad

#define PAGECONTROL_DOT_WIDTH 20
#define PAGECONTROL_HEIGHT 20

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        
        self.scrollViewIpad = [[UIScrollView alloc] initWithFrame:frame];
        self.scrollViewIpad.backgroundColor = [UIColor whiteColor];
        self.pageControlIpad = [[UIPageControl alloc] init];
        [self setDefaults];
        [self.pageControlIpad addTarget:self action:@selector(changePage:) forControlEvents:UIControlEventValueChanged];
        [self addSubview:self.scrollViewIpad];
        [self addSubview:self.pageControlIpad];
        self.scrollViewIpad.delegate = self;
        
        self.scrollViewIpad.autoresizesSubviews = YES;
        self.scrollViewIpad.contentOffset = CGPointZero;
        self.scrollViewIpad.directionalLockEnabled = NO;
    }
    return self;
}

- (void)setFrame:(CGRect)frame {
    [super setFrame:frame];
    
    self.scrollViewIpad.frame = CGRectMake(0,0, frame.size.width, frame.size.height);
    self.scrollViewIpad.contentSize = CGSizeMake(frame.size.width * self.pageControlIpad.numberOfPages, frame.size.height);
    CGRect scrollFrame = CGRectMake(frame.size.width * self.pageControlIpad.currentPage, 0.f, frame.size.width, frame.size.height);
    [self.scrollViewIpad scrollRectToVisible:scrollFrame animated:NO];
    self.pageControlIsChangingPage = YES;
    self.pageControlPos = self.pageControlPos;
    [self.scrollViewIpad.subviews enumerateObjectsUsingBlock:^(UIView *v, NSUInteger i, BOOL *stop)
     {
         v.frame = CGRectMake(self.frame.size.width * i, 0.f, self.frame.size.width, self.frame.size.height);
         [v setNeedsLayout];
     }];
}

- (void)setPageControlPos:(enum PageControlIpadPosition)pageControlPos
{
    CGFloat width = PAGECONTROL_DOT_WIDTH * self.pageControlIpad.numberOfPages;
    _pageControlPos = pageControlPos;
    if (pageControlPos == PageControlPositionIpadRightCorner)
    {
        self.pageControlIpad.frame = CGRectMake(self.scrollViewIpad.frame.size.width - width, self.scrollViewIpad.frame.size.height - PAGECONTROL_HEIGHT, width, PAGECONTROL_HEIGHT);
    }else if (pageControlPos == PageControlPositionIpadCenterBottom)
    {
        self.pageControlIpad.frame = CGRectMake((self.scrollViewIpad.frame.size.width - width) / 2, self.scrollViewIpad.frame.size.height - PAGECONTROL_HEIGHT, width, PAGECONTROL_HEIGHT);
    }else if (pageControlPos == PageControlPositionIpadLeftCorner)
    {
        self.pageControlIpad.frame = CGRectMake(0, self.scrollViewIpad.frame.size.height - PAGECONTROL_HEIGHT, width, PAGECONTROL_HEIGHT);
    }
}

- (void)setDefaults
{
    //Magenta
    UIColor *tintColor = [UIColor colorWithRed:203.f/255.f green:86.f/255.f blue:142.f/255.f alpha:1.f];
    self.pageControlIpad.currentPageIndicatorTintColor = tintColor;
    self.pageControlIpad.pageIndicatorTintColor = [UIColor darkGrayColor];
    self.pageControlIpad.hidesForSinglePage = YES;
    self.scrollViewIpad.pagingEnabled = YES;
    self.scrollViewIpad.showsVerticalScrollIndicator = NO;
    self.scrollViewIpad.showsHorizontalScrollIndicator = NO;
    self.pageControlPos = PageControlPositionIpadCenterBottom;
}

- (void)setScrollViewContents: (NSArray *)views
{
    //remove original subviews first.
    for (UIView *subview in [self.scrollViewIpad subviews]) {
        [subview removeFromSuperview];
    }
    if (views.count <= 0) {
        self.pageControlIpad.numberOfPages = 0;
        return;
    }
    self.scrollViewIpad.contentSize = CGSizeMake(self.scrollViewIpad.frame.size.width * views.count, self.scrollViewIpad.frame.size.height);
    
    [views enumerateObjectsUsingBlock:^(UIView *v, NSUInteger i, BOOL *stop)
     {
         v.frame = CGRectMake(self.frame.size.width * i, v.frame.origin.y, v.frame.size.width, v.frame.size.height);
         [self.scrollViewIpad addSubview:views[i]];
     }];
    self.pageControlIpad.numberOfPages = views.count;
    //call pagecontrolpos setter.
    self.pageControlPos = self.pageControlPos;
}

- (void)changePage:(UIPageControl *)sender
{
    CGRect frame = self.scrollViewIpad.frame;
    frame.origin.x = frame.size.width * self.pageControlIpad.currentPage;
    frame.origin.y = 0;
    frame.size = self.scrollViewIpad.frame.size;
    [self.scrollViewIpad scrollRectToVisible:frame animated:YES];
    self.pageControlIsChangingPage = YES;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if (self.pageControlIsChangingPage) {
        return;
    }
    CGFloat pageWidth = scrollView.frame.size.width;
    //switch page at 50% across
    int page = (int)floor((scrollView.contentOffset.x - pageWidth / 2) / pageWidth) + 1;
    self.pageControlIpad.currentPage = page;
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    self.pageControlIsChangingPage = NO;
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    self.pageControlIsChangingPage = NO;
}

@end
