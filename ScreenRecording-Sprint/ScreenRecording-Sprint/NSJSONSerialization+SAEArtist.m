//
//  NSJSONSerialization+SAEArtist.m
//  ScreenRecording-Sprint
//
//  Created by Sammy Alvarado on 12/4/20.
//

#import "NSJSONSerialization+SAEArtist.h"

@implementation SAEArtist (NSJSONSerialization)

- (instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    
    NSString *name = [dictionary objectForKey:@"strArtis"];
    NSString *biography = [dictionary objectForKey:@"strBiographyEN"];
    int yearFormed = [[dictionary objectForKey:@"intFormedYear"] intValue];
    int formed = yearFormed;
    
    return [self initWithArtist: name biography:biography yearFormed:formed];
}

- (NSDictionary *)toDictionary
{
    return @{@"strArtis": self.name,
             @"strBiographyEN": self.biography,
             @"intFormedYear": [[NSNumber alloc]initWithInt:self.yearFormed]};
}

@end
