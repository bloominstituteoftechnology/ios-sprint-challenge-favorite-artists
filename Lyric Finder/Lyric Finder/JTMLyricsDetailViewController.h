//
//  JTMLyricsDetailViewController.h
//  Lyric Finder
//
//  Created by Jonathan T. Miles on 10/5/18.
//  Copyright © 2018 Jonathan T. Miles. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JTMLongLyricsController.h"

NS_ASSUME_NONNULL_BEGIN

@interface JTMLyricsDetailViewController : UIViewController

@property JTMLongLyricsController *songController;
@property JTMSongLyrics *lyric;

@end

NS_ASSUME_NONNULL_END
