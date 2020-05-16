//
//  CBDArtist+NSJSONSerialization.m
//  FavoriteArtist
//
//  Created by Christopher Devito on 5/15/20.
//  Copyright © 2020 Christopher Devito. All rights reserved.
//

#import "CBDArtist+NSJSONSerialization.h"
#import "CBDArtist.h"

@implementation CBDArtist (NSJSONSerialization)

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    NSArray *artists = dictionary[@"artists"];
    if (![artists isKindOfClass:[NSNull class]]) {
        NSDictionary *artist = [artists objectAtIndex:0];
        
        NSString *strArtist = artist[@"strArtist"];
        NSString *intFormedYear = artist[@"intFormedYear"];
        NSString *strBiographyEN = artist[@"strBiographyEN"];
        
        int yearFormed;
        if ([intFormedYear isKindOfClass:[NSNull class]]) {
            yearFormed = 0;
        } else {
            yearFormed = [intFormedYear intValue];
        }
        
        return [self initWithStrArtist:strArtist yearFormed:yearFormed strBiographyEN:strBiographyEN];
    } else {
        return nil;
    }
}

- (instancetype)initWithLocalDictionary:(NSDictionary *)dictionary {
    NSString *strArtist = dictionary[@"artist"];
    NSString *intFormedYear = dictionary[@"yearFormed"];
    NSString *strBiographyEN = dictionary[@"biography"];
    
    int yearFormed = [intFormedYear intValue];
    
    return [self initWithStrArtist:strArtist yearFormed:yearFormed strBiographyEN:strBiographyEN];
}

- (NSDictionary *)toDictionary {
    NSMutableDictionary *dictionary = [[NSMutableDictionary alloc] init];
    [dictionary setValue:self.strArtist forKey:@"artist"];
    [dictionary setValue:self.strBiographyEN forKey:@"biography"];
    NSNumber *year = [NSNumber numberWithInt:self.yearFormed];
    [dictionary setValue:year forKey:@"yearFormed"];
    NSDictionary *artistDictionary = dictionary;
    return artistDictionary;
}

@end
