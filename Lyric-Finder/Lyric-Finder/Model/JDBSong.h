//
//  JDBSong.h
//  Lyric-Finder
//
//  Created by Madison Waters on 3/8/19.
//  Copyright © 2019 Jonah Bergevin. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface JDBSong : NSObject

@property (nonatomic) NSString *title;
@property (nonatomic) NSString *artist;
@property (nonatomic) NSInteger rating;

- (instancetype)initWithTitle:(NSString *)title artist:(NSString *)artist rating:(NSInteger)rating;
- (instancetype)initWithDictionary:(NSDictionary *)dictionary title:(NSString *)title;

@end

NS_ASSUME_NONNULL_END
