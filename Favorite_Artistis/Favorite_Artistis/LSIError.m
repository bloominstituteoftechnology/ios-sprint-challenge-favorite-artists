//
//  LSIError.m
//  Favorite_Artistis
//
//  Created by Joe on 8/4/20.
//  Copyright © 2020 AlphaGradeINC. All rights reserved.
//

#import "LSIError.h"

NSString *const LSIErrorDomain = @"LSIErrorDomain";

NSError *errorWithMessage(NSString *message, NSInteger errorCode) {
    NSDictionary *userInfo = @{ NSLocalizedDescriptionKey : message };
    NSError *error = [NSError errorWithDomain:LSIErrorDomain code:LSIAPIError userInfo:userInfo];
    return error;
}
