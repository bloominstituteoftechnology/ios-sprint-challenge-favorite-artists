//
//  LMSSong+NSJSONSerialization.m
//  Lyric Finder
//
//  Created by Lisa Sampson on 3/1/19.
//  Copyright © 2019 Lisa M Sampson. All rights reserved.
//

#import "LMSSong+NSJSONSerialization.h"

@implementation LMSSong (NSJSONSerialization)

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    NSString *artist = dictionary[@"artist"];
    NSString *trackName = dictionary[@"trackName"];
    NSString *lyrics = dictionary[@"lyrics"];
    NSNumber *rating = dictionary[@"rating"];
    
    return [self initWithArtist:artist andTrackName:trackName andLyrics:lyrics andRating:rating.intValue];
}

- (NSDictionary *)dictionaryRep {
    return @{@"artist": self.artist, @"trackName": self.trackName, @"lyrics": self.lyrics, @"rating": @(self.rating)};
}

@end
