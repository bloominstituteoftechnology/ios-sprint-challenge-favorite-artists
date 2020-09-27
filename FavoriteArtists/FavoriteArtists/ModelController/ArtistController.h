//
//  LSIArtistController.h
//  FavoriteArtists
//
//  Created by Elizabeth Thomas on 9/27/20.
//

#import <Foundation/Foundation.h>

@class LSIArtist;

NS_ASSUME_NONNULL_BEGIN

@interface LSIArtistController : NSObject

@property (nonatomic, readonly, copy) NSArray<LSIArtist *> *artists;

- (instancetype)init;
- (void)addArtist:(LSIArtist *)artist;

@end

NS_ASSUME_NONNULL_END
