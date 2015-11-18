//
//  ZDColorPickerController.h
//  Transfer
//
//  Created by Zach Dingels on 5/6/14.
//  Copyright (c) 2014 GnarWare. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZDColorPickerController : UIViewController

@property (strong, nonatomic) IBOutlet UIView *mainView;
@property (weak, nonatomic) IBOutlet UIButton *blackButton;
@property (weak, nonatomic) IBOutlet UIButton *blueButton;
@property (weak, nonatomic) IBOutlet UIButton *greenButton;
@property (weak, nonatomic) IBOutlet UIButton *orangeButton;
@property (weak, nonatomic) IBOutlet UIButton *pinkButton;
@property (weak, nonatomic) IBOutlet UIButton *purpleButton;

- (IBAction)blackButtonPressed:(id)sender;
- (IBAction)blueButtonPressed:(id)sender;
- (IBAction)greenButtonPressed:(id)sender;
- (IBAction)orangeButtonPressed:(id)sender;
- (IBAction)pinkButtonPressed:(id)sender;
- (IBAction)purpleButtonPressed:(id)sender;


@end
