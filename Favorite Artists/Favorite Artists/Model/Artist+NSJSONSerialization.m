//
//  Artist+NSJSONSerialization.m
//  Favorite Artists
//
//  Created by Vincent Hoang on 7/17/20.
//  Copyright © 2020 Vincent Hoang. All rights reserved.
//

#import "Artist+NSJSONSerialization.h"

@implementation Artist (Artist_NSJSONSerialization)

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    NSArray *response = dictionary[@"artists"];
    
    if (!response) {
        return nil;
    }
    
    NSDictionary *index = response.firstObject;
    
    NSString *name = index[@"strArtist"];
    
    if (!name) {
        return nil;
    }
    
    NSString *bio = index[@"strBiographyEN"];
    
    NSNumber *mapIndex = index[@"intFormedYear"];
    int formed = [mapIndex intValue];
    
    self = [self initWithName:name
                          bio:bio
                       formed:formed];
    
    return self;
}

- (NSDictionary *)toDictionary {
    
    NSDictionary *dict = @{@"strArtist": self.name,
                           @"intFormedYear": [[NSNumber alloc] initWithInt:self.formed],
                           @"strBiographyEN": self.bio };
    
    return dict;
}

@end
