//
//  ZDFlatButton.h
//  Transfer
//
//  Created by Zach Dingels on 5/8/14.
//  Copyright (c) 2014 GnarWare. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZDFlatButton : UIButton

@property (nonatomic, strong) UIColor *outlineColor;
@property (nonatomic) bool hasOutline;
@property (nonatomic) bool isDisabled;

@end
