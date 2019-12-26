//
//  IACLyric.h
//  Lyric Finder
//
//  Created by Ivan Caldwell on 3/1/19.
//  Copyright © 2019 Ivan Caldwell. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface IACLyric : NSObject
- (instancetype)initWithTitle:(NSString *)title
                       artist:(NSString *)artist
                       lyrics:(NSString *)lyrics
                       rating:(NSInteger)rating;

@property NSString *title;
@property NSString *artist;
@property NSString *lyrics;
@property NSInteger rating;
@end

NS_ASSUME_NONNULL_END
