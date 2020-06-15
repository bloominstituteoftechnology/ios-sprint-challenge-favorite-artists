//
//  ArtistResults.m
//  FavoriteArtists
//
//  Created by Jessie Ann Griffin on 6/11/20.
//  Copyright © 2020 Jessie Griffin. All rights reserved.
//

#import "ArtistResults.h"
#import "Artist.h"
#import "Artist+NSJSONSerialization.h"


@implementation ArtistResults

- (instancetype)initWithArtists:(NSArray<Artist *> *)artists
{
    if (self = [super init]) {
        _artists = artists.copy;
    }
    return self;
}

- (instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    NSArray *artistsDictionaries = [dictionary objectForKey:@"artists"];
    if (![artistsDictionaries isKindOfClass:[NSDictionary class]]) return nil;

    NSMutableArray *artists = [[NSMutableArray alloc] initWithCapacity:artistsDictionaries.count];

    for (NSDictionary *artistDictionary in artistsDictionaries) {
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
