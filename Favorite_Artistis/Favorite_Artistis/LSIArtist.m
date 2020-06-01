//
//  LSIArtist.m
//  Favorite_Artistis
//
//  Created by Joe on 5/30/20.
//  Copyright © 2020 AlphaGradeINC. All rights reserved.
//

#import "LSIArtist.h"

@implementation LSIArtist
// MARK: - Initializer for Artist Object
- (instancetype)initWithName:(NSString *)artistName
                  artistInfo:(NSString *)artistInfo
                  yearFormed:(NSDate *)yearFormed; {

    if (self = [super init]) { // don't use == accidently! bug!
        // always use _propertyName (instance variable)
        _artistName = artistName;
        _artistInfo = artistInfo;
        _yearFormed = yearFormed;
        
        // DO this in swift, not in objc in your init
        // self.name = name; // can produce side effects in objc
    }
    return self;
}

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    NSString *artistName = dictionary[@"artistName"];
    NSString *artistInfo = dictionary[@"artistInfo"];
    
    NSDate *yearFormed = [NSDate date];
    return[self initWithName:artistName artistInfo: artistInfo yearFormed:yearFormed];
}

@end
