//
//  MRFArtist.m
//  PXFavArtist
//
//  Created by Michael Flowers on 7/18/19.
//  Copyright © 2019 Michael Flowers. All rights reserved.
//

#import "MRFArtist.h"

@implementation MRFArtist

- (instancetype)initWithArtistName:(NSString *)name yearFormed:(NSString *)yearFormed bio:(NSString *)bio{
    self = [super init];
    if (self){
        _artist = name;
        _yearFormed = yearFormed;
        _bio = bio;
    }
    return self;
}


@end
