//
//  ArtistFetchResults.m
//  Favorite Artist
//
//  Created by Gerardo Hernandez on 8/8/20.
//  Copyright © 2020 Gerardo Hernandez. All rights reserved.
//

#import "ArtistFetchResults.h"
#import "Artist.h"
#import "Artist+NSJSONSerialization.h"

@implementation ArtistFetchResults

- (instancetype)initWithArtists:(NSArray<Artist *> *)artists
{
    if (self = [super init]) {
        _artists = artists;
    }
    return self;
}

- (nullable instancetype)initWithDictionary:(NSDictionary *)dictionary
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
