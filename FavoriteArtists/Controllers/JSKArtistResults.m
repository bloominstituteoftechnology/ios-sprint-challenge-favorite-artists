//
//  JSKArtistResults.m
//  FavoriteArtists
//
//  Created by Josh Kocsis on 9/25/20.
//

#import "JSKArtistResults.h"
#import "JSKArtist.h"
#import "JSKArtist+NSJSONSerialization.h"

@implementation JSKArtistResults

- (instancetype)init
{
    return [self initWithArtists:@[]];
}

- (instancetype)initWithArtists:(NSArray<JSKArtist *> *)artists
{
    if (self = [super init]) {
        NSSortDescriptor *sortDescriptor = [NSSortDescriptor sortDescriptorWithKey:@"artistName" ascending:NO];
        _artists = [artists sortedArrayUsingDescriptors:@[sortDescriptor]];
    }
    return self;
}

- (instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    NSArray *artistDictionaries = [dictionary objectForKey:@"features"];
    if (![artistDictionaries isKindOfClass:NSArray.class]) return nil;

    NSMutableArray *artists = [[NSMutableArray alloc] initWithCapacity:artistDictionaries.count];

    for (NSDictionary *artistDictionary in artistDictionaries) {
        if (![artistDictionary isKindOfClass:NSDictionary.class]) continue;

        JSKArtist *artist = [[JSKArtist alloc] initWithDictionary:artistDictionary];

        if (artist) {
            [artists addObject:artist];
        } else {
            // TODO: One of our required fields might be optional and we may need to debug this with real data
            NSLog(@"Unable to parse quake dictionary: %@", artistDictionary);
        }
    }

    return [self initWithArtists:artists];
}


@end
