//
//  NSJSONSerialization+KRCArtistCreation.m
//  Favorite Artists
//
//  Created by Christopher Aronson on 7/19/19.
//  Copyright © 2019 Christopher Aronson. All rights reserved.
//

#import "NSJSONSerialization+KRCArtistCreation.h"
#import "KRCArtist.h"


@implementation NSJSONSerialization (KRCArtistCreation)

+ (KRCArtist *)ArtistFromJson:(NSDictionary *)jsonictionary {
    
    NSArray *artistArray = [jsonictionary objectForKey:@"artists"];
    
    NSDictionary *artistInfo = [[NSDictionary alloc] init];
    NSString *name = nil;
    NSString *bio = nil;
    NSInteger yearFormed = 0;
    
    if ([artistArray isKindOfClass:[NSArray class]]) {
        artistInfo = [artistArray objectAtIndex:0];
        
        if ([artistInfo objectForKey:@"strArtist"]) {
            name = [NSString stringWithFormat:@"%@", [artistInfo objectForKey:@"strArtist"]];
        }
        
        if ([artistInfo objectForKey:@"strBiographyEN"]) {
            bio = [NSString stringWithFormat:@"%@", [artistInfo objectForKey:@"strBiographyEN"]];
        }
        
        if ([artistInfo objectForKey:@"intFormedYear"]) {
            yearFormed = [[artistInfo objectForKey:@"intFormedYear"] integerValue];
        }
    }

    return [[KRCArtist alloc] initWithName:name year:yearFormed bio:bio];
}

+ (NSDictionary *)JsonFromArtists:(NSArray *)artists {
    
    NSMutableArray *artistArray = [[NSMutableArray alloc] init];
    
    for(int i = 0; i < [artists count]; i++) {
        KRCArtist *artist = [artists objectAtIndex:i];
        
        NSString *name = [artist artistName];
        NSString *bio = [artist bio];
        NSInteger yearFormed = [artist yearFormed];
        NSNumber *year = [NSNumber numberWithInteger:yearFormed];
        NSDictionary *artistInfo = @{@"strArtist": name, @"strBiographyEN": bio, @"intFormedYear": year};
        [artistArray addObject:artistInfo];
    }
    
    NSDictionary *jsonDictionary = @{@"artists": artistArray};
    
    return jsonDictionary;
}

@end
