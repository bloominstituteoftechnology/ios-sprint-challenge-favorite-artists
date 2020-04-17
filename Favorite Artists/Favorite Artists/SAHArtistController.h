//
//  SAHArtistController.h
//  Favorite Artists
//
//  Created by scott harris on 4/17/20.
//  Copyright © 2020 scott harris. All rights reserved.
//

#import <Foundation/Foundation.h>


@class SAHArtist;

NS_ASSUME_NONNULL_BEGIN

@interface SAHArtistController : NSObject

@property (nonatomic, copy, readonly) NSArray<SAHArtist *> *favoriteArtists;

- (void)saveArtist:(SAHArtist *)artist;


@end

NS_ASSUME_NONNULL_END
