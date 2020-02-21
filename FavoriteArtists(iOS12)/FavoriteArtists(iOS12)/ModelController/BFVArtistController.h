//
//  BFVArtistController.h
//  FavoriteArtists(iOS12)
//
//  Created by brian vilchez on 2/21/20.
//  Copyright © 2020 brian vilchez. All rights reserved.
//

#import <Foundation/Foundation.h>

@class BFVArtist;

NS_ASSUME_NONNULL_BEGIN

@interface BFVArtistController : NSObject

@property(nonatomic) NSArray *artists;

- (instancetype)init;
- (void)addArtistWithName:(NSString *)name;
- (void)deleteArtist:(BFVArtist *)artist;
@end

NS_ASSUME_NONNULL_END
