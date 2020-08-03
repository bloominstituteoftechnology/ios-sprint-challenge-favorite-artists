//
//  ArtistResults.m
//  FavoriteArtists
//
//  Created by Matthew Martindale on 8/2/20.
//  Copyright © 2020 Matthew Martindale. All rights reserved.
//

#import "ArtistResults.h"
#import "Artist.h"
#import "Artist+NJSONSerialization.h"

@implementation ArtistResults

- (instancetype)initWithArtists:(NSArray<Artist *> *)artists
{
    if (self = [super init]) {
        _artists = artists;
    }
    return self;
}

- (instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    NSArray *artistDictionaries = [dictionary objectForKey:@"artists"];
    if (![artistDictionaries isKindOfClass:NSArray.class]) return nil;
    
    NSMutableArray *artists = [[NSMutableArray alloc] initWithCapacity:artistDictionaries.count];
    
    for (NSDictionary *artistDictionary in artistDictionaries) {
        if (![artistDictionary isKindOfClass:NSDictionary.class]) continue;
        
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
