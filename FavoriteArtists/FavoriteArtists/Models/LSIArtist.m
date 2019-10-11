//
//  LSIArtist.m
//  FavoriteArtists
//
//  Created by Luqmaan Khan on 10/11/19.
//  Copyright © 2019 Luqmaan Khan. All rights reserved.
//

#import "LSIArtist.h"

@implementation LSIArtist

-(instancetype)initWithArtistName:(NSString *)name biography:(NSString *)bio andFormedYear:(int)year {
    if (self = [super init]) {
        _artistName = name;
        _artistBio = bio;
        _formedYear = year;
    }
    return self;
}



-(instancetype)initWithDictionary:(NSDictionary *)dictionary {
    self = [super init];
    if (self) {
        for (NSDictionary *element in dictionary.allValues) {
            for (NSDictionary *value in element) {
                _artistName = value[@"strArtist"];
                _artistBio = value[@"strBiographyEN"];
                _formedYear = [value[@"intFormedYear"] intValue];
            }
        }
    }
    return self;
}


@end
