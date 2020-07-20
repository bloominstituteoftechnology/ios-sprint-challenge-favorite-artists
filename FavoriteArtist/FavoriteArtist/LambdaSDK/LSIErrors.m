//
//  LSIErrors.m
//
//  Created by Paul Solt on 1/27/20.
//  Copyright © 2020 Lambda, Inc. All rights reserved.
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
