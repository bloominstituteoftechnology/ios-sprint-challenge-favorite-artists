//
//  HHArtist+HHJSONSerialization.m
//  Artist
//
//  Created by Hayden Hastings on 7/19/19.
//  Copyright © 2019 Hayden Hastings. All rights reserved.
//

#import "HHArtist+HHJSONSerialization.h"
#import "HHArtist.h"

@implementation HHArtist (HHJSONSerialization)

-(instancetype)initWithDictionary:(NSDictionary *)dictionary{
    self = [super init];
    if(self){
        self.name =  [dictionary objectForKey:@"strArtist"];
        self.biography = [dictionary objectForKey:@"strBiographyEN"];
        self.yearFormed = [[dictionary objectForKey:@"intFormedYear"] intValue];
    }
    return self;
}

- (NSDictionary *)makeArtistDictionary{
    NSMutableDictionary *artistDictionary = [NSMutableDictionary dictionary];
    [artistDictionary setObject:self.name forKey:@"strArtist"];
    [artistDictionary setObject:self.biography forKey:@"strBiographyEN"];
    NSString *yearString = @(self.yearFormed).stringValue;
    NSLog(@"This is the year formed: %@", yearString);
    [artistDictionary setObject:yearString forKey:@"intFormedYear"];
    
    NSDictionary *artistDic = [NSDictionary dictionaryWithObjectsAndKeys:self.name,@"strArtist", self.biography, @"strBiographyEN", yearString, @"intFormedYear", nil];
    return artistDic;
}

@end
