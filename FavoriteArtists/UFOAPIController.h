//
//  UFOAPIController.h
//  FavoriteArtists
//
//  Created by Ufuk Türközü on 17.04.20.
//  Copyright © 2020 Ufuk Türközü. All rights reserved.
//

#import <Foundation/Foundation.h>

@class UFOArtist;

NS_ASSUME_NONNULL_BEGIN

@interface UFOAPIController : NSObject

@property (nonatomic, readonly, copy) NSMutableArray<UFOArtist *> *artists;

- (void)searchArtistWithStrArtist:(NSString *) strArtist completion:(void(^)(UFOArtist *))completion;
- (void)addArtist:(UFOArtist *)artist;
- (void)saveArtists;

@end

NS_ASSUME_NONNULL_END
