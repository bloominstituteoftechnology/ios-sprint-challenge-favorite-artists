//
//  NYCArtist.m
//  FavArtists
//
//  Created by Nathanael Youngren on 4/5/19.
//  Copyright © 2019 Nathanael Youngren. All rights reserved.
//

#import "NYCArtist.h"

@implementation NYCArtist

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    
    self = [super init];
    if (self) {
        
        NSDictionary *internalDict = [dictionary[@"artists"] firstObject];
        _name = internalDict[@"strArtist"];
        _biography = internalDict[@"strBiographyEN"];
        
        NSString *yearFormedAsString = internalDict[@"intFormedYear"];
        _yearFormed = [yearFormedAsString intValue];
    }
    return self;
}

- (void)encodeWithCoder:(nonnull NSCoder *)aCoder {
    [aCoder encodeObject:self.name forKey:@"name"];
    [aCoder encodeObject:self.biography forKey:@"biography"];
    [aCoder encodeInteger:self.yearFormed forKey:@"yearFormed"];
}

- (nullable instancetype)initWithCoder:(nonnull NSCoder *)aDecoder {
    self = [super init];
    if (self) {
        _name = [aDecoder decodeObjectForKey:@"name"];
        _biography = [aDecoder decodeObjectForKey:@"biography"];
        _yearFormed = [aDecoder decodeIntForKey:@"yearFormed"];
    }
    return self;
}

@end
