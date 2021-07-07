//
//  NSDictionary+NSJSONSerialization.m
//  LyricFinder
//
//  Created by TuneUp Shop  on 3/1/19.
//  Copyright © 2019 jkaunert. All rights reserved.
//

#import "NSDictionary+NSJSONSerialization.h"

@implementation NSDictionary (NSJSONSerialization)

+ (void)savedSongsDictFrom:(NSArray *)savedSongs {
    NSError *error = nil;
    NSData *json;
    
    // Dictionary convertable to JSON ?
    if ([NSJSONSerialization isValidJSONObject:savedSongs])
    {
        // Serialize the dictionary
        json = [NSJSONSerialization dataWithJSONObject:savedSongs options:NSJSONWritingPrettyPrinted error:&error];
        
        // If no errors, let's view the JSON
        if (json != nil && error == nil)
        {
            NSString *savedSongsJsonString = [[NSString alloc] initWithData:json encoding:NSUTF8StringEncoding];
            
            NSLog(@"JSON: %@", savedSongsJsonString);
            [savedSongsJsonString release];
            NSLog(@"%@", savedSongsJsonString);
        }
    }
}

@end
