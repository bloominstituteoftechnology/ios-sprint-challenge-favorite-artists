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
    NSString *artistName = [dictionary objectForKey:@"strArtist"];
    
    NSNumber *yearFoundedNumber = [dictionary valueForKey:@"intFormedYear"];
    int yearFounded = 0;
    if ([yearFoundedNumber isKindOfClass:[NSNull class]]) {
        yearFounded = 0;
    } else {
        yearFounded = [yearFoundedNumber intValue];
    }
    NSString *artistBio = [dictionary objectForKey:@"strBiographyEN"];
    
    Artist *artist = [[Artist alloc] initWithArtistName:artistName
                                            yearFounded:yearFounded
                                              artistBio:artistBio];
    
    return artist;
}

- (NSDictionary *)toDictionary;
{
    NSString *artistName = self.artistName;
    int yearFounded = self.yearFounded;
    NSString *yearFoundedString = [NSString stringWithFormat:@"%d", yearFounded];
    NSString *artistBio = self.artistBio;
    
    NSArray *values = [NSArray arrayWithObjects:artistName, yearFoundedString, artistBio, nil];
    NSArray *keys = [NSArray arrayWithObjects:@"strArtist", @"intFormedYear", @"strBiographyEN", nil];
    
    NSDictionary *artistInfo = [[NSDictionary alloc] initWithObjects:values forKeys:keys];
    
//    NSLog(@"%@", artistInfo);
    return artistInfo;
}


@end
