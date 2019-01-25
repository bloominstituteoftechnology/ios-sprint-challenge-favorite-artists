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

-(void)createSongsWithTitle:(NSString *)title artistName:(NSString *)artistName lyrics:(NSString *)lyrics rating:(int)rating ;

- (void)searchLyricsWithArtist:(NSString *)artistName title:(NSString *)title completion:(void(^)(NSString *lyrics, NSError *error)) completion ;

@property (nonatomic) NSArray *songs;

@end

NS_ASSUME_NONNULL_END
