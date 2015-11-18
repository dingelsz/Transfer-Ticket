//
//  ZDTableViewController.m
//  Transfer
//
//  Created by Zach Dingels on 1/7/14.
//  Copyright (c) 2014 GnarWare. All rights reserved.
//

#import "ZDTableViewController.h"
#import "ZDTableViewPicker.h"

@interface ZDTableViewController ()

@end

@implementation ZDTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Two options, pressing one opens a menu with all the colors, the other the letters
	_tableItems = [[NSArray alloc] initWithObjects:@"Color", @"Letter", nil];
	
	// Show the navigation bar when entering a menu, need to be able to go back
	[self.navigationController setNavigationBarHidden:false animated:true];
	[[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections, 1
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section, 2
    return [_tableItems count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
	// Make a cell from a resent one... saves memory and shit
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
	
	// If the cell doesn't get initialized then make one
	if (cell == Nil) {
		cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
	}
    
	// Put the cells text to whatever the text in the table is
	[cell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
	cell.textLabel.text = _tableItems[indexPath.row];
    
    return cell;
}

// When a cell is pressed
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
	if (indexPath.row < 2) {
		[self performSegueWithIdentifier:@"segueToColorOrLetter" sender:self];
	}
	// Performe a segue, programatically!
	
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
	if ([segue.identifier isEqualToString:@"segueToColorOrLetter"]) {
		NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
		ZDTableViewPicker *destViewController = segue.destinationViewController;
		// Set the tabledata of the next controller to either Color or Letter and let it figure out what that means
		destViewController.tableData = _tableItems[indexPath.row];
	}
}

@end
