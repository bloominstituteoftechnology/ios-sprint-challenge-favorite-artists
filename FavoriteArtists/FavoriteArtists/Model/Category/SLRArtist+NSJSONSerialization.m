//
//  SLRArtist+NSJSONSerialization.m
//  FavoriteArtists
//
//  Created by Sameera Roussi on 7/19/19.
//  Copyright © 2019 Sameera Roussi. All rights reserved.
//

#import "SLRArtist+NSJSONSerialization.h"
#import "SLRArtist.h"

@implementation SLRArtist (NSJSONSerialization)

- (instancetype) initFromDictionary: (NSDictionary *)dictionary {
    
    NSString *artistName = dictionary[@"artistName"];
    NSString *biography = dictionary[@"biography"];
    NSInteger *yearFormed = [dictionary yearFormed];
    
    return [self initWithArtistName:artistName biography:biography yearFormed:yearFormed];
}

- (NSDictionary *) dataDictionary {
return @{@"artistName" : self.artistName,
         @"biography" : self.biography,
         @"yearFormed" : self.yearFormed
         };
}
@end
