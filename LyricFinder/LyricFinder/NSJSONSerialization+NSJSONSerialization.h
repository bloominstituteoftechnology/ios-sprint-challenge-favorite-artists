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
static NSString * const lyricsGET = @"https://musixmatchcom-musixmatch.p.mashape.com/wsr/1.1/matcher.lyrics.get";
static NSString * const apiKey = @"iVSODYZpztmsh9efX06d2pLpHSQpp16cO7VjsndJ4L4RK7TlVr";

@interface NSJSONSerialization (NSJSONSerialization)

@property (readonly) NSMutableArray *songs;

-(void)searchForSongWithArtist:(NSString *)artist trackName:(NSString *)trackName completion:(void (^)(NSArray *songs, NSError *))completion;

-(void)createSongWithTitle:(NSString*)songTitle artist:(NSString*)artist lyrics:(NSString*)lyrics rating:(NSInteger)rating;

- (void)updateSong:(Song *)song title:(NSString *)title artist:(NSString *)artist;

@end

NS_ASSUME_NONNULL_END
