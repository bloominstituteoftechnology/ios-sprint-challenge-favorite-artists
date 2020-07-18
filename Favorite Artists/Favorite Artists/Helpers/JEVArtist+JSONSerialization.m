//
//  JEVArtist+JSONSerialization.m
//  Favorite Artists
//
//  Created by Joe Veverka on 7/18/20.
//  Copyright © 2020 Joe Veverka. All rights reserved.
//

#import "JEVArtist+JSONSerialization.h"

@implementation JEVArtist (NSJSONSerialiazation)

static NSString *artistNameKey = @"strArtist";
static NSString *artistBioKey = @"strBiographyEN";
static NSString *artistYearKey = @"intFormedYear";

- (instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    if (dictionary)
    {
        NSString *name = dictionary[artistNameKey];
        NSString *biography = dictionary[artistBioKey];
        NSNumber *year = dictionary[artistYearKey];
        
        if (name && biography && year)
        {
            return [self initWithName:name
                            biography:biography
                                 year:year.intValue];
        }
    }
    return nil;
}

- (NSDictionary *)createArtistDictionary
{
    return @{
        artistNameKey: self.name,
        artistBioKey: self.biography,
        artistYearKey: @(self.year)
    };
}




@end
