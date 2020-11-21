//
//  ArtistController.h
//  FavoriteArtists
//
//  Created by Cora Jacobson on 11/21/20.
//

#import <Foundation/Foundation.h>
#import "Artist.h"

typedef void(^ArtistControllerCompletionHandler)(Artist *_Nullable artist, NSError *_Nullable error);

@interface ArtistController : NSObject

+ (void)searchArtistsWithSearchTerm:(nonnull NSString *)searchTerm
                completionHandler:(nonnull ArtistControllerCompletionHandler)completionHandler;

@end
