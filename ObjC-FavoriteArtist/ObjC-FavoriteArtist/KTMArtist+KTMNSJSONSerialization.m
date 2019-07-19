//
//  KTMArtist+KTMNSJSONSerialization.m
//  ObjC-FavoriteArtist
//
//  Created by Kobe McKee on 7/19/19.
//  Copyright © 2019 Kobe McKee. All rights reserved.
//

#import "KTMArtist+KTMNSJSONSerialization.h"
#import "KTMArtist.h"

@implementation KTMArtist (KTMNSJSONSerialization)

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    self = [super init];
    if (self) {
        self.name = [dictionary objectForKey:@"strArtist"];
        self.biography = [dictionary objectForKey:@"strBiographyEN"];
        self.yearFormed = [[dictionary objectForKey:@"intFormedYear"] intValue];
    }
    return self;
}


- (NSDictionary *)artistDictionary {
    
    NSMutableDictionary *artistDictionary = [NSMutableDictionary dictionary];
    [artistDictionary setObject:self.name forKey:@"strArtist"];
    [artistDictionary setObject:self.biography forKey:@"strBiographyEN"];
    
    NSString *yearFormedSteing = @(self.yearFormed).stringValue;
    [artistDictionary setObject:yearFormedSteing forKey:@"intFormedYear"];
    
    NSDictionary *artistDict = [NSDictionary dictionaryWithObjectsAndKeys:self.name, @"strArtist", self.biography, @"strBiographyEN", self.yearFormed, @"intFormedYear", nil];
    return artistDict;
    
}
@end
