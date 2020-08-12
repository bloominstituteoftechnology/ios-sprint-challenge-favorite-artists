//
//  KSIArtist.m
//  FavoriteArtists-ObjC
//
//  Created by Kevin Stewart on 7/31/20.
//  Copyright © 2020 Kevin Stewart. All rights reserved.
//

#import "KSIArtist.h"

@implementation KSIArtist

- (instancetype)init
{
    return [self initWithName:@""
              artistBiography:@""
             yearArtistFormed:0];
}

- (instancetype)initWithName:(NSString *)name
             artistBiography:(NSString *)biography
            yearArtistFormed:(double)yearArtistFormed
{
    if (self = [super init]) {
        _name = name.copy;
        _biography = biography.copy;
        _yearArtistFormed = yearArtistFormed;
    }
    return self;
}

- (instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    NSString *name = [dictionary objectForKey:@"strArtist"];
    if (![name isKindOfClass:NSString.class]) return nil;
    
    NSString *biography = [dictionary objectForKey:@"strBiographyEN"];
    if (![biography isKindOfClass:NSString.class]) return nil;
    
    NSString *yearArtistFormed = [dictionary objectForKey:@"intFormedYear"];
    if ([yearArtistFormed isKindOfClass:NSNull.class]) yearArtistFormed = nil;
    else if (![yearArtistFormed isKindOfClass:NSString.class]) return nil;
    
    return [self initWithName:name
              artistBiography:biography
             yearArtistFormed:yearArtistFormed.doubleValue];
}

- (instancetype)initWithDict:(NSDictionary *)dict {
    NSString *strArtist = dict[@"strArtist"];
    NSNumber *intFormedYear = dict[@"intFormedYear"];
    NSString *strBiographyEn = dict[@"strBiographyEN"];
    
    self = [[KSIArtist alloc]initWithName:strArtist artistBiography:strBiographyEn yearArtistFormed:intFormedYear.doubleValue];
    return self;
}

- (NSDictionary *)dictionaryValue
{
    NSDictionary *artists = @{
        @"strArtist" : self.name,
        @"strBiographyEN" : self.biography,
        @"intFormedYear" : @(self.yearArtistFormed)
    };
    return artists;
}
@end
