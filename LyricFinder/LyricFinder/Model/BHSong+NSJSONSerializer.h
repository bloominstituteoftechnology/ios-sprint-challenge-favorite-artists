//
//  BHSong+NSJSONSerializer.h
//  LyricFinder
//
//  Created by Benjamin Hakes on 3/1/19.
//  Copyright © 2019 Benjamin Hakes. All rights reserved.
//

#import "BHSong.h"

NS_ASSUME_NONNULL_BEGIN

@interface BHSong (NSJSONSerializer)

-(NSDictionary *)makeDictionaryFromSong: (BHSong *)song;

@end

NS_ASSUME_NONNULL_END
