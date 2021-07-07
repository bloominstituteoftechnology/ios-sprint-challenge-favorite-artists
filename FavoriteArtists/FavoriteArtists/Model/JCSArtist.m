//
//  JCSArtist.m
//  FavoriteArtists
//
//  Created by Lambda_School_Loaner_95 on 4/4/19.
//  Copyright © 2019 JS. All rights reserved.
//

#import "JCSArtist.h"

@implementation JCSArtist

- (instancetype)initWithName:(NSString *)artistName bio:(NSString *)biography yearFormed:(int)yearFormed {
    self = [super init];
    if (self) {
        _artistName = artistName;
        _biography = biography;
        _yearFormed = yearFormed;
    }
    return self;
}

- (instancetype)initWithName:(NSString *)artistName dictionary:(NSDictionary *)dictionary {
    
    
    NSString *bio = dictionary[@"strBiographyEN"];
    NSString *yearString = dictionary[@"intFormedYear"];
    NSString *name = dictionary[@"strArtist"];
    int year = (int)[yearString integerValue];
    
    return [self initWithName:name bio:bio yearFormed:year
            ];
}


@end
