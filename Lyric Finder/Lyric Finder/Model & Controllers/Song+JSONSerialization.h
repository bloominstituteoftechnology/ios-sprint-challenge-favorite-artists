//
//  Song+JSONSerialization.h
//  Lyric Finder
//
//  Created by Madison Waters on 3/1/19.
//  Copyright © 2019 Jonah Bergevin. All rights reserved.
//

#import "Song.h"

NS_ASSUME_NONNULL_BEGIN

@interface Song (JSONSerialization)

-(instancetype)initWithTitle:(NSString*)title artist:(NSString*)artist;
-(instancetype)initWithDictionary:(NSDictionary*)dictionary;

@end

NS_ASSUME_NONNULL_END
