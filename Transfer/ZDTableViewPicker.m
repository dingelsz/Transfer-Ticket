//
//  ZDTableViewPicker.m
//  Transfer
//
//  Created by Zach Dingels on 1/7/14.
//  Copyright (c) 2014 GnarWare. All rights reserved.
//

#import "ZDTableViewPicker.h"
#import "ZDViewController.h"
#import "ZDAppDelegate.h"

@interface ZDTableViewPicker ()
{
	bool isTableDataColor;
}

@end

@implementation ZDTableViewPicker

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Will either be Color or Letter
	if ([_tableData isEqualToString:@"Color"]) {
		isTableDataColor = TRUE;
		_tableItems = [[NSArray alloc] initWithObjects:@"Black", @"Blue", @"Green", @"Orange", @"Pink", @"Purple", nil];
	} else {
		isTableDataColor = FALSE;
		_tableItems = [[NSArray alloc] initWithObjects:@"A", @"D", @"H", @"J", @"N", @"S", @"T", @"X", nil];
	}
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section, either number of colors or letters
	return [_tableItems count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	// Create a new cell and see if it can be copied, if it can't make a new one.
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
	if (cell == Nil) {
		cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
	}
    cell.textLabel.text = _tableItems[indexPath.row];
	
	/*
	// Get the main view so you can get acces to the current transfer ticketr
	NSArray *controllers = [self.navigationController viewControllers];
	ZDViewController *vc = controllers[0];
	 */
	
	/* NO LONGER WORKS
	// Depending on the menu set a check mark for the active color/letter
	NSInteger i = indexPath.row;
	if (isTableDataColor && [vc.transfer getColorIndex] == i) {
		[cell setAccessoryType:UITableViewCellAccessoryCheckmark];
	} else if (!isTableDataColor && [vc.transfer  getLetterIndex] == i ) {
		[cell setAccessoryType:UITableViewCellAccessoryCheckmark];
	}
	 */
    return cell;
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
	// Clean this up with a protocol.
	// Uncheck the old selection, just do em all
	
	for (int i = 0; i < _tableItems.count; i++) {
		[[tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:i inSection:0]] setAccessoryType:UITableViewCellAccessoryNone];
	}
	
	// Load the shared ticket
	ZDAppDelegate *appDelegate = [UIApplication sharedApplication].delegate;
	ZDTransferTicket *ticket = appDelegate.ticket;
	
	/* NO LONGER WORKS
	// Depending on the table change the transfer tickets color or letter
	if (isTableDataColor) {
		[ticket setColorWithInt:(int) indexPath.row];
	} else {
		[ticket setLetterWithInt:(int) indexPath.row];
	}
	*/
	// Check the newly selected cell
	[[tableView cellForRowAtIndexPath:indexPath] setAccessoryType:UITableViewCellAccessoryCheckmark];
	[ticket saveData]; // Sets whatever was picked to be a refrence when starting the app.
	
	// Go to the previous screen, natural
	[self.navigationController popViewControllerAnimated:YES];
	
}

@end
