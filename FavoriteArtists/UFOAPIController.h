//
//  UFOAPIController.h
//  FavoriteArtists
//
//  Created by Ufuk Türközü on 17.04.20.
//  Copyright © 2020 Ufuk Türközü. All rights reserved.
//

#import <Foundation/Foundation.h>

@class UFOArtist;

typedef void (^UFOAPIControllerCompletionBlock)(NSArray<UFOArtist *> * _Nullable artist, NSError * _Nullable error);

NS_ASSUME_NONNULL_BEGIN

@interface UFOAPIController : NSObject

@property (nonatomic, readonly, copy) NSArray<UFOArtist *> *artists;

- (void)searchArtistWithName:(NSString *) name completionBlock: (UFOAPIControllerCompletionBlock)completionBlock;

@end

NS_ASSUME_NONNULL_END
