//
//  KSIArtistResults.m
//  FavoriteArtists-ObjC
//
//  Created by Kevin Stewart on 7/31/20.
//  Copyright © 2020 Kevin Stewart. All rights reserved.
//

#import "KSIArtistResults.h"
#import "KSIArtist.h"

@implementation KSIArtistResults

- (instancetype)init
{
    return [self initWithArtists:@[]];
}

- (instancetype)initWithArtists:(NSArray<KSIArtist *> *)artists
{
    if (self = [super init]) {
        NSSortDescriptor *sortDescriptor = [NSSortDescriptor sortDescriptorWithKey:@"strArtist" ascending:NO];
        _artists = [artists sortedArrayUsingDescriptors:@[sortDescriptor]];
    }
    return self;
}

- (instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    NSArray *artistDicionaries = [dictionary objectForKey:@"features"];
    if (![artistDicionaries isKindOfClass:NSArray.class]) return nil;
    
    NSMutableArray *artists = [[NSMutableArray alloc] initWithCapacity:artistDicionaries.count];
    
    for (NSDictionary *artistDictionary in artistDicionaries) {
        if (![artistDictionary isKindOfClass:NSDictionary.class]) continue;
        
        KSIArtist *artist = [[KSIArtist alloc] initWithDictionary:artistDictionary];
        
        if (artist) {
            [artists addObject:artist];
        } else {
            NSLog(@"Unable to parse artist dictioinary: %@", artistDictionary);
        }
    }
    
    return [self initWithArtists: artists];
}

@end
