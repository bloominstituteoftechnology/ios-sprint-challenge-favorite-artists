//
//  NSJSONSerialization+NSJSONSerialization.h
//  LyricFinder
//
//  Created by Carolyn Lea on 10/5/18.
//  Copyright © 2018 Carolyn Lea. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Song.h"
NS_ASSUME_NONNULL_BEGIN

static NSString * const artistGET = @"https://musixmatchcom-musixmatch.p.mashape.com/wsr/1.1/artist.get";
static NSString * const lyricsGET = @"https://musixmatchcom-musixmatch.p.mashape.com/wsr/1.1/track.lyrics.get";
static NSString * const apiKey = @"iVSODYZpztmsh9efX06d2pLpHSQpp16cO7VjsndJ4L4RK7TlVr";

@interface NSJSONSerialization (NSJSONSerialization)

//-(instancetype)initWithDictionary:(NSDictionary *)songDictionary song:(Song *)song;
//
//-(NSDictionary *)objectDictionary;

-(void)searchForLyricsWithSongTitle:(NSString *)songTitle completion: (void (^)(NSArray *songs, NSError *))completion;

@end

NS_ASSUME_NONNULL_END
