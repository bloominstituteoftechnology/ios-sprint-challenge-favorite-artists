//
//  SMAArtistResults.m
//  FavoriteArtists
//
//  Created by Sean Acres on 8/2/20.
//  Copyright © 2020 Sean Acres. All rights reserved.
//

#import "SMAArtistResults.h"
#import "SMAFavoriteArtist.h"

@implementation SMAArtistResults

- (instancetype)init
{
    return [self initWithArtists:@[]];
}

- (instancetype)initWithArtists:(NSArray<SMAFavoriteArtist *> *)artists
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
        
        SMAFavoriteArtist *artist = [[SMAFavoriteArtist alloc] initWithDictionary:artistDictionary];
        
        if (artist) {
            [artists addObject:artist];
        } else {
            NSLog(@"Unable to parse artist dictionary: %@", artistDictionary);
        }
    }
    
    return [self initWithArtists:artists];
}

@end
