//
//  FAFSong.h
//  FAFLyricFinder
//
//  Created by Farhan on 11/16/18.
//  Copyright © 2018 Farhan. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface FAFSong : NSObject

@property NSInteger rating;
@property NSString *lyrics;
@property NSString *songName;
@property NSString *artist;

-(instancetype)initWithName:(NSString *)name lyrics:(NSString *)lyrics artist:(NSString *)artist rating:(NSInteger)rating;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary rating:(NSInteger)rating artist:(NSString *)artist songName:(NSString *)songName;

@end

NS_ASSUME_NONNULL_END
