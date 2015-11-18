//
//  ZDTransferTicket.h
//  Transfer
//
//  Created by Zach Dingels on 12/30/13.
//  Copyright (c) 2013 GnarWare. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZDDate.h"

extern UIColor * const BLACK;

@interface ZDTransferTicket : NSObject

// Constants
+ (UIColor *)BLACK;
+ (UIColor *)BLUE;
+ (UIColor *)GREEN;
+ (UIColor *)ORANGE;
+ (UIColor *)PINK;
+ (UIColor *)PURPLE;

@property (nonatomic, readonly) int colorIndex;
@property (nonatomic, strong) UIColor *color;

@property (nonatomic, readonly) int letterIndex;
@property (nonatomic, strong) NSString *letter;

@property (nonatomic, strong) ZDDate *date;
@property (nonatomic, strong) ZDDate *refrenceDate;

- (void)setReferenceTransferDate:(ZDDate *)date color:(int)color letter:(int)letter;

- (void)saveData;

-(void) next;
-(void) previous;

@end
