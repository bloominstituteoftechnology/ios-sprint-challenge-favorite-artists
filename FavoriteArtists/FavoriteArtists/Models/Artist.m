//
//  Artist.m
//  FavoriteArtists
//
//  Created by John McCants on 2/18/21.
//

#import "Artist.h"

@implementation Artist

-(instancetype)initWithArtistName:(NSString *)aName yearFormed:(int)aYear bioText:(NSString *)aBioText
{
    if (self = [super init]) {
        _artistName = aName;
        _yearFormed = aYear;
        _bioText = aBioText;
        
    }
    return self;
}

- (instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    NSString *artistName = dictionary[@"artistName"];
    NSString *yearFormed = dictionary[@"yearFormed"];
    NSString *bioText = dictionary[@"bioText"];
    
    return  [self initWithArtistName:artistName yearFormed:yearFormed.intValue bioText:bioText];
    
}

- (instancetype)initWithSearchResults:(NSDictionary *)dictionary
{
    NSArray *artists = [dictionary objectForKey:@"artists"];
    
    for (NSMutableDictionary *artistDict in artists) {
        NSString *artistName = [artistDict objectForKey:@"strArtist"];
        if (![artistName isKindOfClass:NSString.class]) return nil;
        
        NSNumber *yearFormed = [artistDict objectForKey:@"intFormedYear"];
        if ([yearFormed isKindOfClass:NSNull.class]) {
            yearFormed = 0;
        }
        
        NSString *bioText = [artistDict objectForKey:@"strBiographyEN"];
        if (![bioText isKindOfClass:NSString.class]) return nil;
        
        return [self initWithArtistName:artistName yearFormed:yearFormed.intValue bioText:bioText];
    }
    return nil;
}

- (NSDictionary *)toDictionary
{
    NSMutableDictionary *dictionary = [[NSMutableDictionary init] alloc];
    
    [dictionary setObject:self.artistName forKey:@"artistName"];
    [dictionary setObject:@(self.yearFormed) forKey:@"yearFormed"];
    [dictionary setObject:self.bioText forKey:@"bioText"];
    
    return  dictionary;
}

@end
