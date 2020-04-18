//
//  UFOArtistResults.m
//  FavoriteArtists
//
//  Created by Ufuk Türközü on 17.04.20.
//  Copyright © 2020 Ufuk Türközü. All rights reserved.
//

#import "UFOArtistResults.h"
#import "UFOArtist.h"

@implementation UFOArtistResults

- (instancetype)initWithArtists:(NSMutableArray<UFOArtist *> *)artists {
    self = [super init];
    if (self) {
        _artists = artists;
    }
    return self;
}

- (instancetype)initWithDictionary:(NSMutableDictionary *)dictionary {
    NSArray *artistDictionaries = dictionary[@"artists"];
    NSMutableArray *artists = [[NSMutableArray alloc] init];
    
    for (NSMutableDictionary *dictionary in artistDictionaries) {
        UFOArtist *artist = [[UFOArtist alloc] initWithDictionary:dictionary];
        if (artist) {
            [artists addObject:artist];
        }
    }
    
    self = [self initWithArtists:artists];
    return self;    
}

@end
