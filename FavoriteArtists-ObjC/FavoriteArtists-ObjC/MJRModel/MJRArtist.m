//
//  MJRArtist.m
//  FavoriteArtists-ObjC
//
//  Created by Marlon Raskin on 10/11/19.
//  Copyright © 2019 Marlon Raskin. All rights reserved.
//

#import "MJRArtist.h"

@implementation MJRArtist

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    if (self = [self init]) {

//        NSDictionary *artistInfo = dictionary[@"artists"];

        NSString *artistName = dictionary[@"strArtist"];
        NSString *artistBio = dictionary[@"strBiographyEN"];
        NSString *yearFormedStr = dictionary[@"intFormedYear"];

        if (artistName != nil &&
            artistBio != nil &&
            yearFormedStr != nil) {
            _artistName = artistName;
            _bio = artistBio;
            _yearFormed = [yearFormedStr intValue];
        } else {
            NSLog(@"Error: unable to parse artist: %@", dictionary);
            return nil;
        }

    }
    return self;
}

- (NSString *)formedInYearDesc {
    return [NSString stringWithFormat:@"Formed in %d", self.yearFormed];
}

@end
