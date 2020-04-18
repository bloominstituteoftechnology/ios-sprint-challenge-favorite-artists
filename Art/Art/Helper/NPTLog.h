//
//  LSILog.h
//
//  Created by Nick Nguyen on 4/17/20.
//  Copyright © 2020 Nick Nguyen. All rights reserved.
//

#import <Foundation/Foundation.h>

#define USECUSTOMLOGS 1
#if USECUSTOMLOGS
#define NSLog LSILog
#endif

void LSILog(NSString *format, ...);

