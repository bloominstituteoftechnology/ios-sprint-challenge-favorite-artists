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


@end
