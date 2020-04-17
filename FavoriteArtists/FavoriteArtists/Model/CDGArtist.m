//
//  CDGArtist.m
//  FavoriteArtists
//
//  Created by Chris Gonzales on 4/17/20.
//  Copyright © 2020 Chris Gonzales. All rights reserved.
//

#import "CDGArtist.h"

@implementation CDGArtist

static NSString const *artistKey = @"strArtist";
static NSString const *formedYearKey = @"intFormedYead";
static NSString const *biographyKey = @"strBiographyEn";

- (instancetype)initWithArtist:(NSString *)artist
                    formedYear:(NSInteger)formedYear
                     biography:(NSString *)biography {
    self = [super init];
    if (self) {
        _artist = [artist copy];
        _formedYear = formedYear;
        _biography = [biography copy];
    }
    return self;
}

//- (instancetype)initWithArray:(NSArray *)artistArray{
//
//    NSArray *artist = [NSArray array];
//    for (NSDictionary *artistDictionary in artist) {
//        NSString *artistString = artistDictionary[@"strArtist"];
//        NSNumber *formedYear = artistDictionary[@"intFormedYear"];
//        NSString *biography = artistDictionary[@"strBiographyEn"];
//
//        self = [self initWithArtist:artistString
//                         formedYear:formedYear
//                          biography:biography];
//    }
//    return self;
//}

- (instancetype)initWithDictionary:(NSDictionary *)artistDictionary{
    
    NSString *artistString = artistDictionary[artistKey];
    NSNumber *formedYear = artistDictionary[formedYearKey];
    NSString *biography = artistDictionary[biographyKey];
    
    NSInteger yearFormedInt;
    if ([formedYear isKindOfClass:[NSNull null]]) {
        NSLog(@"No founding year");
        yearFormedInt = 0;
    } else {
        yearFormedInt = [formedYear integerValue];
    }
    
    
    self = [self initWithArtist:artistString
                     formedYear:formedYear.integerValue
                      biography:biography];
    return self;
}

-(NSDictionary *)toDictionary {
    return @{
        artistKey: self.artist,
        formedYearKey: @(self.formedYear),
        biographyKey: self.biography
    };
}
@end
