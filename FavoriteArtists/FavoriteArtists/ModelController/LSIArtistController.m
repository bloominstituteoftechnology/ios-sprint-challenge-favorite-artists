//
//  LSIArtistController.m
//  FavoriteArtists
//
//  Created by Luqmaan Khan on 10/11/19.
//  Copyright © 2019 Luqmaan Khan. All rights reserved.
//

#import "LSIArtistController.h"
#import "LSIArtist.h"

@interface LSIArtistController()
@end

@implementation LSIArtistController

static NSString *baseURLString = @"https://www.theaudiodb.com/api/v1/json/1/";

-(instancetype)init {
    self = [super init];
    if (self) {
        _artists = [@[] mutableCopy];
    }
    return self;
}



@end
