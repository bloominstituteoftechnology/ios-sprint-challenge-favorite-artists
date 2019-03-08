//
//  IACLyrics.h
//  Lyric Finder Async
//
//  Created by Ivan Caldwell on 3/8/19.
//  Copyright © 2019 Ivan Caldwell. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface IACLyrics : NSObject
@property (copy) NSString *title;
@property (copy) NSString *artist;
@property NSString *lyrics;
@property int rating;

- (instancetype)initWithTitle:(NSString *)title artist:(NSString *)artist lyrics:(NSString *)lyrics rating:(int)rating;
@end

NS_ASSUME_NONNULL_END
