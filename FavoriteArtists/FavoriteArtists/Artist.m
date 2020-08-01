//
//  Artist.m
//  FavoriteArtists
//
//  Created by Claudia Maciel on 7/31/20.
//  Copyright © 2020 thecoderpilot. All rights reserved.
//

#import "Artist.h"

@implementation Artist

- (instancetype) init {
    return [self initWithName:@""
                   yearFormed:0 biography:@""];
}


- (instancetype)initWithName:(NSString *)name yearFormed:(int)yearFormed biography:(NSString *)biography {
    
    self = [super init];
    
    if(self)
    {
        _name = name;
        _yearFormed = yearFormed;
        _biography = biography;
    }
    
    return self;
}

- (instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    NSString *name = [dictionary objectForKey:@"strArtist"];
    if (![name isKindOfClass:[NSString class]]) return nil;

    NSNumber *yearFormed = [dictionary objectForKey:@"intFormedYear"];
    if ([yearFormed isKindOfClass:[NSNull class]]) yearFormed = nil;
    else if ([yearFormed isKindOfClass:[NSString class]]) {
    NSString *yearFormedString = [dictionary objectForKey:@"intFormedYear"];
    yearFormed = @([yearFormedString intValue]);
    } else if (![yearFormed isKindOfClass:[NSNumber class]]) return nil;

    NSString *biography = [dictionary objectForKey:@"strBiographyEN"];
    if ([biography isKindOfClass:[NSNull class]]) biography = nil;
    else if (![biography isKindOfClass:[NSString class]]) return nil;

    return [self initWithName:name
                   yearFormed:yearFormed.intValue
                    biography:biography];
}

@end
