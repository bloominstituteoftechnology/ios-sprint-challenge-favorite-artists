//
//  LAArtist+NSJSONSerialization.m
//  LAFavoriteArtists
//
//  Created by Angel Buenrostro on 4/5/19.
//  Copyright © 2019 Angel Buenrostro. All rights reserved.
//

#import "LAArtist+NSJSONSerialization.h"
#import "LAArtist.h"

@implementation LAArtist (NSJSONSerialization)

-(instancetype)initWithDictionary:(NSDictionary *)dictionary{
    self = [super init];
    if(self){
                self.name =  [dictionary objectForKey:@"strArtist"];
                self.biography = [dictionary objectForKey:@"strBiographyEN"];
                self.year = [[dictionary objectForKey:@"intFormedYear"] intValue];
    }
    return self;
}

- (NSDictionary *)makeArtistDictionary{
    NSMutableDictionary *artistDictionary = [NSMutableDictionary dictionary];
    [artistDictionary setObject:self.name forKey:@"strArtist"];
    [artistDictionary setObject:self.biography forKey:@"strBiographyEN"];
    NSString *yearString = @(self.year).stringValue;
    NSLog(@"This is the year formed: %@", yearString);
    [artistDictionary setObject:yearString forKey:@"intFormedYear"];
    
    NSDictionary *artistDic = [NSDictionary dictionaryWithObjectsAndKeys:self.name,@"strArtist", self.biography, @"strBiographyEN", yearString, @"intFormedYear", nil];
    return artistDic;
}

@end
