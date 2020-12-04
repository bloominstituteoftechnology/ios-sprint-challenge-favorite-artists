//
//  MKJArtist.m
//  FavoriteArtists
//
//  Created by Kenneth Jones on 12/3/20.
//

#import "MKJArtist.h"

@implementation MKJArtist

- (instancetype)init
{
    return [self initWithArtist:@""
                           year:0
                      biography:@""];
}

- (instancetype)initWithArtist:(NSString *)anArtist
                          year:(int)aYear
                     biography:(NSString *)aBiography
{
    if (self = [super init]) {
        _artist = anArtist.copy;
        _year = aYear;
        _biography = aBiography.copy;
    }
    return self;
}

- (instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    NSArray *artists = [dictionary objectForKey:@"artists"];
    if (![artists isKindOfClass:NSArray.class]) return nil;
    
    NSDictionary *selectArtist = [artists objectAtIndex:0];
    if (![selectArtist isKindOfClass:NSDictionary.class]) return nil;
    
    NSString *artist = [selectArtist objectForKey:@"strArtist"];
    if (![artist isKindOfClass:NSString.class]) return nil;
    
    NSNumber *yearNum = [selectArtist objectForKey:@"intFormedYear"];
    if (![yearNum isKindOfClass:NSNumber.class]) return nil;
    
    int year = (int)yearNum;
    
    NSString *biography = [selectArtist objectForKey:@"strBiographyEN"];
    if (![biography isKindOfClass:NSString.class]) return nil;
    
    return [self initWithArtist:artist
                           year:year
                      biography:biography];
}

- (NSDictionary *)toDictionary
{
    NSMutableDictionary *artistInfo = [[NSMutableDictionary alloc] init];
    
    [artistInfo setObject:self.artist forKey:@"strArtist"];
    [artistInfo setObject:@(self.year) forKey:@"intFormedYear"];
    [artistInfo setObject:self.biography forKey:@"strBiographyEN"];
    
    return artistInfo;
}

@end
