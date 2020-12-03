//
//  IIISong+IIIJSONSerialization.m
//  Lyric Finder
//
//  Created by Ilgar Ilyasov on 11/16/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

#import "IIISong+IIIJSONSerialization.h"

@implementation IIISong (IIIJSONSerialization)

- (instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    NSString *title = dictionary[@"title"];
    NSString *artist = dictionary[@"artist"];
    NSString *lyrics = dictionary[@"lyrics"];
    NSNumber *ratingNumber = dictionary[@"rating"];
    
    return [[IIISong alloc] initWithTitle:title artist:artist lyrics:lyrics rating:[ratingNumber intValue]];
}

- (NSDictionary *)songDictionary
{
    NSDictionary *dictionary = @{@"title" : self.title, @"artist" : self.artist,
                                 @"lyrics" : self.lyrics, @"rating" : @(self.rating)};
    return dictionary;
}

@end
