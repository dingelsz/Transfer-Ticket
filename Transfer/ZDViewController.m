//
//  ZDViewController.m
//  Transfer
//
//  Created by Zach Dingels on 12/30/13.
//  Copyright (c) 2013 GnarWare. All rights reserved.
//

#import "ZDViewController.h"
#import "ZDDate.h"
#import "ZDTransferTicket.h"
#import "ZDAppDelegate.h"
//#import "UIButton+ZDFlatButton.h"

@implementation ZDViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Create a new transfer ticket, basically the brain of the application, get it from the appDelegate so its a singleton.
	_transfer = [[ZDTransferTicket alloc] init];
	ZDAppDelegate *appDelegate = [UIApplication sharedApplication].delegate;
	appDelegate.ticket = _transfer;
	
	// Update all the information to be displayed.
	[self update];
}

- (void)viewWillAppear:(BOOL)animated {
	// Removes the navigation bar
	[self.navigationController setNavigationBarHidden:true animated:true];
	
	// Sets the status bar, time service and battery, font color to white to match the rest of the UI.
	[[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
	
	//If the views about to appear update it, so if the color gets changed this shows
	[self update];
	
	// Call super method
	[super viewWillAppear:animated];
}

- (IBAction)swipedRight:(UIGestureRecognizer *)sender {
	// If the user swipes right then change the ticket to the previous day, change the background and update the display.
	[_transfer previous];
	[self transitionBackgroundWithColor:_transfer.color goingForward:FALSE];
	[self update];
}

- (IBAction)swipedLeft:(UIGestureRecognizer *)sender {
	// If the user swipes left then change the ticket to the next day, change the background and update the display.
	[_transfer next];
	[self transitionBackgroundWithColor:_transfer.color goingForward:TRUE];
	[self update];
}

- (IBAction)buttonSettingsPressed:(id)sender {
	// Segues to a menu to change the current color and letter, this is here to remind ya
}

- (void)update {
	// Set the transfer letter and the date on the screen.
	_labelLetter.text =_transfer.letter;
	_labelDate.text = [_transfer.date toString];
	[self updateBackground];
}

// Is used when someone changes the color for the ticket for the current day. No animation
- (void)updateBackground {
	[self.backgroundView setBackgroundColor:_transfer.color];
}

- (void)transitionBackgroundWithColor:(UIColor *)color goingForward:(BOOL)isGoingForward{
	
	// Make layers for the new background and the current one, the idea is to have one "push" the other one off.
	CALayer *currentBackground = _backgroundView.layer.presentationLayer;
	CALayer *newBackground = [[CALayer alloc] init];
	
	// Find the x and y for the new background, if the background is moving forward then the new background must be
	// infront of the current one whereas if its going backwards it needs to be behind the current one.
	newBackground.bounds = currentBackground.bounds;
	int x;
	int y = currentBackground.position.y;
	if (isGoingForward) {
		x = currentBackground.position.x * 3;
	} else {
		x = 0 - currentBackground.position.x;
	}
	
	// Give the new background a position and color and add it to the view below the old one.
	newBackground.position = CGPointMake(x, y);
	newBackground.backgroundColor = [color CGColor];
	[_backgroundView.layer addSublayer:newBackground];
	newBackground.zPosition = -1;
	
	// Create a new animation, translation on the x axis and set the time. If going forward then move it backwards by the backgrounds width or if going forwards move it forwards.
	CABasicAnimation *theAnimation;
    theAnimation=[CABasicAnimation animationWithKeyPath:@"transform.translation.x"];
    theAnimation.duration=.2;
    theAnimation.repeatCount=1;
    theAnimation.autoreverses=NO;
    theAnimation.fromValue=[NSNumber numberWithFloat:0];
	if (isGoingForward) {
		theAnimation.toValue=[NSNumber numberWithFloat:-currentBackground.frame.size.width];
	} else {
		theAnimation.toValue=[NSNumber numberWithFloat:currentBackground.frame.size.width];
	}
	// IF it isn't yes then updating the background color won't work because that will only update the old background that isn't even on the screen.
	theAnimation.removedOnCompletion = YES;
	theAnimation.fillMode = kCAFillModeForwards;
	
	// Start this bad boy up
    [newBackground addAnimation:theAnimation forKey:@"animateLayer"];
	
	
}

@end
