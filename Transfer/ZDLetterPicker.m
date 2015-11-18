//
//  ZDLetterPicker.m
//  Transfer
//
//  Created by Zach Dingels on 5/6/14.
//  Copyright (c) 2014 GnarWare. All rights reserved.
//

#import "ZDLetterPicker.h"
#import "ZDAppDelegate.h"

@interface ZDLetterPicker () {
	ZDTransferTicket *ticket;
	UIButton *currentButton;
	UIButton *touchedButton;
}

@end

@implementation ZDLetterPicker

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Get the ticket from the app delegate
	ZDAppDelegate *appDelegate = [UIApplication sharedApplication].delegate;
	ticket = appDelegate.ticket;
	
	// Set the background of all buttons
	[self.buttonA setBackgroundColor:ticket.color];
	[self.buttonD setBackgroundColor:ticket.color];
	[self.buttonH setBackgroundColor:ticket.color];
	[self.buttonJ setBackgroundColor:ticket.color];
	[self.buttonN setBackgroundColor:ticket.color];
	[self.buttonS setBackgroundColor:ticket.color];
	[self.buttonT setBackgroundColor:ticket.color];
	[self.buttonX setBackgroundColor:ticket.color];
	
	// Depending on the current letter assaing a current button
	switch (ticket.letterIndex) {
		case 0:
			currentButton = self.buttonA;
			break;
		case 1:
			currentButton = self.buttonD;
			break;
		case 2:
			currentButton = self.buttonH;
			break;
		case 3:
			currentButton = self.buttonJ;
			break;
		case 4:
			currentButton = self.buttonN;
			break;
		case 5:
			currentButton = self.buttonS;
			break;
		case 6:
			currentButton = self.buttonT;
			break;
		case 7:
			currentButton = self.buttonX;
			break;
		default:
			break;
	}
	// Make the current button stand out.
	[currentButton setSelected:TRUE];
	
}

- (void)viewWillAppear:(BOOL)animated {
	[[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)ButtonPressed:(UIButton *)sender {
	// When someone pressed the button change the old button to black, change that button to the color, update the ticket and pop to the last view
	[currentButton setSelected:false];
	[sender setSelected:true];
	
	[ticket setLetter:sender.titleLabel.text];
	[ticket saveData];
	
	[self.navigationController popViewControllerAnimated:YES];
	
}

@end
