//
//  ArtistResults.m
//  FavoriteArtists
//
//  Created by Clayton Watkins on 9/25/20.
//

#import "ArtistResults.h"
#import "Artist.h"
#import "Artist+JSONSerialization.h"

@implementation ArtistResults

- (instancetype)initWithArtists:(NSArray<Artist *> *)artists
{
    if (self = [super init]){
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
        
        Artist *artist = [[Artist alloc]initWithDictionary:artistDictionary];
        
        if (artist){
            [artists addObject:artist];
        } else {
            NSLog(@"Unable to decode json: %@", artistDictionary);
        }
    }
    return [self initWithArtists:artists];
}

@end
