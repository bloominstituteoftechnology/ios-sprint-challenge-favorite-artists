//
//  YZISongs.h
//  Lyrics-Finder
//
//  Created by Yvette Zhukovsky on 1/25/19.
//  Copyright © 2019 Yvette Zhukovsky. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface YZISongs : NSObject
@property (nonatomic) NSString *title;
@property (nonatomic) NSString *lyrics;
@property (nonatomic) NSString *artistName;
@property (nonatomic) int rating;

- (instancetype)initWithTitle: (NSString *)title
                       lyrics: (NSString *)lyrics
                       artist: (NSString *)artist
                       rating: (int)rating;

@end



NS_ASSUME_NONNULL_END
