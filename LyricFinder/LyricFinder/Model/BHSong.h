//
//  BHSong.h
//  LyricFinder
//
//  Created by Benjamin Hakes on 3/1/19.
//  Copyright © 2019 Benjamin Hakes. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface BHSong : NSObject

@property NSString *UUID;
@property NSString *title;
@property NSString *artist;
@property NSString *lyrics;
@property double rating;

@end

NS_ASSUME_NONNULL_END
