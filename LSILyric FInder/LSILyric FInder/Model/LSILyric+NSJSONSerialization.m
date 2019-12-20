//
//  LSILyric+NSJSONSerialization.m
//  LSILyric FInder
//
//  Created by Iyin Raphael on 3/8/19.
//  Copyright © 2019 Iyin Raphael. All rights reserved.
//

#import "LSILyric+NSJSONSerialization.h"

@implementation LSILyric (NSJSONSerialization)

- (instancetype)initFromDictionary:(NSDictionary *)dictionary
{
    NSString *title = dictionary[@"trackName"];
    NSString *artistName = dictionary[@"artist"];
    NSString *lyrics = dictionary[@"lyrics"];
    NSInteger rating = [dictionary[@"rating"] integerValue];
    
    return [self initWithTitle:title arstistName:artistName lyrics:lyrics rating:rating];
}

- (NSDictionary *)fileDictionary
{
    return @{@"artist" : self.artistName,
             @"trackName" : self.title,
             @"lyrics" : self.lyrics,
             @"rating" : @(self.rating)
             };
}


@end
