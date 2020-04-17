//
//  KMLArtist.m
//  FavoriteArtists
//
//  Created by Keri Levesque on 4/17/20.
//  Copyright © 2020 Keri Levesque. All rights reserved.
//

#import "KMLArtist.h"

@implementation KMLArtist

- (instancetype)initWithName:(NSString *)name
                   biography:(NSString *)biography
                  formedYear:(int)formedYear {
    self = [super init];
    if (self) {
        _name = name;
        _biography = biography;
        _formedYear = formedYear;
    }
    return self;
}


- (NSString *)formedYearString {
    return [[NSNumber numberWithInt:self.formedYear] stringValue];
}


@end
