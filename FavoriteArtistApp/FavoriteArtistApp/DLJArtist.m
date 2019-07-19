//
//  DLJArtist.m
//  FavoriteArtistApp
//
//  Created by Diante Lewis-Jolley on 7/19/19.
//  Copyright © 2019 Diante Lewis-Jolley. All rights reserved.
//

#import "DLJArtist.h"

@implementation DLJArtist

-(instancetype)initWithArtistName:(NSString *)name biography:(NSString *)bio yearFormed:(int)yearFormed {

    self = [super init];
    if (self) {
        self.name = [name copy];
        self.bio = [bio copy];
        self.yearFormed = yearFormed;
    }

    return self;

}

@end
