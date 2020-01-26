//
//  NSObject+Artist_NSJSONSerialization.m
//  FavoriteAritists
//
//  Created by brian vilchez on 1/25/20.
//  Copyright © 2020 brian vilchez. All rights reserved.
//

#import "NSObject+Artist_NSJSONSerialization.h"
#import <UIKit/UIKit.h>
#import "Artist.h"
@implementation NSObject (Artist_NSJSONSerialization)

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    NSString *name = dictionary[@"artist"];
    int formedYear = [dictionary[@"yearFormed"] intValue];
    NSString *biography = dictionary[@"biography"];
    
    return  [[Artist alloc] initWithArtistName:name yearFormed:formedYear biography:biography];
}

- (NSDictionary *)toDictionary {
    return [[NSDictionary alloc] init];
}

@end
