//
//  LSIArtist+NSJSONSerialization.m
//  FavoriteArtists
//
//  Created by Luqmaan Khan on 10/11/19.
//  Copyright © 2019 Luqmaan Khan. All rights reserved.
//

#import "LSIArtist+NSJSONSerialization.h"
#import "LSIArtist.h"
#import "TargetConditionals.h"
#if !TARGET_OS_IOS
#import <AppKit/AppKit.h>
#endif


@implementation LSIArtist (NSJSONSerialization)


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
