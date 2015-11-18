//
//  ZDHelpViewController.m
//  Transfer
//
//  Created by Zach Dingels on 5/9/14.
//  Copyright (c) 2014 GnarWare. All rights reserved.
//

#import "ZDHelpViewController.h"
#import "ZDTransferTicket.h"
#import "ZDAppDelegate.h"

@interface ZDHelpViewController () {
	ZDTransferTicket *ticket;
}

@end

@implementation ZDHelpViewController

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
	
	[self.view setBackgroundColor:ticket.color];
}

- (void)viewWillAppear:(BOOL)animated {
	[self.navigationController setNavigationBarHidden:false];
	[[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
