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

- (KRCArtist *)ArtistFromJson:(NSDictionary *)json {
    
    NSArray *artistArray = [json objectForKey:@"artist"];
    NSDictionary *artistInfo = [artistArray objectAtIndex:0];
    
    NSString *name = [NSString stringWithFormat:@"%@", [artistInfo objectForKey:@"strArtist"]];
    NSString *bio = [NSString stringWithFormat:@"%@", [artistInfo objectForKey:@"strBiographyEN"]];
    NSInteger yearFormed = [[artistInfo objectForKey:@"intFormedYear"] integerValue];
    
    return [[KRCArtist alloc] initWithName:name year:yearFormed bio:bio];
}

- (NSDictionary *)JsonFromArtist:(KRCArtist *)artist {
 
    NSString *name = [artist artistName];
    NSString *bio = [artist bio];
    NSInteger yearFormed = [artist yearFormed];
    
    NSNumber *year = [NSNumber numberWithInteger:yearFormed];
    
    NSDictionary *artistInfo = @{@"trArtist": name, @"strBiographyEN": bio, @"strBiographyEN": year};
    NSArray *artistArray = @[artistInfo];
    NSDictionary *jsonDictionary = @{@"artist": artistArray};
    
    return jsonDictionary;
}

@end
