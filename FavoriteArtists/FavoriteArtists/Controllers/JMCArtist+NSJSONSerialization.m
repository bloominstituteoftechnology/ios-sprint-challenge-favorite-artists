//
//  JMCArtist+NSJSONSerialization.m
//  FavoriteArtists
//
//  Created by Jarren Campos on 8/3/20.
//  Copyright © 2020 Jarren Campos. All rights reserved.
//

#import "JMCArtist+NSJSONSerialization.h"

@implementation JMCArtist (NSJSONSerialization)

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
        NSArray *artists = dictionary[@"artists"];
        if (artists.count > 0) {
            NSDictionary *artist = artists[0];
            NSString *name = artist[@"strArtist"];
            NSString *biography = artist[@"strBiographyEN"];
            NSNumber *yearFormed = artist[@"intFormedYear"];
            
            self = [self initWithName:name biography:biography yearFormed:yearFormed.intValue];
    }
    return self;
}

- (NSDictionary *)toDictionary {
    NSMutableDictionary *dict = [NSMutableDictionary new];
    [dict setObject:self.name forKey:@"strArtist"];
    [dict setObject:self.biography forKey:@"strBiographyEN"];
    [dict setObject:[NSNumber numberWithInt:(self.yearFormed)] forKey:@"intFormedYear"];
    NSArray *artist = [[NSArray alloc] initWithObjects:dict, nil];
    NSDictionary *artists = [[NSDictionary alloc] initWithObjectsAndKeys:artist, @"artists", nil];
    return artists;
}

@end
