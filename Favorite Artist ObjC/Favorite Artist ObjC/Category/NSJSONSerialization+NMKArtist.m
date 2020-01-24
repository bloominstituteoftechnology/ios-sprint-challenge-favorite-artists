//
//  NSJSONSerialization+NMKArtist.m
//  Favorite Artist ObjC
//
//  Created by Niranjan Kumar on 1/24/20.
//  Copyright © 2020 Nar Kumar. All rights reserved.
//

#import "NSJSONSerialization+NMKArtist.h"

@implementation NMKArtist (NSJSONSerialization)

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    
    NSString *name = [dictionary objectForKey:@"strArtist"]; // see if "objectForKey" is needed
    NSString *biography = [dictionary objectForKey:@"strBiographyEN"];
    
    int yearData = [[dictionary objectForKey:@"intFormedYear"] intValue];
    
//    int yearFormed = yearData;
    return [ self initWithArtistName:name biography:biography yearFormed:yearData ];
    
}

- (NSDictionary *)toDictionary {
    
    // this takes the values and returns the model objects to save the artist attributes needed
    return @{@"strArtist": self.artist, @"strBiographyEN": self.biography, @"intFormedYear": [[NSNumber alloc] initWithInt:self.yearFormed]};
}



@end
