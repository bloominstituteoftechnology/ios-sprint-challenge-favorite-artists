//
//  MBMArtistResults.m
//  FavoriteArtists
//
//  Created by Michael on 3/20/20.
//  Copyright © 2020 Michael. All rights reserved.
//

#import "MBMArtistResults.h"
#import "MBMArtist.h"
#import "MBMArtist+NSJSONSerialization.h"


@implementation MBMArtistResults

- (instancetype)initWithArtists:(NSMutableArray<MBMArtist *> *)artists {
    self = [super init];
    if (self) {
        _artists = artists;
    }
    return self;
}

- (instancetype)initWithDictionary:(NSMutableDictionary *)dictionary {
    
    NSArray *artistDictionaries = dictionary[@"artists"];
    NSMutableArray *artists = [[NSMutableArray alloc] init];
    
    if (![artistDictionaries isKindOfClass:[NSArray class]]) {
        return nil;
    }
    
    for (NSMutableDictionary *artistDict in artistDictionaries) {
        MBMArtist *artist = [[MBMArtist alloc] initWithDictionary:artistDict];
        if (artist) {
            [artists addObject:artist];
        }
    }
    
    self = [self initWithArtists:artists];
    return self;
}

@end
