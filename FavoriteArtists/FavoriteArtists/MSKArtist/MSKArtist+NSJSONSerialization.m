//
//  MSKArtist+NSJSONSerialization.m
//  FavoriteArtists
//
//  Created by Lambda_School_Loaner_268 on 5/16/20.
//  Copyright © 2020 Lambda. All rights reserved.
//
#import "MSKArtist+NSJSONSerialization.h"
#import "MSKArtist.h"
@implementation MSKArtist (NSJSONSerialization)
-(instancetype)initFromDict:(NSDictionary *)dict {
    NSString *name = dict[@"strArtist"];
    NSString *bio = dict[@"strBiographyEN"];
    NSLog(@"%@", dict[@"intFormedYear"]);
    NSString *yearFormed = dict[@"intFormedYear"];//yearInt;
    if ([yearFormed isKindOfClass:[NSString class]] || [yearFormed isKindOfClass:[NSNumber class]]) {
        NSLog(@"%@", yearFormed);
        int year = [yearFormed intValue];
        return [self initWithName:name
                  artistBiography:bio
                       yearFormed:year];
    } else {
        int year = 0;
        return [self initWithName:name
                  artistBiography:bio
                       yearFormed:year];
        }
    }
- (NSDictionary *) toDict {
    NSNumber *yearNum = [NSNumber numberWithInt:self.yearFormed];
    NSDictionary * dict = @{@"strArtist": self.artistName,
                            @"strBiographyEN": self.artistBiography,
                            @"intFormedYear": yearNum};
    return dict;
}
@end

