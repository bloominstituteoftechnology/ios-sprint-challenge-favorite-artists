//
//  AMCArtist+NSJSONSerialization.m
//  FavArtist
//
//  Created by Aaron Cleveland on 3/20/20.
//  Copyright © 2020 Aaron Cleveland. All rights reserved.
//

#import "AMCArtist+NSJSONSerialization.h"

@implementation AMCArtist (NSJSONSerialization)

- (instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    int formed = [[dictionary objectForKey:@"intFormedYear"] intValue];
    NSString *name = [dictionary objectForKey:@"strArtist"];
    NSString *bio = [dictionary objectForKey:@"strBiographyEN"];
    int yearFormed = formed;
    
    return [self initWithArtistName:name biography:bio formed:yearFormed];
}

- (NSDictionary *)toDictionary
{
    return @{@"strBiographyEN": self.bio, @"strArtist": self.name, @"intFormedYear":[[NSNumber alloc] initWithInt:self.yearFormed]};
}

@end
