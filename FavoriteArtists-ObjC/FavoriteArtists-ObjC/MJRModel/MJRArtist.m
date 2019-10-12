//
//  MJRArtist.m
//  FavoriteArtists-ObjC
//
//  Created by Marlon Raskin on 10/11/19.
//  Copyright © 2019 Marlon Raskin. All rights reserved.
//

#import "MJRArtist.h"

@implementation MJRArtist


- (instancetype)initWithArtistName:(NSString *)artistName bio:(NSString *)bio yearFormed:(int)yearFormed {
    if (self = [self init]) {
        _artistName = artistName;
        _bio = bio;
        _yearFormed = yearFormed;
    }
    return self;
}

@end
