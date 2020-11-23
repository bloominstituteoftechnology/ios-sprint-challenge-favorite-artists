//
//  FavoriteArtist.m
//  FavoriteArtists
//
//  Created by Craig Belinfante on 11/22/20.
//

#import "FavoriteArtist.h"

@implementation FavoriteArtist

- (instancetype)initWithArtist:(NSString *)anArtist
                     biography:(NSString *)aBiography year:(int)aYear
{
    if (self = [super init]) {
        _artist = anArtist.copy;
        _biography = aBiography.copy;
        _year = aYear;
    }
    return self;
}

- (instancetype)initWithDictionary:(NSDictionary *)aDictionary
{
    NSArray *artistDictionaries = [aDictionary objectForKey:@"artists"];
    if (![artistDictionaries isKindOfClass:NSDictionary.class]) return nil;
    
//    NSMutableArray *artists = [[NSMutableArray alloc]initWithCapacity:artistDictionaries.count];
    
    for (NSDictionary *artistDictionary in artistDictionaries) {
        if (![artistDictionary isKindOfClass:NSDictionary.class]) continue;
        
        NSString *artist = [aDictionary objectForKey:@"strArtist"];
        if (![artist isKindOfClass:NSString.class]) return nil;
        
        NSString *biography = [aDictionary objectForKey:@"strBiographyEN"];
        if (![biography isKindOfClass:NSString.class]) return nil;
        
        NSNumber *year = [aDictionary objectForKey:@"intFormedYear"];
        if (![year isKindOfClass:NSNumber.class]) return nil;
        
        return [self initWithArtist:artist
                          biography:biography
                               year:year.intValue];
    }
    return self;
}

- (NSDictionary *)dictionaryValue
{
    NSMutableDictionary *container = [[NSMutableDictionary alloc] init];
    
    [container setObject:self.artist forKey:@"strArtist"];
    [container setObject:self.biography forKey:@"strBiographyEN"];
    [container setObject:@(self.year) forKey:@"intFormedYear"];
    
    return container;
}

@end
