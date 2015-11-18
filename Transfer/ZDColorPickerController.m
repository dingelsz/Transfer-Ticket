//
//  ZDColorPickerController.m
//  Transfer
//
//  Created by Zach Dingels on 5/6/14.
//  Copyright (c) 2014 GnarWare. All rights reserved.
//

#import "ZDColorPickerController.h"
#import "ZDTransferTicket.h"
#import "ZDAppDelegate.h"

@interface ZDColorPickerController () {
	ZDTransferTicket *ticket;
	
	UIButton *currentButton;
}

@end

@implementation ZDColorPickerController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
		
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	[[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
	// Get the ticket from the app delegate
	ZDAppDelegate *appDelegate = [UIApplication sharedApplication].delegate;
	ticket = appDelegate.ticket;
	
	// Set each buttons color to its name.
	[self.blackButton setBackgroundColor:[ZDTransferTicket BLACK]];
	[self.blueButton setBackgroundColor:[ZDTransferTicket BLUE]];
	[self.greenButton setBackgroundColor:[ZDTransferTicket GREEN]];
	[self.orangeButton setBackgroundColor:[ZDTransferTicket ORANGE]];
	[self.pinkButton setBackgroundColor:[ZDTransferTicket PINK]];
	[self.purpleButton setBackgroundColor:[ZDTransferTicket PURPLE]];
	
	// Figure out which button is the current color of the ticket
	switch (ticket.colorIndex) {
		case 0: // BLACK
			currentButton = self.blackButton;
			break;
		case 1: // BLUE
			currentButton = self.blueButton;
			break;
		case 2: // ORANGE
			currentButton = self.greenButton;
			break;
		case 3: // GREEN
			currentButton = self.orangeButton;
			break;
		case 4: // PINK
			currentButton = self.pinkButton;
			break;
		case 5: // PURPLE
			currentButton = self.purpleButton;
			break;
			
		default:
			break;
	}
	// Make the current button stand out.
	[currentButton setSelected:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)blackButtonPressed:(id)sender {
	[self buttonPressed:sender :[ZDTransferTicket BLACK]];
}

- (IBAction)blueButtonPressed:(id)sender {
	[self buttonPressed:sender :[ZDTransferTicket BLUE]];
}

- (IBAction)greenButtonPressed:(id)sender {
	[self buttonPressed:sender :[ZDTransferTicket GREEN]];
}

- (IBAction)orangeButtonPressed:(id)sender {
	[self buttonPressed:sender :[ZDTransferTicket ORANGE]];
}

- (IBAction)pinkButtonPressed:(id)sender {
	[self buttonPressed:sender :[ZDTransferTicket PINK]];
}

- (IBAction)purpleButtonPressed:(id)sender {
	[self buttonPressed:sender :[ZDTransferTicket PURPLE]];
}

- (void)buttonPressed:(UIButton *)button :(UIColor *)color {
	// Change which buttons are selected
	[currentButton setSelected:FALSE];
	[button setSelected:true];
	
	// Update the ticket and save the data
	[ticket setColor:color];
	[ticket saveData];
	
	// Select the new button and pop out.
	[self.navigationController popViewControllerAnimated:YES];
}
@end
