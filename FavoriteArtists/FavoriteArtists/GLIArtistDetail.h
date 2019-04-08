//
//  GLIArtistDetail.h
//  FavoriteArtists
//
//  Created by Julian A. Fordyce on 4/5/19.
//  Copyright © 2019 Julian A. Fordyce. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface GLIArtistDetail : NSObject

- (instancetype)initWithDictionary:(NSString *)artistName dictionary:(NSDictionary *)dictionary;

- (instancetype)initWithName:(NSString *)artistName artistBio:(NSString *)biography yearFormed:(int)yearFormed;

@property (nonatomic) NSString *artistName;
@property (nonatomic) NSString *biography;
@property (nonatomic) int yearFormed;


@end

NS_ASSUME_NONNULL_END
