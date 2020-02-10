//
//  VVSArtist+NSJSONSerialization.m
//  Favorite Artists
//
//  Created by Vici Shaweddy on 2/9/20.
//  Copyright © 2020 Vici Shaweddy. All rights reserved.
//

#import "VVSArtist+NSJSONSerialization.h"

@implementation VVSArtist (NSJSONSerialization)

- (instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    if (self = [super init]) {
        self.name = [dictionary objectForKey:@"strArtist"];
        
        // check nil
        if (![[dictionary objectForKey:@"intFormedYear"] isKindOfClass:[NSNull class]]) {
            self.formedYear = [[dictionary objectForKey:@"intFormedYear"] integerValue];
        } else {
            self.formedYear = 0;
        }
        
        self.biography = [dictionary objectForKey:@"strBiographyEN"];
    }
    return self;
}

- (NSDictionary *)toDictionary
{
    NSDictionary *artistDictionary = @{
        @"strArtist": self.name,
        @"intFormedYear": [[NSNumber alloc] initWithInt:(int)self.formedYear],
        @"strBiographyEN": self.biography
    };
    
    return artistDictionary;
}

@end
