//
//  ZDViewController.h
//  Transfer
//
//  Created by Zach Dingels on 12/30/13.
//  Copyright (c) 2013 GnarWare. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZDTransferTicket.h" 

@interface ZDViewController : UIViewController

// Views
@property (strong, nonatomic) IBOutlet UIView *backgroundView;
@property (weak, nonatomic) IBOutlet UILabel *labelLetter;
@property (weak, nonatomic) IBOutlet UILabel *labelDate;
@property (weak, nonatomic) IBOutlet UIButton *buttonSettings;

// Transfer ticket property
@property (strong, nonatomic) ZDTransferTicket *transfer;

// Two swipe actions
- (IBAction)swipedRight:(UIGestureRecognizer *)sender;
- (IBAction)swipedLeft:(UIGestureRecognizer *)sender;

// Button pressed action.
- (IBAction)buttonSettingsPressed:(id)sender;

// Updates the label for the letter, date and updates the background color, all according to the ticket
- (void)update;

@end
