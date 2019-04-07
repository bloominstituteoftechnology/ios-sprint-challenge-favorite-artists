//
//  LAArtist+NSJSONSerialization.m
//  LAFavoriteArtists
//
//  Created by Angel Buenrostro on 4/5/19.
//  Copyright © 2019 Angel Buenrostro. All rights reserved.
//

#import "LAArtist+NSJSONSerialization.h"
#import "LAArtist.h"

//@interface LAArtist (NSJSONSerialization){
//
//
//}
//
//@end

@implementation LAArtist (NSJSONSerialization)

-(instancetype)initWithDictionary:(NSDictionary *)dictionary{
    self = [super init];
    if(self){
//        NSArray *artists = dictionary [@"artists"];
//        NSDictionary *artistDictionary = artists[0];
        
                self.name =  [dictionary objectForKey:@"strArtist"];
                self.biography = [dictionary objectForKey:@"strBiographyEN"];
                self.year = (int)[dictionary objectForKey:@"intFormedYear"];
        
//        self.name = artistDictionary[@"strArtist"];
//        self.biography = artistDictionary[@"strBiographyEN"];
//        self.year = (int)artistDictionary[@"intFormedYear"];
    }
    return self;
}

- (NSDictionary *)makeArtistDictionary{
    NSMutableDictionary *artistDictionary = [NSMutableDictionary dictionary];
    [artistDictionary setObject:self.name forKey:@"strArtist"];
    [artistDictionary setObject:self.biography forKey:@"strBiographyEN"];
    //    NSString* yearString = [NSString stringWithFormat:@"%i", artist.year];
    NSString *yearString = @(self.year).stringValue;
    [artistDictionary setObject:yearString forKey:@"intFormedYear"];
    
    NSDictionary *artistDic = [NSDictionary dictionaryWithObjectsAndKeys:self.name,@"strArtist", self.biography, @"strBiographyEN", yearString, @"intFormedYear", nil];
    
    //    NSDictionary *finalDictionary = artistDictionary;
    return artistDic;
}

@end
