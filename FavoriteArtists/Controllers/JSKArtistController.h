//
//  JSKArtistController.h
//  FavoriteArtists
//
//  Created by Josh Kocsis on 9/25/20.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface JSKArtistController : NSObject

- (NSArray *)loadArtist;
- (void)addArtist:(NSString *)artistName artistBio:(NSString *)aArtistBio yearFormed:(int)aYearFormed;

@end

NS_ASSUME_NONNULL_END
