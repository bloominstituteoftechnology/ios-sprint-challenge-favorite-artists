//
//  SKIArtist+NSJSONSerialization.m
//  FavoriteArtists
//
//  Created by Joshua Rutkowski on 5/31/20.
//

#import "SKIArtist.h"
#import "SKIArtist+NSJSONSerialization.h"

@implementation SKIArtist (NSJSONSerialization)

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    NSString *name = dictionary[@"strArtist"];
    NSString *about = dictionary[@"strBiographyEN"];
    NSLog(@"%@", dictionary[@"intFormedYear"]);
    NSString *yearNum = dictionary[@"intFormedYear"];//yearInt;
    if ([yearNum isKindOfClass:[NSString class]] || [yearNum isKindOfClass:[NSNumber class]]) {
        NSLog(@"%@", yearNum);
        int year = [yearNum intValue];
        return [self initWithName: name year:year about:about];
    } else {
        int year = 0;
        return [self initWithName: name year:year about:about];
    }
}

- (NSDictionary *)toDictionary {
    NSNumber *yearNum = [NSNumber numberWithInt:self.year];
    NSDictionary *dictionary = @{
        @"strArtist" : self.name,
        @"intFormedYear" : yearNum,
        @"strBiographyEN" : self.about
    };
    return dictionary;
}
@end
