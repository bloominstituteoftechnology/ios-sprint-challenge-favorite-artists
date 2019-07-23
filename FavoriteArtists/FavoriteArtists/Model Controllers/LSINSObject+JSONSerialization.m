//
//  LSINSObject+JSONSerialization.m
//  FavoriteArtists
//
//  Created by Alex on 7/19/19.
//  Copyright © 2019 Alex. All rights reserved.
//

#import "LSINSObject+JSONSerialization.h"

@implementation LSIArtist (JSONSerialization)

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    
    if (self = [super init]) {
        // pull values
        NSString *name  = [dictionary objectForKey:@"strArtist"];
        NSString *bio =  [dictionary objectForKey:@"strBiographyEN"];
        int *formed  = [[dictionary objectForKey:@"intFormedYear"] intValue];

        if (name != nil) {
            self = [self initWithName:name formed:formed bio:bio];
        } else {
            NSLog(@"ERROR: bad artist", name);
            self = nil;
        }
    }
    return self;
}

- (NSDictionary *)myDict {
    NSString *dateFormed = [NSString stringWithFormat:@"%d", self.formed];
    
    // Artist retrieved
    NSDictionary *artist = @{@"name": self.name, @"bio": self.bio, @"formed": dateFormed};
    
    return artist;
}

@end
