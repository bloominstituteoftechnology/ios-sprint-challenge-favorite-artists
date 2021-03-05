//
//  LSIArtistController.h
//  FavoriteArtists
//
//  Created by James McDougall on 3/4/21.
//

#import <Foundation/Foundation.h>
#import "LSIArtist.h"

NS_ASSUME_NONNULL_BEGIN

typedef void(^ArtistFetcherCompletionHandler)(LSIArtist *_Nullable artist, NSError *_Nullable error);

@interface LSIArtistController : NSObject

///  Properties
@property (nonatomic) NSMutableArray<LSIArtist *> *savedArtists;

///  Methods
- (void)reloadArray;
- (void)saveArtist:(LSIArtist *)artist;
- (NSURL *)documentsURL;

///  Networking
- (void)fetchArtistWithSearchTerm:(NSString *)searchTerm completionHandler:(ArtistFetcherCompletionHandler)completionHandler;

@end

NS_ASSUME_NONNULL_END
