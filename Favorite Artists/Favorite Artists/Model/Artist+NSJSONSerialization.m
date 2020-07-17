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
    
    NSString *name = dictionary[@"strArtist"];
    
    if (!name) {
        return nil;
    }
    
    NSString *bio = dictionary[@"strBiographyEN"];
    
    NSNumber *mapIndex = dictionary[@"intFormedYear"];
    int formed = [mapIndex intValue];
    
    self = [self initWithName:name
                          bio:bio
                       formed:formed];
    
    return self;
}

- (NSDictionary *)toDictionary {

    NSDictionary *dict = @{@"strArtist":self.name,
                           @"strBiographyEN":self.bio,
                           @"intFormedYear":[NSNumber numberWithInt:self.formed] };
    
    return dict;
    
}

@end
