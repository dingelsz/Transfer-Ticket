//
//  ZDFlatButton.m
//  Transfer
//
//  Created by Zach Dingels on 5/8/14.
//  Copyright (c) 2014 GnarWare. All rights reserved.
//

#import "ZDFlatButton.h"

@interface ZDFlatButton () {
	bool isTouched;
}

@end

@implementation ZDFlatButton

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
		// stuff
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder {
	self = [super initWithCoder:aDecoder];
	self.outlineColor = [UIColor whiteColor];
	self.hasOutline = false;
	return self;
}

- (void)drawRect:(CGRect)rect {
	CGContextRef context = UIGraphicsGetCurrentContext();
	
	int width = 0;
	int height = 0;
	
	// Create a black rectangle the size of the button and fill it in,
	UIColor *tempOutlineColor = [UIColor whiteColor];
	UIColor *tempFillColor = self.backgroundColor;
	
	if (self.isSelected) {
		width = 4;
		height = 4;
	}
	
	if (isTouched) {
		CGColorRef colorRef = [tempFillColor CGColor];
		const CGFloat * comp = CGColorGetComponents(colorRef);
		tempFillColor = [[UIColor alloc] initWithRed:comp[0] * 1.2 green:comp[1] * 1.2 blue:comp[2] * 1.2 alpha:comp[3]];
	}
	
	CGRect outlineRect = CGRectMake(0, 0, rect.size.width, rect.size.height);
	CGContextSetFillColorWithColor(context, [tempOutlineColor CGColor]);
	CGContextFillRect(context, outlineRect);
	
	CGRect fillRect = CGRectMake(width, width, rect.size.width - (width * 2), rect.size.height - (height * 2));
	CGContextSetFillColorWithColor(context, [tempFillColor CGColor]);
	CGContextFillRect(context, fillRect);
	
	UIGraphicsEndImageContext();
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
	NSLog(@"button Touched");
	[super touchesBegan:touches withEvent:event];
	isTouched = true;
	[self setNeedsDisplay];
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
	NSLog(@"Button touch ended");
	isTouched = false;
	[self setNeedsDisplay];
	[super touchesEnded:touches withEvent:event];
}

@end
