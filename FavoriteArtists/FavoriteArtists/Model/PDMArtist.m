//
//  PDMArtist.m
//  FavoriteArtists
//
//  Created by Patrick Millet on 6/12/20.
//  Copyright © 2020 PatrickMillet79. All rights reserved.
//

#import "PDMArtist.h"

@implementation PDMArtist

- (instancetype)initWithName:(NSString *)name biography:(NSString *)biography yearFormed:(NSInteger)yearFormed
{
    self = [super init];
    if (self) {
        _name = [name copy];
        _biography = [biography copy];
        _yearFormed = yearFormed;
    }
    return self;
}

@end
