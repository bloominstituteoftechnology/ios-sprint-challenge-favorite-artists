//
//  ArtistController.h
//  FavoriteArtists
//
//  Created by Joel Groomer on 2/8/20.
//  Copyright © 2020 Julltron. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Artist;

typedef void (^ArtistSearchCompletionHandler)(Artist * _Nullable foundArtist, NSError * _Nullable error);

NS_ASSUME_NONNULL_BEGIN

@interface ArtistController : NSObject

@property (nonatomic, copy) NSMutableArray *artists;

- (void)addArtist:(Artist *)anArtist;
- (void)delArtist:(Artist *)anArtist;
- (void)searchForArtistNamed:(NSString *)anArtistName completionHandler:(ArtistSearchCompletionHandler)completionHandler;

@end

NS_ASSUME_NONNULL_END
