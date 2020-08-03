//
//  SMAFavoriteArtist.h
//  FavoriteArtists
//
//  Created by Sean Acres on 8/2/20.
//  Copyright © 2020 Sean Acres. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface SMAFavoriteArtist : NSObject

- (instancetype)initWithArtistName:(NSString *)artistName
                         biography:(NSString *)biography
                     formationDate:(double)formationDate;

@property (nonatomic, readonly, copy) NSString *artistName;
@property (nonatomic, readonly, copy) NSString *biography;
@property (nonatomic, readonly) double formationDate;

@end

NS_ASSUME_NONNULL_END
