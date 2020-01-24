//
//  JPHArtist+JSONSerialization.m
//  FavoriteArtistSprint
//
//  Created by Jerry haaser on 1/24/20.
//  Copyright © 2020 Jerry haaser. All rights reserved.
//

#import "JPHArtist.h"

@interface JPHArtist (JSONSerialization)

- (instancetype)initWithDictionary: (NSDictionary *)dictionary;
- (NSDictionary *)artistDate;
- (NSString *)formedInYearDesc;

@end
