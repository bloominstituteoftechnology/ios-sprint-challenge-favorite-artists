//
//  MJPArtist.m
//  Artists
//
//  Created by Mark Poggi on 6/12/20.
//  Copyright © 2020 Mark Poggi. All rights reserved.
//

#import "MJPArtist.h"

@implementation MJPArtist

- (instancetype)initWithStrArtist:(NSString *)strArtist
                       yearFormed:(int)yearFormed
                   strBiographyEN:(NSString *)strBiographyEN
{
    self = [super init];
    if (self) {
        _strArtist = strArtist;
        _yearFormed = yearFormed;
        _strBiographyEN = strBiographyEN;
    }

    return self;

}

@end
