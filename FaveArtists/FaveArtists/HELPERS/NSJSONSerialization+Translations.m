//
//  NSJSONSerialization+Translations.m
//  FaveArtists
//
//  Created by John Pitts on 7/19/19.
//  Copyright © 2019 johnpitts. All rights reserved.
//

#import "NSJSONSerialization+Translations.h"

@implementation LSIArtist (NSJSONSerialization_Translations)

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    self = [super init];
    if (self) {
        
        NSString *strArtist = dictionary[@"strArtist"];
        NSString *strBiographyEN = dictionary[@"strBiographyEN"];
        
        NSString *intFormedYear = dictionary[@"intFormedYear"];
        
        if (strArtist && strBiographyEN && intFormedYear) {


            self = [self initWithStrArtist:strArtist
                            strBiographyEN:strBiographyEN
                             intFormedYear:intFormedYear.longLongValue];
        } else {
            NSLog(@"Invalid artist: %@ JSON object", strArtist);
            self = nil;
        }
  
    }
    return self;
}

@end
