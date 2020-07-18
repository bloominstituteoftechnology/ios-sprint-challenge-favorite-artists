//
//  LSIErrors.m
//  FavoriteArtistsSprint
//
//  Created by Stephanie Ballard on 7/17/20.
//  Copyright © 2020 Stephanie Ballard. All rights reserved.
//

#import "LSIErrors.h"

// TODO: The domain should be reverse DNS for your app or framework
// com.CompanyName.ProductOrFrameworkName to make it unique
NSString * const LSIErrorDomain = @"com.LambdaSchool.Quakes-Objc";

NSError *errorWithMessage(NSString *message, NSInteger errorCode) {
    NSDictionary *userInfo = @{ NSLocalizedDescriptionKey : message };
    NSError *error = [NSError errorWithDomain:LSIErrorDomain code:LSIAPIError userInfo:userInfo];
    return error;
}
