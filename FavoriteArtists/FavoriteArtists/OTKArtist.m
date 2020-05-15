//
//  OTKArtist.m
//  FavoriteArtists
//
//  Created by Tobi Kuyoro on 15/05/2020.
//  Copyright © 2020 Tobi Kuyoro. All rights reserved.
//

#import "OTKArtist.h"

@implementation OTKArtist

- (instancetype)initWithName:(NSString *)name
                         bio:(NSString *)bio
                  yearFormed:(int)yearFormed {
    self = [super init];
    if (self) {
        _name = name;
        _bio = bio;
        _yearFormed = yearFormed;
    }

    return self;
}

@end
