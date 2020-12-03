//
//  JLMSong+NSJSONSerialization.h
//  LyricFinder
//
//  Created by Jason Modisett on 1/25/19.
//  Copyright © 2019 Jason Modisett. All rights reserved.
//

#import "JLMSong.h"

NS_ASSUME_NONNULL_BEGIN

@interface JLMSong (NSJSONSerialization)

- (instancetype)initFromDictionary:(NSDictionary *)dictionary songTitle:(NSString *)title artistName:(NSString *)artistName lyrics:(NSString *)lyrics rating:(NSInteger)rating;
- (instancetype)initFromPlistDictionary:(NSDictionary *)dictionary;

@property (nonatomic,readonly) NSDictionary *songAsDictionary;

@end

NS_ASSUME_NONNULL_END
