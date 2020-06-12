//
//  HAOArtist.h
//  FavoriteArtists
//
//  Created by Hunter Oppel on 6/12/20.
//  Copyright © 2020 LambdaSchool. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface HAOArtist : NSObject

@property (nonatomic) NSString *artistName;
@property (nonatomic) NSString *artistBiography;
@property (nonatomic) NSString *yearFormed;

- (instancetype)initWithArtistName:(NSString *)artistName artistBiography:(NSString *)artistBiography yearFormed:(NSString *)yearFormed;

@end

NS_ASSUME_NONNULL_END
