//
//  ZDDate.m
//  Transfer
//
//  Created by Zach Dingels on 12/30/13.
//  Copyright (c) 2013 GnarWare. All rights reserved.
//

#import "ZDDate.h"

// Enumerate each month to make em easier to work with.
typedef enum month {
	january=1,
	febuary,
	march,
	april,
	may,
	june,
	july,
	august,
	september,
	october,
	november,
	december
	
} month;

@interface ZDDate ()

- (void)nextMonth;

@end

@implementation ZDDate

// Initiate the date with a specific month day and year
- (id)initWithDay:(int)day month:(int)month year:(int)year
{
	self = [super init];
	
	if (self) {
		self.day = day;
		self.month = month;
		self.year = year;
		self.julianDate = ( 1461 * ( self.year + 4800 + ( self.month - 14 ) / 12 ) ) / 4 + ( 367 * ( self.month - 2 - 12 * ( ( self.month - 14 ) / 12 ) ) ) / 12 - ( 3 * ( ( self.year + 4900 + ( self.month - 14 ) / 12 ) / 100 ) ) / 4 + self.day - 32075; // algorithm for the julian date -- not mine
	}

	return self;
}

- (id)init {
	self = [super init];
	return [self initWithDay:6 month:6 year:1995]; // Fuck yea
}

- (id)initWithNSDate:(NSDate *)date
{
	// Variables to make everything clean
	int day;
	int month;
	int year;
	
	// Get a date in the form of a string with the format dd/mm/yyyy e.x. 06/06/1995
	NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
	[dateFormat setDateFormat:@"dd/MM/yyyy"];
	NSString *dateString = [dateFormat stringFromDate:date];
	
	// Splice the string and get the day, month and year, then convert them to ints.
	NSString *d = [dateString substringToIndex:2];
	NSString *m = [dateString substringWithRange:NSMakeRange(3, 5)];
	NSString *y = [dateString substringFromIndex:6];
	day = [d intValue];
	month = [m intValue];
	year = [y intValue];
	
	// Create the date
	return [self initWithDay:day month:month year:year];
}

// Initiate the date to have the current date.
- (id)initWithCurrentDate
{
	NSDate *today = [NSDate date];
	return [self initWithNSDate:today];
}

- (void)nextDay
{
	bool isLeapYear = self.year % 4 == 0;
	if (self.day >= 28) {
		// If its the last day of the month change months
		if (self.day == 31) {
			[self nextMonth];
		} else if ((self.month == april || self.month == june || self.month == september || self.month == november) && self.day == 30) {
			[self nextMonth];
		} else if (self.month == febuary && ((!isLeapYear && self.day == 28) || (self.day == 29))) {
			[self nextMonth];
		} else {
			self.day++;
		}
	} else {
		self.day++;
	}
	
	self.julianDate++;
}

- (void)nextMonth
{
	if (self.month == 12) {
		self.month = 1;
		self.year++;
	} else {
		self.month++;
	}
	self.day = 1;
}

- (void)previousDay
{
	bool isLeapYear = self.year % 4 == 0;
	// If its the first day of the month, go back a month
	if (self.day == 1) {
		if (self.month == january) {
			self.year--;
		}
		if (self.month == may || self.month == july || self.month == october || self.month == december) {
			self.day = 30;
		} else if (self.month == march) {
			if (isLeapYear) {
				self.day = 29;
			} else {
				self.day = 28;
			}
		} else {
			self.day = 31;
		}
		self.month = (self.month - 1) % 12;
		
	} else {
		self.day--;
	}
	
	self.julianDate--;
}

- (NSString *)toString
{
	// Helps debug, turns date into a pretty string
	NSArray *months = [[NSArray alloc] initWithObjects:@"January", @"Febuary", @"March", @"April", @"May", @"June", @"July", @"August", @"September", @"October", @"November", @"December", nil];
	NSString *date = [[NSString alloc] initWithFormat:@"%@ %d, %d", months[self.month - 1], self.day, self.year];
	return date;
}

- (NSDate *)toNSDate
{
	// Converts the ZDDate to a NSDate by pluggin in the day month and year into a date formater.
	NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
	[formatter setDateFormat:@"ddmmyyyy"];
	NSDate *date = [formatter dateFromString:[NSString stringWithFormat:@"%02d%02d%d", _day, _month, _year]];
	return date;
}

@end
