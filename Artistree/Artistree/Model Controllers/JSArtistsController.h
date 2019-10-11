//
//  JSArtistsController.h
//  Artistree
//
//  Created by Jeffrey Santana on 10/11/19.
//  Copyright © 2019 Lambda. All rights reserved.
//

#import <Foundation/Foundation.h>

@class JSArtist;
typedef void(^myCompletion)(JSArtist * _Nullable);

NS_ASSUME_NONNULL_BEGIN

@interface JSArtistsController : NSObject

@property (readonly) NSMutableArray *artists;

- (void)addArtist:(JSArtist *)artist;
- (void)removeArtistAtIndex:(NSNumber *)index;
- (void)fetchArtistByName:(NSString *)artistName completion:(myCompletion)completion;

@end

NS_ASSUME_NONNULL_END
