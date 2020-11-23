//
//  LSIErrors.h
//  FavoriteArtists
//
//  Created by Craig Belinfante on 11/22/20.
//

#import <Foundation/Foundation.h>

// LSIErrors.h
extern NSString *const LSIErrorDomain;

typedef NS_ENUM(NSInteger, LSIErrorCode) {
    LSIAPIError = 1000,           // generic API error
    LSIJSONDecodeError = 1001,    // JSON decoding error
    LSIDataNilError = 1002,       // Data is nil error
    // TODO: Add any other error codes here for generic types of errors, your message can provide more details to the user
};

/// Creates an error with a localized message in the
NSError *errorWithMessage(NSString *message, NSInteger errorCode);
