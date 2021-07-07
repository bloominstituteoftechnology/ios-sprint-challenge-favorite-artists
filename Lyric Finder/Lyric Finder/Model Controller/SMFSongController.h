//
//  SMFSongController.h
//  Lyric Finder
//
//  Created by Samantha Gatt on 10/5/18.
//  Copyright © 2018 Samantha Gatt. All rights reserved.
//

#import <Foundation/Foundation.h>

@class NSManagedObjectContext;
@class SMFSong;

NS_ASSUME_NONNULL_BEGIN

@interface SMFSongController : NSObject

@property (readonly) NSManagedObjectContext *moc;

- (void)fetchSongLyricsWithTitle:(NSString *)title artist:(NSString *)artist completionHandler:(void (^)(NSString *lyrics, NSError *error))completionHandler;

- (void)createWithTitle:(NSString *)title artist:(NSString *)artist lyrics:(NSString *)lyrics rating:(NSInteger)rating;
- (void)updateSong:(SMFSong *)song rating:(NSInteger)rating;
- (void)deleteSong:(SMFSong *)song;

@end

NS_ASSUME_NONNULL_END
