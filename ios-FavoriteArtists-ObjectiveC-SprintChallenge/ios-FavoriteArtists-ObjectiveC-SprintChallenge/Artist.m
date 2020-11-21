//
//  Artist.m
//  ios-FavoriteArtists-ObjectiveC-SprintChallenge
//
//  Created by BrysonSaclausa on 11/21/20.
//

#import "Artist.h"

@implementation Artist

- (instancetype)initWithArtistName:(NSString *)aName
                          artistBio:(NSString *)aBio
                         yearFormed:(int)aYear
 {
     if (self = [super init]) {
         _artistName = aName.copy;
         _artistBio = aBio.copy;
         _yearFormed = aYear;
     }
     return self;
 }
@end
