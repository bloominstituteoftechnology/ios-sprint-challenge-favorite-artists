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
            yearArtistFormed:(NSNumber *)yearArtistFormed
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
    NSDictionary *properties = [dictionary objectForKey:@"properties"];
    if (![properties isKindOfClass:NSDictionary.class]) return nil;
    
    NSString *name = [dictionary objectForKey:@"name"];
    if (![name isKindOfClass:NSString.class]) return nil;
    
    NSString *biography = [dictionary objectForKey:@"biography"];
    if (![biography isKindOfClass:NSString.class]) return nil;
    
    NSNumber *yearArtistFormed = [dictionary objectForKey:@"yearArtistFormed"];
    if (![yearArtistFormed isKindOfClass:NSNumber.class]) return nil;
    
    return [self initWithName:name
              artistBiography:biography
             yearArtistFormed:yearArtistFormed];
    
}

@end
