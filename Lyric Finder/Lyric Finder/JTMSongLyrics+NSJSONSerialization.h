//
//  JTMSongLyrics+NSJSONSerialization.h
//  Lyric Finder
//
//  Created by Jonathan T. Miles on 10/5/18.
//  Copyright © 2018 Jonathan T. Miles. All rights reserved.
//

#import "JTMSongLyrics.h"

NS_ASSUME_NONNULL_BEGIN

@interface JTMSongLyrics (NSJSONSerialization)

- (instancetype)initFromDictionary:(NSDictionary *)dictionary title:(NSString *)title artist:(NSString *)artist;

-(NSDictionary *)convertToDictionaryWithTitle:(NSString *)title artist:(NSString *)artist lyrics:(NSString *)lyrics rating:(int)rating;

@end

NS_ASSUME_NONNULL_END
