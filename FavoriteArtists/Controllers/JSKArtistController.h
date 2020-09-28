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

- (instancetype)init;

@property (nonatomic, readonly, copy) NSArray<JSKArtist *> *artists;

- (void)addArtist:(JSKArtist *)artist;

@end

NS_ASSUME_NONNULL_END
