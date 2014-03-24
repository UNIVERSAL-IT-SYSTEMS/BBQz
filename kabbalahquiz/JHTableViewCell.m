//
//  JHTableViewCell.m
//  Jewish Holidays
//
//  Created by Rockstar. on 8/31/13.
//  Copyright (c) 2013 Bnei Baruch USA. All rights reserved.
//

#import "JHTableViewCell.h"

@interface JHTableViewCellView : UIView

@end

@interface JHTableViewSelectedCellView: UIView

@end

@implementation JHTableViewCellView

- (id)initWithFrame:(CGRect)frame {
	if((self = [super initWithFrame:frame])) {
		self.contentMode = UIViewContentModeRedraw;
	}
    
	return self;
}

- (void)drawRect:(CGRect)rect {
	[(JHTableViewCell *)[self superview] drawContentView:rect highlighted:NO];
}

@end

@implementation JHTableViewSelectedCellView

- (id)initWithFrame:(CGRect)frame {
	if((self = [super initWithFrame:frame])) {
		self.contentMode = UIViewContentModeRedraw;
	}
    
	return self;
}

- (void)drawRect:(CGRect)rect {
	[(JHTableViewCell *)[self superview] drawContentView:rect highlighted:YES];
}


@end

@implementation JHTableViewCell
@synthesize title;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if(self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
		contentView = [[JHTableViewCellView alloc] initWithFrame:CGRectZero];
		contentView.opaque = YES;
		self.backgroundView = contentView;
        
		selectedContentView = [[JHTableViewSelectedCellView alloc] initWithFrame:CGRectZero];
		selectedContentView.opaque = YES;
		self.selectedBackgroundView = selectedContentView;
        
    }
    
    return self;
}

- (void)setSelected:(BOOL)selected {
	[selectedContentView setNeedsDisplay];
    
	if(!selected && self.selected) {
		[contentView setNeedsDisplay];
	}
    
	[super setSelected:selected];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
	[selectedContentView setNeedsDisplay];
    
	if(!selected && self.selected) {
		[contentView setNeedsDisplay];
	}
    
	[super setSelected:selected animated:animated];
}

- (void)setHighlighted:(BOOL)highlighted {
	[selectedContentView setNeedsDisplay];
    
	if(!highlighted && self.highlighted) {
		[contentView setNeedsDisplay];
	}
    
	[super setHighlighted:highlighted];
}

- (void)setHighlighted:(BOOL)highlighted animated:(BOOL)animated {
	[selectedContentView setNeedsDisplay];
    
	if(!highlighted && self.highlighted) {
		[contentView setNeedsDisplay];
	}
    
	[super setHighlighted:highlighted animated:animated];
}

- (void)setFrame:(CGRect)f {
	[super setFrame:f];
	CGRect b = [self bounds];
	// b.size.height -= 1; // leave room for the seperator line
	[contentView setFrame:b];
	[selectedContentView setFrame:b];
}

- (void)setNeedsDisplay {
	[super setNeedsDisplay];
	[contentView setNeedsDisplay];
    
	if([self isHighlighted] || [self isSelected]) {
		[selectedContentView setNeedsDisplay];
	}
}

- (void)setNeedsDisplayInRect:(CGRect)rect {
	[super setNeedsDisplayInRect:rect];
	[contentView setNeedsDisplayInRect:rect];
    
	if([self isHighlighted] || [self isSelected]) {
		[selectedContentView setNeedsDisplayInRect:rect];
	}
}

- (void)layoutSubviews {
	[super layoutSubviews];
	self.contentView.hidden = YES;
	[self.contentView removeFromSuperview];
}

- (void)drawContentView:(CGRect)rect highlighted:(BOOL)highlighted {
	// subclasses should implement this
}


@end
