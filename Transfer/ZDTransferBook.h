//
//  ZDTransferBook.h
//  Transfer
//
//  Created by Zach Dingels on 1/10/14.
//  Copyright (c) 2014 GnarWare. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZDDate.h"

@interface ZDTransferBook : NSObject

@property (nonatomic) NSMutableArray *colors;
@property (nonatomic) NSMutableArray *words;
@property (nonatomic, readonly) ZDDate *currentDate;

@end
