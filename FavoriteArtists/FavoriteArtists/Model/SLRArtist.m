//
//  SLRArtist.m
//  FavoriteArtists
//
//  Created by Sameera Roussi on 7/19/19.
//  Copyright © 2019 Sameera Roussi. All rights reserved.
//

#import "SLRArtist.h"

@implementation SLRArtist


- (instancetype)initWithArtistName: (NSString *)artistName biography: (NSString *)biography year: (NSString *)yearFormed {
    
    if (self = [super init]) {
        self.artistName = artistName;
        self.biography = biography;
        self.yearFormed = yearFormed;
    }
    
    return self;
}

@end
