//
//  BYArtist+BYNSJSONSerialization.m
//  Artist-objc
//
//  Created by Bradley Yin on 10/11/19.
//  Copyright © 2019 bradleyyin. All rights reserved.
//

#import "BYArtist+BYNSJSONSerialization.h"

#import <Foundation/Foundation.h>


@implementation BYArtist (BYNSJSONSerialization)

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    if(self = [super init]) {
        NSArray *artists = dictionary[@"artists"];
        NSDictionary *artist = artists[0];
        self.name = artist[@"strArtist"];
        self.biography = artist[@"strBiographyEN"];
        self.year = [artist[@"intFormedYear"] intValue];
        
    }
    return self;
}

- (instancetype)initWithFileDictionary:(NSDictionary *)dictionary {
    if(self = [super init]) {
        
        self.name = dictionary[@"name"];
        self.biography = dictionary[@"biography"];
        self.year = [dictionary[@"year"] intValue];
        
    }
    return self;
}

- (NSDictionary *)toDictionary {
    NSDictionary *dictionary = [[NSMutableDictionary alloc] init];
    [dictionary setValue: self.name forKey:@"name"];
    [dictionary setValue: self.biography forKey:@"biography"];
    [dictionary setValue: [NSNumber numberWithInt:self.year] forKey:@"year"];
    
    return dictionary;
}

@end
