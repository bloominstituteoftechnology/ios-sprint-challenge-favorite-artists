//
//  SAEArtist+NSJSONSerialization.m
//  ScreenRecording-Sprint
//
//  Created by Sammy Alvarado on 2/15/21.
//

#import "SAEArtist.h"
#import "SAEArtist+NSJSONSerialization.h"

@implementation SAEArtist (NSJSONSerialization)

- (instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    NSString *artistName = [dictionary objectForKey:@"strArtist"];
    if (![artistName isKindOfClass:NSString.class]) return nil;
    
    NSString *biography = [dictionary objectForKey:@"strBiographyEN"];
    if (![biography isKindOfClass:NSString.class]) return nil;
    
    NSNumber *formedYear = [dictionary objectForKey:@"intFormedYear"];
    if ([formedYear isKindOfClass:NSNull.class])
    {
        formedYear = 0;
    }
    
    return [self initWithArtistName:artistName
                          biography:biography
                         formedYear:formedYear.intValue];
}

- (NSDictionary *)toDictionary {
    NSNumber *formedYear = [NSNumber numberWithInt:self.formedYear];
    NSDictionary *dictionary = @{
        @"strArtist" : self.artistName,
        @"strBiographyEN" : self.biography,
        @"intFormedYear" : formedYear
    };
    return dictionary;
}

@end
