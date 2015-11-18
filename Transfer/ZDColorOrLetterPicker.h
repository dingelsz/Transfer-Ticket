//
//  ZDColorOrLetterPicker.h
//  Transfer
//
//  Created by Zach Dingels on 5/6/14.
//  Copyright (c) 2014 GnarWare. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZDFlatButton.h"

@interface ZDColorOrLetterPicker : UIViewController
@property (strong, nonatomic) IBOutlet UIView *mainView;


@property (weak, nonatomic) IBOutlet ZDFlatButton *colorButton;
@property (weak, nonatomic) IBOutlet ZDFlatButton *letterButton;
@property (weak, nonatomic) IBOutlet ZDFlatButton *aboutButton;
@end
