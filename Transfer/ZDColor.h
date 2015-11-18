//
//  ZDColor.h
//  Transfer
//
//  Created by Zach Dingels on 1/10/14.
//  Copyright (c) 2014 GnarWare. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZDColor : NSObject

- (id)initWithTitle:(NSString *)title color:(UIColor *)color;
- (id)initWithTitle:(NSString *)title red:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue alpha:(CGFloat)alpha;
- (id)initWithColor:(UIColor *)color;
- (id)initWithRed:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue alpha:(CGFloat)alpha;


@property (nonatomic) UIColor *color;
@property (nonatomic) NSString *title;

@end
