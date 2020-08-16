//
//  LSIError.h
//  Favorite_Artistis
//
//  Created by Joe on 8/4/20.
//  Copyright © 2020 AlphaGradeINC. All rights reserved.
//

#import <Foundation/Foundation.h>

// LSIErrors.h
FOUNDATION_EXPORT NSString *const LSIErrorDomain;

typedef enum : NSInteger {
    LSIAPIError = 1000,               // generic API error
    LSIJSONDecodeError = 1001,
    LSIDataNilError = 1002,
    LSIUserNotFound = 1003,
    // TODO: Add any other error codes here for generic types of errors, your message can provide more details to the user
} LSIErrorCode;

/// Creates an error with a localized message in the
NSError *errorWithMessage(NSString *message, NSInteger errorCode);
