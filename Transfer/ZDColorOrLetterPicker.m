//
//  ZDColorOrLetterPicker.m
//  Transfer
//
//  Created by Zach Dingels on 5/6/14.
//  Copyright (c) 2014 GnarWare. All rights reserved.
//

#import "ZDColorOrLetterPicker.h"
#import "ZDTransferTicket.h"
#import "ZDAppDelegate.h"

@interface ZDColorOrLetterPicker () {
	ZDTransferTicket *ticket;
}

@end

@implementation ZDColorOrLetterPicker

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
	
}

- (void)viewWillAppear:(BOOL)animated {
    [self.navigationController setNavigationBarHidden:false];
	[[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault];
	
	[self.mainView setBackgroundColor:ticket.color];
	[self.colorButton setBackgroundColor:ticket.color];
	[self.letterButton setBackgroundColor:ticket.color];
	[self.aboutButton setBackgroundColor:ticket.color];
}

- (void)viewDidDisappear:(BOOL)animated {
	[self.colorButton setSelected:FALSE];
	[self.letterButton setSelected:FALSE];
	[self.aboutButton setSelected:FALSE];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
	[self.navigationController setNavigationBarHidden:true];
}

@end
