//
//  JSKArtistController.h
//  FavoriteArtists
//
//  Created by Josh Kocsis on 9/25/20.
//

#import <Foundation/Foundation.h>

@class JSKArtist;

NS_ASSUME_NONNULL_BEGIN

@interface JSKArtistController : NSObject

@property (nonatomic, readonly, copy) NSArray<JSKArtist *> *artists;

- (NSArray *)loadArtist;
- (void)addArtist:(JSKArtist *)artist;

@end

NS_ASSUME_NONNULL_END
