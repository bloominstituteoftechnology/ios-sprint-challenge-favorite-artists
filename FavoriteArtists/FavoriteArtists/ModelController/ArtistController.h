//
//  ArtistController.h
//  FavoriteArtists
//
//  Created by Elizabeth Thomas on 9/27/20.
//

#import <Foundation/Foundation.h>

@class Artist;

NS_ASSUME_NONNULL_BEGIN

@interface ArtistController : NSObject

@property (nonatomic, readonly, copy) NSArray<Artist *> *artists;

- (instancetype)init;
- (void)addArtist:(Artist *)artist;

@end

NS_ASSUME_NONNULL_END
