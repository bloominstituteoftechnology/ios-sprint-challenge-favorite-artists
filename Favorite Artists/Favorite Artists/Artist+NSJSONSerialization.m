//
//  Artist+NSJSONSerialization.m
//  Favorite Artists
//
//  Created by David Wright on 5/31/20.
//  Copyright © 2020 David Wright. All rights reserved.
//

#import "Artist+NSJSONSerialization.h"

@implementation Artist (NSJSONSerialization)

- (nullable instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    NSString *name = [dictionary objectForKey:@"strArtist"];
    if (![name isKindOfClass:[NSString class]]) return nil;
    
    NSNumber *yearFormed = [dictionary objectForKey:@"intFormedYear"];
    if ([yearFormed isKindOfClass:[NSNull class]]) {
        yearFormed = nil;
    } else if (![yearFormed isKindOfClass:[NSNumber class]]) return nil;
    
    NSString *biography = [dictionary objectForKey:@"strBiographyEN"];
    if ([biography isKindOfClass:[NSNull class]]) {
        biography = nil;
    } else if (![biography isKindOfClass:[NSString class]]) return nil;
    
    return [self initWithName:name
                   yearFormed:yearFormed.intValue
                    biography:biography];
}

- (NSDictionary *)toDictionary
{
    NSNumber *yearFormed = (self.yearFormed == 0) ? [NSNumber numberWithInt:self.yearFormed] : nil;
    
    return @{ @"strArtist": self.name,
              @"intFormedYear": yearFormed,
              @"strBiographyEN": self.biography };
}

@end
