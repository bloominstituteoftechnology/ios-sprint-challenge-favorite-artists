//
//  NMKArtist.m
//  Favorite Artist ObjC
//
//  Created by Niranjan Kumar on 1/24/20.
//  Copyright © 2020 Nar Kumar. All rights reserved.
//

#import "NMKArtist.h"

@implementation NMKArtist

- (instancetype)initWithArtistName:(NSString *)artist
                         biography:(NSString *)biography
                        yearFormed:(int)yearFormed {
    
    if (self = [super init]) {
        _artist = artist.copy;
        _biography = biography.copy;
        _yearFormed = yearFormed;
    }
    return self;
}

@end
