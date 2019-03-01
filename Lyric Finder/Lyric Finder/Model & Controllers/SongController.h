//
//  SongController.h
//  Lyric Finder
//
//  Created by Madison Waters on 3/1/19.
//  Copyright © 2019 Jonah Bergevin. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Song;

NS_ASSUME_NONNULL_BEGIN

@interface SongController : NSObject

-(void)addSongWithTitle:(NSString*)title artist:(NSString*)artist lyrics:(NSString*)lyrics rating:(NSInteger)rating;
-(void)searchSongWithLyrics:(NSString*)title artist:(NSString*)artist completion:(void (^)(NSString *lyrics, NSError *error))completion;

@property (nonatomic, readonly) NSArray* songs;

@end

NS_ASSUME_NONNULL_END
