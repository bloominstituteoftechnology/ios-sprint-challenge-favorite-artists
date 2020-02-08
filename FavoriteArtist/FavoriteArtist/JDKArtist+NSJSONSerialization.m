//
//  JDKArtist+NSJSONSerialization.m
//  FavoriteArtist
//
//  Created by John Kouris on 2/8/20.
//  Copyright © 2020 John Kouris. All rights reserved.
//

#import "JDKArtist+NSJSONSerialization.h"
#import "JDKArtist.h"

@implementation JDKArtist (JDKNSJSONSerialization)

- (instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    if (self = [super init]) {
        NSString *name = dictionary[@"strArtist"];
        NSString *biography = dictionary[@"strBiographyEN"];
        NSString *yearNum = dictionary[@"intFormedYear"];
        
        if ([yearNum isKindOfClass:[NSString class]] || [yearNum isKindOfClass:[NSNumber class]]) {
            int yearFormed = [yearNum intValue];
            return [self initWithName:name biography:biography yearFormed:yearFormed];
        } else {
            int yearFormed = 0;
            return [self initWithName:name biography:biography yearFormed:yearFormed];
        }
    }
    return self;
}

- (NSDictionary *)toDictionary
{
    NSMutableDictionary *artistDictionary = [NSMutableDictionary dictionary];
    [artistDictionary setObject:self.name forKey:@"strArtist"];
    [artistDictionary setObject:self.biography forKey:@"strBiographyEN"];
    
    NSString *yearFormedString = @(self.yearFormed).stringValue;
    [artistDictionary setObject:yearFormedString forKey:@"intFormedYear"];
    
    NSDictionary *finalArtistDictionary = [NSDictionary dictionaryWithObjectsAndKeys:self.name, @"strArtist", self.biography, @"strBiographyEN", yearFormedString, @"intFormedYear", nil];
    
    return finalArtistDictionary;
}

@end
