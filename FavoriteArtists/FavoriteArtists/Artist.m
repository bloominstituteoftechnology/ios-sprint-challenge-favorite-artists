//
//  Artist.m
//  FavoriteArtists
//
//  Created by Cora Jacobson on 11/21/20.
//

#import "Artist.h"

@implementation Artist

- (instancetype)initWithArtistName:(NSString *)aName
                        formedYear:(int)aYear
                         biography:(NSString *)aBiography
{
    if (self = [super init]) {
        _artistName = aName.copy;
        _formedYear = aYear;
        _biography = aBiography.copy;
    }
    return self;
}

- (instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    NSDictionary *artists = [dictionary objectForKey:@"artists"];
    if (![artists isKindOfClass:NSDictionary.class]) return nil;
    
    NSMutableArray *artistArray = [[NSMutableArray alloc] initWithCapacity:artists.count];
    
    NSDictionary *artist = [artistArray objectAtIndex:0];
    
    NSString *artistName = [artist objectForKey:@"strArtist"];
    if (![artistName isKindOfClass:NSString.class]) return nil;
    
    NSNumber *formedYear = [artist objectForKey:@"intFormedYear"];
    if (![formedYear isKindOfClass:NSNumber.class]) return nil;
    
    NSString *biography = [artist objectForKey:@"strBiographyEN"];
    if (![biography isKindOfClass:NSString.class]) return nil;
    
    return [self initWithArtistName:artistName
                         formedYear:formedYear.intValue
                          biography:biography];
}

- (NSDictionary *)dictionaryValue
{
    NSMutableDictionary *container = [[NSMutableDictionary alloc] init];
    
    [container setObject:self.artistName forKey:@"artistName"];
    [container setObject:@(self.formedYear) forKey:@"formedYear"];
    [container setObject:self.biography forKey:@"biography"];
    
    return container;
}

@end
