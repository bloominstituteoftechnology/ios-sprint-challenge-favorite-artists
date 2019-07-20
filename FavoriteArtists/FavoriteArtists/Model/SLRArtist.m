//
//  SLRArtist.m
//  FavoriteArtists
//
//  Created by Sameera Roussi on 7/19/19.
//  Copyright © 2019 Sameera Roussi. All rights reserved.
//

#import "SLRArtist.h"

@implementation SLRArtist


- (instancetype)initWithArtistName: (NSString *)artistName biography: (NSString *)biography yearFormed: (int)yearFormed {

    if (self = [super init]) {
        self.artistName = [artistName copy];
        self.biography = [biography copy];
        self.yearFormed = yearFormed;
    }
    
    return self;
}

@end

