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
    NSArray *artists = [dictionary objectForKey:@"artists"];
    
    for (NSMutableDictionary *artistDict in artists) {
        NSString *artistName = [artistDict objectForKey:@"strArtist"];
        if (![artistName isKindOfClass:NSString.class]) return nil;
        
        NSNumber *formedYear = [artistDict objectForKey:@"intFormedYear"];
        if ([formedYear isKindOfClass:NSNull.class]) {
            formedYear = nil;
        }
        
        NSString *biography = [artistDict objectForKey:@"strBiographyEN"];
        if (![biography isKindOfClass:NSString.class]) return nil;
        
        return [self initWithArtistName:artistName
                             formedYear:formedYear.intValue
                              biography:biography];
    }
    return nil;
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
