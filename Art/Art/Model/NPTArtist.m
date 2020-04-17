//
//  Artist.m
//  Art
//
//  Created by Nick Nguyen on 4/17/20.
//  Copyright © 2020 Nick Nguyen. All rights reserved.
//

#import "NPTArtist.h"

@implementation NPTArtist


- (instancetype)initWithArtists:(NSArray<NPTArtist *> *)artist {
    self = [super init];
    if (self) {
        _artists = artist;
    }
    return self;
}


- (instancetype)initWithName:(NSString *)name biography:(NSString *)biography yearFormed:(int)yearFormed {
    self = [super init];
    if (self) {
        _name = name;
        _biography = biography;
        _yearFormed = yearFormed;
    }
    return self;
}


- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    NSArray *artists = dictionary[@"artists"];
    NSDictionary *dataDictionary = [artists firstObject];
    
    NSString *name = dataDictionary[@"strArtist"];
    NSString *biography = dataDictionary[@"strBiographyEN"];
    NSNumber *yearFormed = dataDictionary[@"intFormedYear"];
    
    self = [self initWithName:name
                    biography:biography
                   yearFormed:yearFormed.intValue];
   
    
    return self;
}

@end
