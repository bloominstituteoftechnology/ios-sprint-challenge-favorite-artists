//
//  EJSFavoriteArtist.m
//  FavoriteArtist
//
//  Created by Enzo Jimenez-Soto on 7/17/20.
//  Copyright © 2020 Enzo Jimenez-Soto. All rights reserved.
//

#import "EJSFavoriteArtist.h"

@implementation EJSFavoriteArtist

- (instancetype)initWithartist:(NSString *)artist
                    yearFormed:(int)yearFormed
                    biography :(NSString *)biography {
    
    if (self = [super init]) {
        
        _artist = [artist copy];
        _yearFormed = yearFormed;
        _biography = [biography copy];
    }
    return self;
}

@end
