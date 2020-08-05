//
//  SMAFavoriteArtist.m
//  FavoriteArtists
//
//  Created by Sean Acres on 8/2/20.
//  Copyright © 2020 Sean Acres. All rights reserved.
//

#import "SMAFavoriteArtist.h"

@implementation SMAFavoriteArtist

- (instancetype)init
{
    return [self initWithArtistName:@"" biography:@"" formationDate:2000];
}

- (instancetype)initWithArtistName:(NSString *)artistName
                         biography:(NSString *)biography
                     formationDate:(double)formationDate
{
    if (self = [super init]) {
        _artistName = artistName.copy;
        _biography = biography.copy;
        _formationDate = formationDate;
    }
    return self;
}

//- (instancetype)initWithDictionary:(NSDictionary *)dictionary
//{
//    NSString *artistName = [dictionary objectForKey:@"strArtist"];
//    if ([artistName isKindOfClass:NSNull.class]) artistName = nil;
//    else if (![artistName isKindOfClass:NSString.class]) return nil;
//
//    NSString *biography = [dictionary objectForKey:@"strBiographyEN"];
//    if ([biography isKindOfClass:NSNull.class]) biography = nil;
//    else if (![biography isKindOfClass:NSString.class]) return nil;
//
//    NSString *formationDate = [dictionary objectForKey:@"intFormedYear"];
//    if ([formationDate isKindOfClass:NSNull.class]) formationDate = nil;
//    else if (![formationDate isKindOfClass:NSString.class]) return nil;
//    
//
//    return [self initWithArtistName:artistName
//                          biography:biography
//                      formationDate:formationDate.doubleValue];
//}

@end
