//
//  CNSArtistModel+ArtistSerialization.m
//  ArtistsObjCSprint
//
//  Created by Ezra Black on 6/12/20.
//  Copyright © 2020 Casanova Studios. All rights reserved.
//

#import "CNSArtistModel+ArtistSerialization.h"

@implementation CNSArtistModel (ArtistSerialization)
- (instancetype) initWithDictionary: (NSDictionary *)dictionary {
    if (self = [super init]) {
      
        NSString *artistName = [dictionary objectForKey:@"strArtist"];
        
       
        NSString *biography = [dictionary[@"strBiographyEN"] length] > 0 ? [dictionary objectForKey:@"strBiographyEN"] : [NSString stringWithFormat:@"No additional information about %@ in AudioDB", artistName];
        

        int yearFormed = (dictionary[@"intFormedYear"] == (id)[NSNull null] ) ? 0 :  [[dictionary objectForKey:@"intFormedYear"] intValue];
    
        self = [self initWithArtistName:artistName biography:biography andFormedYear:yearFormed];
    }
    return self;
}

- (NSDictionary *) artistData {
    
    NSMutableDictionary *artistData = [NSMutableDictionary dictionary];
    NSString *castYearFormed = @(self.formedYear).stringValue;
    [artistData setObject:self.artistName forKey:@"strArtist"];
    [artistData setObject:self.artistBio forKey:@"strBiographyEN"];
    [artistData setObject:castYearFormed forKey:@"intFormedYear"];
   
    NSDictionary *artistDataDictionary = [NSDictionary dictionaryWithObjectsAndKeys:self.artistName, @"strArtist", self.artistBio, @"strBiographyEN", castYearFormed, @"intFormedYear", nil];
    return artistDataDictionary;
}
@end
