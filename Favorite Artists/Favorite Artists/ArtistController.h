//
//  ArtistController.h
//  Favorite Artists
//
//  Created by Mark Gerrior on 5/15/20.
//  Copyright © 2020 Mark Gerrior. All rights reserved.
//

#import <Foundation/Foundation.h>

@class MTGArtist;

NS_ASSUME_NONNULL_BEGIN

@interface ArtistController : NSObject

@property (nonatomic, readwrite, copy) NSMutableArray *artists;

- (void)add:(MTGArtist *)artist;

@end

NS_ASSUME_NONNULL_END
