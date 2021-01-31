//
//  ArtistController.h
//  FavArtist
//
//  Created by Norlan Tibanear on 1/27/21.
//

#import <Foundation/Foundation.h>
#import "Artist.h"

@class Artist;

typedef void (^NTSearchArtist) (Artist * _Nullable artists, NSError * _Nullable error);

NS_ASSUME_NONNULL_BEGIN

@interface ArtistController : NSObject

@property (nonatomic, readonly, copy) NSArray *saveArtists;
@property (readonly, nonatomic) Artist *currentArtist;
//@property (nonatomic, readonly, copy, nullable) NSMutableArray<Artist *> *artists;



- (void)addArtist:(Artist *)artist;
//- (void)searchArtist:(NSString *)name
//          completion:(void (^)(Artist *artist, NSError *error))completion;

- (void)searchArtist:(NSString *)name
          completion:(NTSearchArtist)completion;

- (void)loadFromPersistentStore;
- (void)saveArtist:(Artist *)artist;

@end

NS_ASSUME_NONNULL_END
