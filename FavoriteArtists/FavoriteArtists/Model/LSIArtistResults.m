//
//  LSIArtistResults.m
//  FavoriteArtists
//
//  Created by Shawn Gee on 5/15/20.
//  Copyright © 2020 Swift Student. All rights reserved.
//

#import "LSIArtistResults.h"
#import "LSIArtist.h"
#import "LSIArtist+NSJSONSerialization.h"

@implementation LSIArtistResults

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    self = [super init];
    if (!self) { return nil; }
    
    NSArray<NSDictionary *> *artistDicts = dictionary[@"artists"];
    NSMutableArray<LSIArtist *> *artists = [[NSMutableArray alloc] init];
    
    for (NSDictionary *artistDict in artistDicts) {
        LSIArtist *artist = [[LSIArtist alloc] initWithDictionary:artistDict];
        [artists addObject:artist];
    }
    
    _artists = [artists copy];
    
    return self;
}

@end
