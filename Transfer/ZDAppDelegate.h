//
//  ZDAppDelegate.h
//  Transfer
//
//  Created by Zach Dingels on 12/30/13.
//  Copyright (c) 2013 GnarWare. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZDTransferTicket.h"

@interface ZDAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

// SO everyone can use the same ticker, like a singleton.
@property (strong, nonatomic) ZDTransferTicket *ticket;

@end
