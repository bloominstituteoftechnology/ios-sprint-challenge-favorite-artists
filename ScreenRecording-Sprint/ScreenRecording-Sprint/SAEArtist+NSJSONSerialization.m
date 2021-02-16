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
    NSString *artistName = [dictionary objectForKey:@"stringArtist"];
    if (![artistName isKindOfClass:NSString.class]) return nil;
    
    NSString *biography = [dictionary objectForKey:@"stringBiography"];
    if (![biography isKindOfClass:NSString.class]) return nil;
    
    NSNumber *yearFormed = [dictionary objectForKey:@"intYearFormed"];
    if ([yearFormed isKindOfClass:NSNull.class]) { yearFormed = 0;}
    
    return [self initWithArtistName:artistName
                          biography:biography
                         yearFormed:yearFormed.intValue];
}

- (NSDictionary *)toDictionary
{
    NSNumber *yearFormed = [NSNumber numberWithInt:self.yearFormed];
    NSDictionary *dictionary = @{
        @"stringArtist" : self.artistName,
        @"stringBiography" : self.biography,
        @"intYearFormed" : yearFormed
    };
    return dictionary;
}

@end
