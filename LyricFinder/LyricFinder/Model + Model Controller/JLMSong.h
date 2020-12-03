//
//  JLMSong.h
//  LyricFinder
//
//  Created by Jason Modisett on 1/25/19.
//  Copyright © 2019 Jason Modisett. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface JLMSong : NSObject

-(instancetype) initWithTitle: (NSString *)title artist:(NSString *)artist lyrics:(NSString *)lyrics rating:(NSInteger)rating;

-(instancetype) initWithDictionary: (NSDictionary *)dictionary;

@property NSString *title;
@property NSString *artist;
@property NSString *lyrics;
@property NSInteger rating;

@end

NS_ASSUME_NONNULL_END
