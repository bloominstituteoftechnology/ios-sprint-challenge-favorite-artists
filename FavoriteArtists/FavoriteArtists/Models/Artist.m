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

@end
