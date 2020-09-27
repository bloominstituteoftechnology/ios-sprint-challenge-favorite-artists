//
//  LSIArtistResults.m
//  FavoriteArtists
//
//  Created by Elizabeth Thomas on 9/27/20.
//

#import "LSIArtistResults.h"
#import "Artist.h"

@implementation LSIArtistResults

- (instancetype)init
{
    return [self initWithArtists:@[]];
}

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

    NSMutableArray *artists = [[NSMutableArray alloc] init];

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
