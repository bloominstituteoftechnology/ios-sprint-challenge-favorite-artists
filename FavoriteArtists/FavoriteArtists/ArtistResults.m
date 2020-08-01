//
//  ArtistResults.m
//  FavoriteArtists
//
//  Created by Claudia Maciel on 7/31/20.
//  Copyright © 2020 thecoderpilot. All rights reserved.
//

#import "ArtistResults.h"
#import "Artist.h"

@implementation ArtistResults

- (instancetype)init
{
    return [self initWithArtists:@[]];
}

- (instancetype)initWithArtists:(NSArray<Artist *> *)artists
{
    self = [super init];
    if (self)
    {
        _artists = artists;
    }
    
    return self;
}

- (instancetype)initwithDictionary:(NSDictionary *)dictionary
{
    NSArray *artistDictionaries = [dictionary objectForKey:@"artists"];
    if (![artistDictionaries isKindOfClass:[NSArray class]]) return nil;

    NSMutableArray *artists = [[NSMutableArray alloc] initWithCapacity:artistDictionaries.count];

    for (NSDictionary *artistDictionary in artistDictionaries) {
        if (![artistDictionary isKindOfClass:[NSDictionary class]]) continue;

        Artist *artist = [[Artist alloc] initWithDictionary:artistDictionary];

        if (artist) {
            [artists addObject:artist];
        } else {
            NSLog(@"Unable to parse artist dictionary: %@", artistDictionary);
        }
    }

    return [self initWithArtists:artists];
}


@end
