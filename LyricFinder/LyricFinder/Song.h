//
//  Song.h
//  LyricFinder
//
//  Created by Austin Cole on 3/1/19.
//  Copyright © 2019 Austin Cole. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Lyrics.h"

NS_ASSUME_NONNULL_BEGIN

@interface Song : NSObject

@property NSString *title;
@property NSString *artist;
@property NSString *lyrics;
@property NSInteger rating;

@end

NS_ASSUME_NONNULL_END
