//
//  SDJArtist.h
//  FavoriteArtists
//
//  Created by Shawn James on 6/12/20.
//  Copyright © 2020 Shawn James. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface SDJArtist : NSObject

@property (nonatomic, readonly, copy) NSString *artistName;
@property (nonatomic, readonly) int yearFormed;
@property (nonatomic, readonly, copy) NSString *artistBiography;

- (instancetype)initWithArtistName:(NSString *)artistName
                        yearFormed:(int)yearFormed
                   artistBiography:(NSString *)artistBiography;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end

NS_ASSUME_NONNULL_END
