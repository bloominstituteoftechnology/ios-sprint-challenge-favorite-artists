//
//  IACSong+NSJSONSerialization.m
//  Lyric Finder Async III
//
//  Created by Ivan Caldwell on 3/10/19.
//  Copyright © 2019 Ivan Caldwell. All rights reserved.
//

#import "IACSong+NSJSONSerialization.h"

@implementation IACSong (NSJSONSerialization)

// An initializer to intialize your model object from a dictionary
- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    NSString *title  = dictionary[@"trackName"];
    NSString *artist = dictionary[@"artist"];
    NSString *lyrics = dictionary[@"lyrics"];
    NSNumber *rating = dictionary[@"rating"];
    
    return [self initWithSongTitle:title artist:artist lyrics:lyrics rating: rating.intValue];
}

// A function that returns your model object in dictionary form
- (NSDictionary *)songDictionary {
    return @{@"trackName": self.title,
             @"artist": self.artist,
             @"lyrics": self.lyrics,
             // Convert the primitive to an object for dictionary
             @"rating": [NSNumber numberWithInt: self.rating]};
}

@end
