//
//  DYPSong+NSJSONSerialization.h
//  LyricFinder
//
//  Created by Daniela Parra on 11/16/18.
//  Copyright © 2018 Daniela Parra. All rights reserved.
//

#import "DYPSong.h"

NS_ASSUME_NONNULL_BEGIN

@interface DYPSong (NSJSONSerialization)

- (instancetype)initFromDictionary:(NSDictionary *)dictionary songTitle:(NSString *)title artistName:(NSString *)artistName;

- (instancetype)initFromPlistDictionary:(NSDictionary *)dictionary;

@property (nonatomic,readonly) NSDictionary *songDictionary;

@end

NS_ASSUME_NONNULL_END
