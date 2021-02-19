//
//  ArtistModelController.h
//  FavoriteArtists
//
//  Created by John McCants on 2/18/21.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ArtistModelController : NSObject

@property (nonatomic, readonly, copy, nullable) NSMutableArray<Artist *> *artists;

@end

NS_ASSUME_NONNULL_END
