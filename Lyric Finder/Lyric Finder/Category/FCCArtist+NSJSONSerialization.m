//
//  FCCArtist+NSJSONSerialization.m
//  Lyric Finder
//
//  Created by Lambda_School_Loaner_34 on 4/5/19.
//  Copyright © 2019 Frulwinn. All rights reserved.
//

#import "FCCArtist+NSJSONSerialization.h"

@implementation FCCArtist (NSJSONSerialization)

- (instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    
    NSString *artist = dictionary[@"artist"];
    NSNumber *yearObject = dictionary[@"year"];
    NSInteger year = [yearObject integerValue];
    NSString *biography = dictionary[@"biography"];
    
    return [[FCCArtist alloc] initWithArtist:artist year:year biography:biography];
}

- (NSDictionary *)dictionaryFromObject
{
    
    NSNumber *year = [NSNumber numberWithInteger:self.year];
    
    return @{
             @"artist" : self.artist,
             @"year" : year,
             @"biography" : self.biography
             };
}

@end
