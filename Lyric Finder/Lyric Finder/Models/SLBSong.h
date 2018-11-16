//
//  SLBSong.h
//  Lyric Finder
//
//  Created by Scott Bennett on 11/16/18.
//  Copyright © 2018 Scott Bennett. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface SLBSong : NSObject

@property NSString *title;
@property NSString *artist;
@property NSString *lyrics;
@property int rating;

@end

NS_ASSUME_NONNULL_END
