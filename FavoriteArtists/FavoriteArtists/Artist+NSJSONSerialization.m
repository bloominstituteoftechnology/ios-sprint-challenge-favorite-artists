//
//  Artist+NSJSONSerialization.m
//  FavoriteArtists
//
//  Created by Bobby Keffury on 2/10/20.
//  Copyright © 2020 Bobby Keffury. All rights reserved.
//

#import "Artist+NSJSONSerialization.h"
#import "Artist.h"
#import <UIKit/UIKit.h>



@implementation Artist (NSJSONSerialization)

- (instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    NSString *name = dictionary[@"strArtist"];
    NSString *founded = dictionary[@"intFormedYear"];
    NSString *details = dictionary[@"strBiographyEN"];
    
    return [self initWithName:name founded:founded details:details];
}


- (NSDictionary *)toDictionary
{
    NSDictionary *dictionary;
    return dictionary;
}

@end
