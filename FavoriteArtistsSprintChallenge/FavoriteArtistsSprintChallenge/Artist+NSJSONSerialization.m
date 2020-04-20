//
//  Artist+NSJSONSerialization.m
//  FavoriteArtistsSprintChallenge
//
//  Created by Dillon P on 4/19/20.
//  Copyright © 2020 Dillon's Lambda Team. All rights reserved.
//

#import "Artist+NSJSONSerialization.h"

@implementation Artist (NSJSONSerialization)

- (instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    NSArray *artistsDictionaries = [dictionary objectForKey:@"artists"];
    if (![artistsDictionaries isKindOfClass:[NSArray class]]) return nil;
    
//    NSLog(@"%@", artistsDictionaries);
    
    NSDictionary *artistDictionary = [artistsDictionaries objectAtIndex:0];
    if (![artistDictionary isKindOfClass:[NSDictionary class]]) return nil;
    
    NSString *artistName = [artistDictionary objectForKey:@"strArtist"];
    
    NSNumber *yearFoundedNumber = [artistDictionary valueForKey:@"intFormedYear"];
    int yearFounded = 0;
    if ([yearFoundedNumber isKindOfClass:[NSNull class]]) {
        yearFounded = 0;
    } else {
        yearFounded = [yearFoundedNumber intValue];
    }
    NSString *artistBio = [artistDictionary objectForKey:@"strBiographyEN"];
    
//    NSLog(@"%@", artistName);
//    NSLog(@"%d", yearFounded);
//    NSLog(@"%@", artistBio);
    
    Artist *artist = [[Artist alloc] initWithArtistName:artistName
                                            yearFounded:yearFounded
                                              artistBio:artistBio];
    
    return artist;
}

@end
