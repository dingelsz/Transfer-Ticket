//
//  ZDColor.m
//  Transfer
//
//  Created by Zach Dingels on 1/10/14.
//  Copyright (c) 2014 GnarWare. All rights reserved.
//

#import "ZDColor.h"

@implementation ZDColor

- (id)initWithTitle:(NSString *)title color:(UIColor *)color {
	self = [super init];
	if (self) {
		self.color = color;
		self.title = title;
	}
	return self;
}

- (id)initWithTitle:(NSString *)title red:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue alpha:(CGFloat)alpha {
	return [self initWithTitle:title color:[[UIColor alloc] initWithRed:red green:green blue:blue alpha:alpha]];
}

- (id)initWithColor:(UIColor *)color {
	return [self initWithTitle:@"Color" color:color];
}

- (id)initWithRed:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue alpha:(CGFloat)alpha {
	return [self initWithTitle:@"Color" red:red green:green blue:blue alpha:alpha];
}

- (id)init {
	// Default set the title to Color and the color to black
	return [self initWithTitle:@"Color" red:1 green:1 blue:1 alpha:1];
}

@end
