//
//  SDJArtistClient.h
//  FavoriteArtists
//
//  Created by Shawn James on 6/12/20.
//  Copyright © 2020 Shawn James. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@class SDJArtist;
typedef void (^CompletionHandler)(SDJArtist* _Nullable artist, NSError *_Nullable error);

@interface SDJArtistClient : NSObject

- (void) fetchArtistUsingSearchTerm:(NSString *)searchTerm
                   completion:(CompletionHandler)completion;

- (NSArray *)loadSavedArtistsFromDocumentsDirectory;

@end

NS_ASSUME_NONNULL_END
