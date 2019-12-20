//
//  NKTSong.h
//  lyricFinderObjc
//
//  Created by Nikita Thomas on 1/25/19.
//  Copyright © 2019 Nikita Thomas. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NKTSong : NSObject

@property NSString *title;
@property NSString *artist;
@property NSString *lyrics;

@property NSInteger rating;

-(instancetype)initWithTitle:(NSString *)title artist:(NSString *)artist lyrics:(NSString *)lyrics rating:(NSInteger)rating;

- (instancetype)initWithDictionary: (NSDictionary *)dictionary;

@end

NS_ASSUME_NONNULL_END
