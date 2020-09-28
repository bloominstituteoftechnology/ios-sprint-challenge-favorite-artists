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
    NSArray *artistDictionaries = [dictionary objectForKey:@"artists"];
    if (![artistDictionaries isKindOfClass:NSArray.class]) return nil;

    NSMutableArray *artists = [[NSMutableArray alloc] initWithCapacity:artistDictionaries.count];

    for (NSDictionary *artistDictionary in artistDictionaries) {
        if (![artistDictionary isKindOfClass:NSDictionary.class]) continue;

        JSKArtist *artist = [[JSKArtist alloc] initWithDictionary:artistDictionary];

        if (artist) {
            [artists addObject:artist];
        } else {
            NSLog(@"Unable to parse artist dictionary: %@", artistDictionary);
        }
    }

    return [self initWithArtists:artists];
}


@end
