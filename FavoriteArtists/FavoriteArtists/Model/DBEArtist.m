//
//  DBEArtist.m
//  FavoriteArtists
//
//  Created by Dahna on 7/17/20.
//  Copyright © 2020 Dahna Buenrostro. All rights reserved.
//

#import "DBEArtist.h"

@implementation DBEArtist
    - (instancetype)initWithArtistName:(NSString *)name
                             biography:(NSString *)biography
                                  year:(int)year {
        self = [super init];
        if (self) {
            _name = [name copy];
            _biography = [biography copy];
            _year = year;
            
        }
        return self;
    }

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    NSString *name = dictionary[@"strArtist"];
    NSNumber *yearNSNum = dictionary[@"intFormedYear"];
    if ([yearNSNum isKindOfClass: [NSNull class]]) return nil;
    int yearInt = yearNSNum.intValue;
    
    NSString *biography = dictionary[@"strBiographyEN"];
    
    return [self initWithArtistName:name biography:biography year:yearInt];
}

@end
