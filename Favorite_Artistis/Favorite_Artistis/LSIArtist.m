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
                  yearFormed:(NSString *)yearFormed; {

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
    NSString *artistName = dictionary[@"strArtist"];
    NSString *artistInfo = dictionary[@"strBiographyEN"];
    NSString *yearFormed = dictionary[@"intFormedYear"];
    
    return[self initWithName:artistName artistInfo: artistInfo yearFormed:yearFormed];
}

@end
