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
    
    NSDictionary *artistInfo = [artistArray objectAtIndex:0];

    NSString *name = [NSString stringWithFormat:@"%@", [artistInfo objectForKey:@"strArtist"]];
    NSString *bio = [NSString stringWithFormat:@"%@", [artistInfo objectForKey:@"strBiographyEN"]];
    NSInteger yearFormed = [[artistInfo objectForKey:@"intFormedYear"] integerValue];

    return [[KRCArtist alloc] initWithName:name year:yearFormed bio:bio];
}

+ (NSDictionary *)JsonFromArtists:(NSArray *)artists {
    
    NSMutableArray *artistArray = [[NSMutableArray alloc] init];
    
    for(int i = 0; [artists count]; i++) {
        KRCArtist *artist = [artists objectAtIndex:i];
        
        NSString *name = [artist artistName];
        NSString *bio = [artist bio];
        NSInteger yearFormed = [artist yearFormed];
        NSNumber *year = [NSNumber numberWithInteger:yearFormed];
        NSDictionary *artistInfo = @{@"trArtist": name, @"strBiographyEN": bio, @"strBiographyEN": year};
        [artistArray addObject:artistInfo];
    }
    
    NSDictionary *jsonDictionary = @{@"artist": artistArray};
    
    return jsonDictionary;
}

@end
