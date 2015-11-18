//
//  ZDLetterPicker.h
//  Transfer
//
//  Created by Zach Dingels on 5/6/14.
//  Copyright (c) 2014 GnarWare. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZDLetterPicker : UIViewController

// Buttons
@property (weak, nonatomic) IBOutlet UIButton *buttonA;
@property (weak, nonatomic) IBOutlet UIButton *buttonD;
@property (weak, nonatomic) IBOutlet UIButton *buttonH;
@property (weak, nonatomic) IBOutlet UIButton *buttonJ;
@property (weak, nonatomic) IBOutlet UIButton *buttonN;
@property (weak, nonatomic) IBOutlet UIButton *buttonS;
@property (weak, nonatomic) IBOutlet UIButton *buttonT;
@property (weak, nonatomic) IBOutlet UIButton *buttonX;

- (IBAction)ButtonPressed:(UIButton *)sender;

@end
