//
//  LSIErrors.m
//  FavoriteArtists
//
//  Created by Craig Belinfante on 11/22/20.
//

#import "LSIErrors.h"

NSString *const LSIErrorDomain = @"LSIErrorDomain";

NSError *errorWithMessage(NSString *message, NSInteger errorCode) {
    NSDictionary *userInfo = @{NSLocalizedDescriptionKey : message};
    NSError *error = [NSError errorWithDomain:LSIErrorDomain code:errorCode userInfo:userInfo];
    return error;
}
