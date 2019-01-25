//
//  YZISongsController.h
//  Lyrics-Finder
//
//  Created by Yvette Zhukovsky on 1/25/19.
//  Copyright © 2019 Yvette Zhukovsky. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface YZISongsController : NSObject

-(void)createSongsWithTitle:(NSString *)title artist:(NSString *)artist lyrics:(NSString *)lyrics rating:(int)rating ;

- (void)searchLyricsWithArtist:(NSString *)artist title:(NSString *)title completion:(void(^)(NSString *lyrics, NSError *error)) completion ;

@property (nonatomic) NSArray *songs;

@end

NS_ASSUME_NONNULL_END
