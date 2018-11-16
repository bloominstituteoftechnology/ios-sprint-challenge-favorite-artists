//
//  FAFSongController.h
//  FAFLyricFinder
//
//  Created by Farhan on 11/16/18.
//  Copyright © 2018 Farhan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FAFSongController : NSObject

@property (nonatomic, readonly) NSArray *songsReadOnly;

- (void)fetchLyricsWithName:(NSString *)name artist:(NSString *)artist completion:(void (^)(NSString *, NSError *))completion;

- (void)createSongWithName:(NSString *)name artist:(NSString *)artist rating:(NSInteger)rating lyrics:(NSString *)lyrics;

@end
