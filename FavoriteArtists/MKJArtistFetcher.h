//
//  MKJArtistFetcher.h
//  FavoriteArtists
//
//  Created by Kenneth Jones on 12/3/20.
//

#import <Foundation/Foundation.h>
#import "MKJArtist.h"

typedef void(^ArtistFetcherCompletionHandler)(MKJArtist *_Nullable artist, NSError *_Nullable error);

NS_ASSUME_NONNULL_BEGIN

@interface MKJArtistFetcher : NSObject

- (void)fetchArtistWithArtist:(NSString *)artist
            completionHandler:(nonnull ArtistFetcherCompletionHandler)completionHandler;

- (void)saveArtist:(MKJArtist *)artist;

@property (nonatomic) NSMutableArray<MKJArtist *> *artists;

@end

NS_ASSUME_NONNULL_END
