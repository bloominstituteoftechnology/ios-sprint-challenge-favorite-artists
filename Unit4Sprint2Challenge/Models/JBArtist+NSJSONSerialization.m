//
//  JBArtist+NSJSONSerialization.m
//  Unit4Sprint2Challenge
//
//  Created by Jon Bash on 2020-01-24.
//  Copyright © 2020 Jon Bash. All rights reserved.
//

#import "JBArtist+NSJSONSerialization.h"


static NSString *nameKey = @"strArtist";
static NSString *bioKey = @"strBiographyEN";
static NSString *formedKey = @"intFormedYear";
static NSString *bornKey = @"intBornYear";


@implementation JBArtist (NSJSONSerialization)

- (instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    NSString *name = dictionary[nameKey];
    NSString *bio = dictionary[bioKey];
    NSNumber *yearFormed = dictionary[formedKey];
    NSNumber *yearBorn = dictionary[bornKey];
    BOOL wasBorn = (yearFormed == nil);

    self = [self initWithName:name
                    biography:bio
                   originYear:(wasBorn ? yearBorn : yearFormed).intValue
                      wasBorn:wasBorn];

    return self;
}

- (NSDictionary *)toDictionary
{
    NSMutableDictionary *dictionary = [[NSMutableDictionary alloc] init];
    dictionary[nameKey] = self.name;
    dictionary[bioKey] = self.biography;
    NSString *originKey = (self.wasBorn) ? bornKey : formedKey;
    dictionary[originKey] = [NSNumber numberWithInt:self.originYear];

    return [dictionary copy];
}

@end
