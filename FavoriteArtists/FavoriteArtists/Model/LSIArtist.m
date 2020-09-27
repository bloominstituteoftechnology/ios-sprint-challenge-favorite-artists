//
//  LSIArtist.m
//  FavoriteArtists
//
//  Created by Elizabeth Thomas on 9/27/20.
//

#import "LSIArtist.h"

@implementation LSIArtist

- (instancetype)initWithArtistName:(NSString *)aName
                        yearFormed:(int)aYearFormed
                         biography:(NSString *)aBiography
{
    if (self = [super init]) {
        _name = aName.copy;
        _yearFormed = aYearFormed;
        _biography = aBiography.copy;
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

    return [self initWithArtistName:name
                   yearFormed:yearFormed.intValue
                    biography:biography];
}

@end
