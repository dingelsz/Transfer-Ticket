//
//  ZDTransferTicket.m
//  Transfer
//
//  Created by Zach Dingels on 12/30/13.
//  Copyright (c) 2013 GnarWare. All rights reserved.
//
//  Transfer ticket is used to figure out information about a transfer ticket.
//  The transfer ticket is set to a date and then is changed by to either the next day or the previous day.

#import "ZDTransferTicket.h"

@interface ZDTransferTicket ()
{
	NSArray *colors;
	NSArray *letters;
	
	// Used for initializing, loading and saving.
	int referenceColorIndex;
	int referenceLetterIndex;
}

@end

@implementation ZDTransferTicket
@synthesize color = _color;
@synthesize letter = _letter;
@synthesize colorIndex = _colorIndex;
@synthesize letterIndex = _letterIndex;

+ (UIColor *)BLACK {
	return [[UIColor alloc] initWithRed:45/255.0 green:45/255.0 blue:45/255.0 alpha:1];
}

+ (UIColor *)BLUE {
	return [[UIColor alloc] initWithRed:75/255.0 green:192/255.0 blue:255/255.0 alpha:1];
}

+ (UIColor *)GREEN {
	return [[UIColor alloc] initWithRed:70/255.0 green:228/255.0 blue:70/255.0 alpha:1];
}

+ (UIColor *)ORANGE {
	return [[UIColor alloc] initWithRed:255/255.0 green:185/255.0 blue:67/255.0 alpha:1];
}

+ (UIColor *)PINK {
	return [[UIColor alloc] initWithRed:255/255.0 green:114/255.0 blue:163/255.0 alpha:1];
}

+ (UIColor *)PURPLE {
	return [[UIColor alloc] initWithRed:187/255.0 green:104/255.0 blue:217/255.0 alpha:1];
}

- (id)init
{
	self = [super init];
	if (self) {
		// Create an array of the colors and letters and load the current values for the date, currrent color and
		// currrent letter
		[self initColorsAndLetters];
		
		[self loadData];
		_date = [[ZDDate alloc] initWithCurrentDate];
		// Set the current color and letter index by finding the amount of days since the a reference date, adding the value of that day to it and then modding it by the amount of colors/days to get the current index. i.e. if today is friday and you want to find the day 25 days from now, 25 - 0 = 0 and 25 % 7 (days in week) you get 4 which means the day is 4 days past friday, tuesday.
		_colorIndex = (referenceColorIndex + (_date.julianDate - _refrenceDate.julianDate)) % [colors count];
		_letterIndex = (referenceLetterIndex + (_date.julianDate - _refrenceDate.julianDate)) % [letters count];
	}
	return self;
}

- (void)initColorsAndLetters
{
	// Create an array of all the colors and numbers, used for enumeration.
	colors = [[NSArray alloc] initWithObjects:[ZDTransferTicket BLACK], [ZDTransferTicket BLUE], [ZDTransferTicket GREEN], [ZDTransferTicket ORANGE], [ZDTransferTicket PINK], [ZDTransferTicket PURPLE], nil];
	letters = [[NSArray alloc] initWithObjects:@"A", @"D", @"H", @"J", @"N", @"S", @"T", @"X", nil];
}

- (void)loadData
{
	// Create a string for the index, path and root path aswell as make a format for loading the plist.
	NSString *errorDesc = nil;
	NSPropertyListFormat format;
	NSString *plistPath;
	NSString *rootPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,
															  NSUserDomainMask, YES) objectAtIndex:0];
	plistPath = [rootPath stringByAppendingPathComponent:@"Data.plist"];
	if (![[NSFileManager defaultManager] fileExistsAtPath:plistPath]) {
		plistPath = [[NSBundle mainBundle] pathForResource:@"Data" ofType:@"plist"];
	}
	NSData *plistXML = [[NSFileManager defaultManager] contentsAtPath:plistPath];
	NSDictionary *temp = (NSDictionary *)[NSPropertyListSerialization
										  propertyListFromData:plistXML
										  mutabilityOption:NSPropertyListMutableContainersAndLeaves
										  format:&format
										  errorDescription:&errorDesc];
	if (!temp) {
		NSLog(@"Error reading plist: %@, format: %lu", errorDesc, format);
	}
	
	// Put values into actual variables
	_refrenceDate = [[ZDDate alloc] initWithNSDate:[temp objectForKey:@"date"]];
	NSNumber *loadedColorIndex = [temp objectForKey:@"color"];
	NSNumber *loadedLetterIndex = [temp objectForKey:@"letter"];
	
	referenceColorIndex = [loadedColorIndex intValue];
	referenceLetterIndex = [loadedLetterIndex intValue];
	
}

- (void)saveData {
	
	// Variables to save, The new begining date, color and letter is equal to what was left off.
	NSDate *dateToSave = [_date toNSDate];
	NSNumber *colorIndexToSave = [[NSNumber alloc] initWithInt:_colorIndex];
	NSNumber *letterIndexToSave = [[NSNumber alloc] initWithInt:_letterIndex];
	
	
	NSString *error;
    NSString *rootPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    NSString *plistPath = [rootPath stringByAppendingPathComponent:@"Data.plist"];
	
	//Put all the variables in a dictionary
    NSDictionary *plistDict = [NSDictionary dictionaryWithObjects:
							   [NSArray arrayWithObjects: dateToSave, colorIndexToSave, letterIndexToSave, nil]
														  forKeys:[NSArray arrayWithObjects: @"date", @"color", @"letter", nil]];
	// Put it in a NSData as a plist with a string to hold an error message
	
    NSData *plistData = [NSPropertyListSerialization dataFromPropertyList:plistDict
																   format:NSPropertyListXMLFormat_v1_0
														 errorDescription:&error];
	
	// If plistData got crated then right it to the plist path, if not then log the error
    if(plistData) {
        [plistData writeToFile:plistPath atomically:YES];
    }
    else {
        NSLog(@"%@", error);
    }
}

// Getter methods for the color and the letter of the transfer tickets
- (UIColor *)color
{
	return colors[_colorIndex];
}

- (NSString *)letter
{
	return letters[_letterIndex];
}

- (void)setReferenceTransferDate:(ZDDate *)beginingDate color:(int)color letter:(int)letter
{
	// Put the current data into variables and save them to a PList, they will be referenced the next time a transfer
	// ticket is loaded.
	_refrenceDate = beginingDate;
	referenceColorIndex = color;
	referenceLetterIndex = letter;
	[self saveData];
	
}

- (void)setColor:(UIColor *)color {
	// Make sure to also change the index!
	_colorIndex = (int) [colors indexOfObject:color];
	_color = color;
}

- (void)setLetter:(NSString *)letter {
	// Make sure to also change the index!
	_letterIndex = (int) [letters indexOfObject:letter];
	_letter = letter;
}

-(void) next {
	// Go to the next day by incrementing the color and the letter by one (formula for finding next transfer ticket)
	_colorIndex = (_colorIndex + 1) % [colors count];
	_letterIndex = (_letterIndex + 1) % [letters count];
	[_date nextDay];
}

-(void) previous {
	// For some reason -1 % [colors count] doens't work... so add constant so -1 turns into 5
	_colorIndex = (_colorIndex - 1 + (int)[colors count]) % [colors count];
	_letterIndex = (_letterIndex - 1) % [letters count];
	[_date previousDay];
}

@end
