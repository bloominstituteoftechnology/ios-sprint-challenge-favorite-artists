//
//  EPWArtist+NSJSONSerialization.m
//  Favorite-Artists Sprint
//
//  Created by Elizabeth Wingate on 4/17/20.
//  Copyright © 2020 Lambda. All rights reserved.
//

#import "EPWArtist+NSJSONSerialization.h"

@implementation EPWArtist (NSJSONSerialization)

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    if (self = [super init]) {
        self.name = [dictionary objectForKey:@"strArtist"];
        
        if (![[dictionary objectForKey:@"intFormedYear"] isKindOfClass:[NSNull class]]) {
            self.formedYear = [[dictionary objectForKey:@"intFormedYear"] integerValue];
        } else {
            self.formedYear = 0;
        }
        self.biography = [dictionary objectForKey:@"strBiographyEN"];
    }
    return self;
}

- (NSDictionary *)toDictionary {
    NSDictionary *artistDictionary = @{
        @"strArtist": self.name,
        @"intFormedYear": [[NSNumber alloc] initWithInt:(int)self.formedYear],
        @"strBiographyEN": self.biography
    };
    return artistDictionary;
}

@end
