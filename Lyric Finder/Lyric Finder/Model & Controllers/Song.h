//
//  Song.h
//  Lyric Finder
//
//  Created by Madison Waters on 3/1/19.
//  Copyright © 2019 Jonah Bergevin. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Song : NSObject

-(instancetype)initWithTitle:(NSString*)title artist:(NSString*)artist lyrics:(NSString*)lyrics rating:(NSInteger)rating;

@property (nonatomic, copy)NSString* title;
@property (nonatomic, copy)NSString* artist;
@property (nonatomic, copy)NSString* lyrics;
@property (nonatomic) NSInteger rating;

@end

NS_ASSUME_NONNULL_END
