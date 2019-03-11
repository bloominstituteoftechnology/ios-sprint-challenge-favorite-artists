//
//  IACSong.h
//  Lyric Finder Async III
//
//  Created by Ivan Caldwell on 3/10/19.
//  Copyright © 2019 Ivan Caldwell. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface IACSong : NSObject
@property (copy) NSString *title;
@property (copy) NSString *artist;
@property NSString *lyrics;
@property int rating;

- (instancetype)initWithSongTitle:(NSString *)title artist:(NSString *)artist lyrics:(NSString *)lyrics rating:(int)rating;
@end

NS_ASSUME_NONNULL_END
