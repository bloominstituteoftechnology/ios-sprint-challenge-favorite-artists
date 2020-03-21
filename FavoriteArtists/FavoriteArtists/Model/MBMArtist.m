//
//  MBMArtist.m
//  FavoriteArtists
//
//  Created by Michael on 3/20/20.
//  Copyright © 2020 Michael. All rights reserved.
//

#import "MBMArtist.h"

@implementation MBMArtist

//- (instancetype)init {
//    self = [super init];
//    if (self) {
//
//        _persistedArtists = [[NSMutableDictionary alloc] init];
//
//    }
//    return self;
//}

- (instancetype)initWithArtistName:(NSString *)artistName
                        yearFormed:(int)yearFormed
                   artistBiography:(NSString *)artistBiography {
    
    self = [super init];
    if (self) {
        _artistName = [artistName copy];
        _yearFormed = yearFormed;
        _artistBiography = [artistBiography copy];
    }
    return self;
}

@end
