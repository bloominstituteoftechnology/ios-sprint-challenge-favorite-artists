//
//  Artist+NSJSONSerialization.m
//  Favorite Artists
//
//  Created by Michael Stoffer on 11/9/19.
//  Copyright © 2019 Michael Stoffer. All rights reserved.
//

#import "Artist+NSJSONSerialization.h"

@implementation Artist (NSJSONSerialization)

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
