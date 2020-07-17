//
//  DBEErrors.h
//  FavoriteArtists
//
//  Created by Dahna on 7/17/20.
//  Copyright © 2020 Dahna Buenrostro. All rights reserved.
//

#import <Foundation/Foundation.h>

extern NSString * const DBEErrorDomain;

typedef NS_ENUM(NSInteger, DBEErrorCode) {
    DBEAPIError = 1000,     // generic API error
    DBEJSONDecoder = 1001,  // JSON decoding error
    DBEDataNilError = 1002, // Data is nil error
};

NSError *errorWithMessage(NSString *message, NSInteger errorCode);
