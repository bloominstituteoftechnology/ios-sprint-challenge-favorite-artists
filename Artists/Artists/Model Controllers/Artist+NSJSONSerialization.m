//
//  Artist+NSJSONSerialization.m
//  Artists
//
//  Created by Alexander Supe on 20.03.20.
//  Copyright © 2020 Alexander Supe. All rights reserved.
//

#import "Artist+NSJSONSerialization.h"

@implementation Artist (NSJSONSerialization)

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
    NSDictionary *dict = [NSDictionary new];
    [dict setValue:self.name forKey:@"strArtist"];
    [dict setValue:self.biography forKey:@"strBiographyEN"];
    [dict setValue:[NSNumber numberWithInt:(self.yearFormed)] forKey:@"intFormedYear"];
    NSArray *artist = [[NSArray alloc] initWithObjects:dict, nil];
    NSDictionary *artists = [[NSDictionary alloc] initWithObjectsAndKeys:artist, @"artists", nil];
    return artists;
}

@end
