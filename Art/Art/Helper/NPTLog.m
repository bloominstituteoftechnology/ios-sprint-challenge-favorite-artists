//
//  LSILog.m
//
//  Created by Nick Nguyen on 4/17/20.
//  Copyright © 2020 Nick Nguyen. All rights reserved.
//

#import <Foundation/Foundation.h>

void LSILog(NSString *format, ...) {
    va_list args;
    va_start(args, format);
    NSString *stringWithNewline = [format stringByAppendingString:@"\n"];
    NSString *formattedString = [[NSString alloc] initWithFormat: stringWithNewline
                                                       arguments: args];
    va_end(args);
    [[NSFileHandle fileHandleWithStandardOutput]
     writeData: [formattedString dataUsingEncoding: NSUTF8StringEncoding]];
}

