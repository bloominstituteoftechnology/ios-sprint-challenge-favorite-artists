//
//  LSIArtistController.h
//  Favorite_Artistis
//
//  Created by Joe on 8/2/20.
//  Copyright © 2020 AlphaGradeINC. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@class LSIArtist;

@interface LSIArtistController : NSObject

@property (nonatomic, readonly, copy) NSArray<LSIArtist *> *artists;

@property (nonatomic) NSUInteger artistCount;

- (void)addArtist:(LSIArtist *)anArtist;

- (LSIArtist *)artistAtIndex:(NSUInteger)index;

@end

NS_ASSUME_NONNULL_END
