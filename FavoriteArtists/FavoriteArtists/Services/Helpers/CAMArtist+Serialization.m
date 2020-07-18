//
//  CAMArtist+Serialization.m
//  FavoriteArtists
//
//  Created by Cody Morley on 7/17/20.
//  Copyright © 2020 Cody Morley. All rights reserved.
//

#import "CAMArtist+Serialization.h"
#import "CAMArtist.h"

@implementation CAMArtist (Serialization)

- (instancetype)initWithDictionary: (NSDictionary *)dictionary
{
    NSString *name = dictionary[@"strArtist"];
    NSString *bio = dictionary[@"strBiographyEN"];
    NSString *foundedString = dictionary[@"intFormedYear"];
    int founded;
    if (!foundedString) {
        founded = 0000;
    } else {
        founded = [foundedString intValue];
    }
    
    return [self initWithName: name
                          bio: bio
                      founded: founded];
}

- (instancetype)loadFromDictionary: (NSDictionary *)dictionary
{
    NSString *name = dictionary[@"strArtist"];
    NSString *bio = dictionary[@"strBiographyEN"];
    NSNumber *foundedNumber = dictionary[@"intFormedYear"];
    int founded = [foundedNumber intValue];
    
    return [self initWithName: name
                          bio: bio
                      founded: founded];
}


- (NSDictionary *)createDictionary
{
    NSNumber *foundedObject = [NSNumber numberWithInt: self.founded];
    NSDictionary *artistData = @{ @"name": self.name,
                                  @"bio": self.bio,
                                  @"founded": foundedObject
    };
    return artistData;
}
@end
