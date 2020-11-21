//
//  Artists.m
//  FavoriteArtists
//
//  Created by Cora Jacobson on 11/21/20.
//

#import "Artists.h"
#import "Artist.h"

@implementation Artists

- (instancetype)init
{
    return [self initWithArtists:@[]];
}

- (instancetype)initWithArtists:(NSArray<Artist *> *)someArtists
{
    if (self = [super init]) {
        NSSortDescriptor *sortDescriptor = [NSSortDescriptor sortDescriptorWithKey:@"artistName" ascending:YES];
        _artists = [someArtists sortedArrayUsingDescriptors:@[sortDescriptor]];
    }
    return self;
}

- (nullable instancetype)initWithDictionary:(NSDictionary *)aDictionary
{
    NSArray *artistDictionaries = [aDictionary objectForKey:@"artists"];
    if (![artistDictionaries isKindOfClass:NSArray.class]) return  nil;
    
    NSMutableArray *artists = [[NSMutableArray alloc] initWithCapacity:artistDictionaries.count];
    
    for (NSDictionary *artistDictionary in artistDictionaries) {
        if (![artistDictionary isKindOfClass:NSDictionary.class]) return nil;
        
        Artist *artist = [[Artist alloc] initWithDictionary:artistDictionary];
        
        if (artist) {
            [artists addObject:artist];
        } else {
            NSLog(@"Unable to parse artist dictionary: %@", artistDictionary);
        }
    }
    return [self initWithArtists:artists];
}

- (NSDictionary *)dictionaryValue
{
    NSMutableDictionary *container = [[NSMutableDictionary alloc] init];
    
    [container setObject:self.artists forKey:@"artists"];
    
    return container;
}

@end
