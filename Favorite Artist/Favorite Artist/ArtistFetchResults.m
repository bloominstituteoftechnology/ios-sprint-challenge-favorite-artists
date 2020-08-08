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

- (instancetype)initWithArtist:(NSArray<Artist *> *)artist
{
    if (self = [super init]) {
        _artist = artist;
    }
    return self;
}

- (nullable instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    NSArray *artistDictionaries = [dictionary objectForKey:@"artists"];
    if (![artistDictionaries isKindOfClass:[NSArray class]]) return nil;
    
    NSMutableArray *artists = [[NSMutableArray alloc] initWithCapacity:artistDictionaries.count];
    
    for (NSDictionary *artistDictionary in artistDictionaries) {
        if (![artistDictionaries isKindOfClass:[NSDictionary class]]) continue;
        
        Artist *artist = [[Artist alloc] initwithDictionary:artistDictionary];
        
        if (artist) {
            [artists addObject:artist];
        } else {
            NSLog(@"Error parsing dictionary: %@", artistDictionary);
        }
    }
        return [self initWithArtist:artists];
}

@end
