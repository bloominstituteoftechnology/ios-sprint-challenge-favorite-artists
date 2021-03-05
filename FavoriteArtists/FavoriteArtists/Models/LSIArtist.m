//
//  LSIArtist.m
//  FavoriteArtists
//
//  Created by James McDougall on 3/4/21.
//

#import "LSIArtist.h"

@implementation LSIArtist

///  Methods
-(NSDictionary *)returnDictionary {
    return @{
        @"strArtist":       self.name,
        @"intFormedYear":   self.yearFormed,
        @"strBiographyEN":  self.biograpy,
    };
}

///  Initializers
- (instancetype)initWithName:(NSString *)name yearFormed:(NSNumber *)yearFormed biography:(NSString *)biography {
    _name = name;
    _yearFormed = yearFormed;
    _biograpy = biography;
    return self;
}

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    
    if (dictionary[@"artists"] == NSNull.null) {
        NSLog(@"Found it!");
        return nil;
    }
    
    NSArray *artists = dictionary[@"artists"];
    NSDictionary *artistDictionary = artists[0];
    
    NSString *name = artistDictionary[@"strArtist"];
    NSNumber *yearFormed = artistDictionary[@"intFormedYear"];
    NSString *biography = artistDictionary[@"strBiographyEN"];
    
    LSIArtist *newArtist = [[LSIArtist alloc] initWithName:name yearFormed:yearFormed biography:biography];
    return newArtist;
}

- (instancetype)initWithDecodedDictionary:(NSDictionary *)dictionary {
    
    NSString *name = dictionary[@"strArtist"];
    NSNumber *yearFormed = dictionary[@"intFormedYear"];
    NSString *biography = dictionary[@"strBiographyEN"];
    
    LSIArtist *newArtist = [[LSIArtist alloc] initWithName:name yearFormed:yearFormed biography:biography];
    return newArtist;
}

@end
