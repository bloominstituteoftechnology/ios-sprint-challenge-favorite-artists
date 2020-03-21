//
//  JLAFavoriteArtist.m
//  FavoriteArtistsSprint
//
//  Created by Jorge Alvarez on 3/20/20.
//  Copyright © 2020 Jorge Alvarez. All rights reserved.
//

#import "JLAFavoriteArtist.h"

@implementation JLAFavoriteArtist

- (instancetype)initWithStrArtist:(NSString *)strArtist
                    intFormedYear:(int)intFormedYear
                   strBiographyEN:(NSString *)strBiographyEN {
    
    if (self = [super init]) {
        
        _strArtist = [strArtist copy];
        _intFormedYear = intFormedYear;
        _strBiographyEN = [strBiographyEN copy];
    }
    return self;
}

@end
