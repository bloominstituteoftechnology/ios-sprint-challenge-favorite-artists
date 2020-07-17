//
//  DBEErrors.m
//  FavoriteArtists
//
//  Created by Dahna on 7/17/20.
//  Copyright © 2020 Dahna Buenrostro. All rights reserved.
//

#import "DBEErrors.h"

NSString * const DBEErrorDomain = @"com.DahnaBuenrostro.TestFavoriteArtists";

NSError *errorWithMessage(NSString *message, NSInteger errorCode) {
    NSDictionary *userInfo = @{ NSLocalizedDescriptionKey : message };
    NSError *error = [NSError errorWithDomain:DBEErrorDomain
                                         code:DBEAPIError
                                     userInfo:userInfo];
    return error;
}

