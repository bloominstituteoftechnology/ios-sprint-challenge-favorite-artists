//
//  Artist.h
//  FavoriteArtistsSprintChallenge
//
//  Created by Dillon P on 4/19/20.
//  Copyright © 2020 Dillon's Lambda Team. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Artist : NSObject

@property (nonatomic, readonly, copy) NSString *artistName;
@property (nonatomic, readonly) int yearFounded;
@property (nonatomic, readonly, copy) NSString *artistBio;

- (instancetype)initWithArtistName:(NSString *)artistName
                       yearFounded:(int)yearFounded
                         artistBio:(NSString *)artistBio;

- (nullable instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end

NS_ASSUME_NONNULL_END
