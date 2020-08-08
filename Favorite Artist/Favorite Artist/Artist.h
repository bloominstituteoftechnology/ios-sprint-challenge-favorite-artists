//
//  Artist.h
//  Favorite Artist
//
//  Created by Gerardo Hernandez on 8/8/20.
//  Copyright © 2020 Gerardo Hernandez. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Artist : NSObject

// Initializer
- (instancetype)initWithName:(NSString *)name
                  yearFormed:(int)yearFormed
                   biography:(NSString *)biography NS_DESIGNATED_INITIALIZER;
// Properties
@property (nonatomic, readonly, copy) NSString *name;
@property (nonatomic, readonly) int yearFormed;
@property (nonatomic, readonly, copy, nullable) NSString *biography;

@end

NS_ASSUME_NONNULL_END
