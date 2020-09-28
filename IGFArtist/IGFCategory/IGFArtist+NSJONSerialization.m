//
//  IGFArtist+NSJONSerialization.m
//  IGFArtist
//
//  Created by Ian French on 9/27/20.
//

#import "IGFArtist+NSJONSerialization.h"

@implementation IGFArtist(NSJONSerialization)

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {

    NSString *name = dictionary[@"strArtist"];
    NSString *stringYearFormed = dictionary[@"intFormedYear"];
    int year = 0;

    if ([stringYearFormed isKindOfClass:[NSString class]]) {
       year = [stringYearFormed intValue];
    }
    NSString *biography = dictionary[@"strBiographyEN"];

    return [self initWithName:name biography:biography formedYear:year];

}

- (NSDictionary *)toDictionary {

    NSDictionary *artistDictionary = @{
        @"strArtist" : self.name,
        @"intFormedYear" : [self formedYearString],
        @"strBiographyEN" : self.biography
    };

    return artistDictionary;
}

@end
