//
//  Artist+NSJSONSerialization.m
//  FavArtist
//
//  Created by Norlan Tibanear on 11/30/20.
//

#import "Artist.h"
#import "Artist+NSJSONSerialization.h"

@implementation Artist (NSJSONSerialization)

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
   
   
    NSString *artistName = [dictionary objectForKey:@"strArtist"];
    if (![artistName isKindOfClass:NSString.class]) return nil;
    
    NSNumber *formedYear = [dictionary objectForKey:@"intFormedYear"];
    if ([formedYear isKindOfClass:NSNull.class]) {
        formedYear = 0;
    }
    
    NSString *biography = [dictionary objectForKey:@"strBiographyEN"];
    if (![biography isKindOfClass:NSString.class]) return nil;
    
    
    return [self initWithArtistName:artistName
                         formedYear:formedYear.intValue
                          biography:biography];
    
}//

- (NSDictionary *)toDictionary {
    NSNumber *formedYear = [NSNumber numberWithInt:self.formedYear];
    NSDictionary *dictionary = @{
        @"strArtist" : self.artistName,
        @"intFormedYear" : formedYear,
        @"strBiographyEN" : self.biography
    };
    return dictionary;
}



@end
