//
//  SABArtistResults.m
//  FavoriteArtistsSprint
//
//  Created by Stephanie Ballard on 7/17/20.
//  Copyright © 2020 Stephanie Ballard. All rights reserved.
//

#import "SABArtistResults.h"
#import "SABArtist.h"

@implementation SABArtistResults

- (instancetype)initWithArtists:(NSArray<SABArtist *> *)artists {
    self = [super init];
    if (self) {
        _artists = artists;
    }
    return self;
}

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    NSArray *artistDictionaries = dictionary[@"artists"];
    NSMutableArray *artists = [[NSMutableArray alloc] init];
    
    for (NSDictionary *artistDictionary in artistDictionaries) {
        SABArtist *artist = [[SABArtist alloc] initWithDictionary:artistDictionary];
        if (artist) {
            [artists addObject: artist];
        } else {
            NSLog(@"Unable to parse artist dictionary: %@", artistDictionary);
        }
    }
    
    self = [self initWithArtists:artists];
    return self;
}

@end
