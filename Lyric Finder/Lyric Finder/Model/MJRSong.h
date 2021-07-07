//
//  MJRSong.h
//  Lyric Finder
//
//  Created by Moses Robinson on 3/29/19.
//  Copyright © 2019 Moses Robinson. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MJRSong : NSObject

@property NSString *title;
@property NSString *artist;
@property NSString *lyrics;
@property NSInteger rating;

- (instancetype)initWithTitle:(NSString *)title artist:(NSString *)artist lyrics:(NSString *)lyrics rating:(NSInteger)rating;

@end

NS_ASSUME_NONNULL_END
