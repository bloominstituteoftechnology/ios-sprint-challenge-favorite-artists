//
//  LSIErrors.h
//
//  Created by Paul Solt on 1/27/20.
//  Copyright © 2020 Lambda, Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

// LSIErrors.h
extern NSString * const LSIErrorDomain;

// Use the NS_ENUM() macro when making enum values in Objc
typedef NS_ENUM(NSInteger, LSIErrorCode) {
    LSIAPIError = 1000,           // generic API error
    LSIJSONDecodeError = 1001,    // JSON decoding error
    LSIDataNilError = 1002,       // Data is nil error
    
    // TODO: Add more error codes here that may need to be handled
};

/// Creates an error with a localized message in the 
NSError *errorWithMessage(NSString *message, NSInteger errorCode);
