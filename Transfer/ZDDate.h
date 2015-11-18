//
//  ZDDate.h
//  Transfer
//
//  Created by Zach Dingels on 12/30/13.
//  Copyright (c) 2013 GnarWare. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZDDate : NSObject

@property int day;
@property int month;
@property int year;
@property int julianDate;

- (id)initWithDay:(int)day month:(int)month year:(int)year;
- (id)initWithNSDate:(NSDate *)date;
- (id)initWithCurrentDate;

- (void)setJulianDate:(int)julianDate;

- (void)nextDay;
- (void)previousDay;

- (NSString *)toString;
- (NSDate *)toNSDate;

@end
