//
//  SHSong+NSJSONSerialization.h
//  LyricFinder
//
//  Created by Sean Hendrix on 3/1/19.
//  Copyright © 2019 Sean Hendrix. All rights reserved.
//

#import "SHSong.h"

NS_ASSUME_NONNULL_BEGIN

@interface SHSong (NSJSONSerialization)

- (instancetype)initFromDictionary:(NSDictionary *)dictionary songTitle:(NSString *)title artistName:(NSString *)artistName lyrics:(NSString *)lyrics rating:(NSInteger)rating;
- (instancetype)initFromPlistDictionary:(NSDictionary *)dictionary;

@property (nonatomic,readonly) NSDictionary *songAsDictionary;

@end

NS_ASSUME_NONNULL_END
