//
//  SongController.h
//  Lyric Finder
//
//  Created by Vuk Radosavljevic on 10/5/18.
//  Copyright © 2018 Vuk. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Song;

NS_ASSUME_NONNULL_BEGIN

@interface SongController : NSObject

@property (readonly) NSMutableArray *songs;

-(void)searchForSongWithArtist:(NSString *)artist trackName:(NSString *)trackName completion:(void (^)(NSDictionary *song, NSError *))completion;

-(void)createSongWithTitle:(NSString*)title artist: (NSString*)artist lyrics:(NSString*)lyrics rating:(int)rating;


@end

NS_ASSUME_NONNULL_END
