//
//  YZINSObject+JSONSerialization.m
//  Lyrics-Finder
//
//  Created by Yvette Zhukovsky on 1/25/19.
//  Copyright © 2019 Yvette Zhukovsky. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YZINSObject+JSONSerialization.h"
#import "YZISongs.h"


@implementation YZISongs (YZIJSONSerialization)

- (instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    NSString *title = dictionary[@"title"];
    NSString *artistName = dictionary[@"artist"];
    NSString *lyrics = dictionary[@"lyrics"];
    NSNumber *ratings = dictionary[@"rating"];
    
    return [[YZISongs alloc] initWithTitle:title lyrics:lyrics artistName:artistName  rating:[ratings intValue]];
}

- (NSDictionary *)songDictionary
{
    NSDictionary *dictionary = @{@"title" : self.title, @"artist" : self.artistName,
                                 @"lyrics" : self.lyrics, @"rating" : @(self.rating)};
    return dictionary;
}

@end

