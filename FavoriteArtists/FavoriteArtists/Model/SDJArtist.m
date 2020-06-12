//
//  SDJArtist.m
//  FavoriteArtists
//
//  Created by Shawn James on 6/12/20.
//  Copyright © 2020 Shawn James. All rights reserved.
//

#import "SDJArtist.h"

@implementation SDJArtist

- (instancetype)initWithArtistName:(NSString *)artistName
                        yearFormed:(int)yearFormed
                   artistBiography:(NSString *)artistBiography {
    self = [super init];
    if (self) {
        _artistName = [artistName copy];
        _yearFormed = yearFormed;
        _artistBiography = [artistBiography copy];
    }
    return self;
}

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    // artist name
    NSString *artistName = dictionary[@"strArtist"];
    // year formed
    NSNumber *yearFormedAsNSNumber = dictionary[@"intFormedYear"];
    if ([yearFormedAsNSNumber isKindOfClass:[NSNull class]]) return nil;
    int yearFormed = yearFormedAsNSNumber.intValue;
    // artist biography
    NSString *artistBiography = dictionary[@"strBiographyEN"];
    
    return [self initWithArtistName:artistName yearFormed:yearFormed artistBiography:artistBiography];
}

@end
