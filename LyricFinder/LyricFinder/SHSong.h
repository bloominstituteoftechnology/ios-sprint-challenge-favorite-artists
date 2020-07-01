//
//  SHSong.h
//  LyricFinder
//
//  Created by Sean Hendrix on 3/1/19.
//  Copyright © 2019 Sean Hendrix. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface SHSong : NSObject

-(instancetype) initWithTitle: (NSString *)title artist:(NSString *)artist lyrics:(NSString *)lyrics rating:(NSInteger)rating;

-(instancetype) initWithDictionary: (NSDictionary *)dictionary;

@property NSString *title;
@property NSString *artist;
@property NSString *lyrics;
@property NSInteger rating;

@end

NS_ASSUME_NONNULL_END
