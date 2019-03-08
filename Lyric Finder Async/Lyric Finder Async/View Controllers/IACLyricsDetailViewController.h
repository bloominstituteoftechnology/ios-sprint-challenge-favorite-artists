//
//  IACLyricsDetailViewController.h
//  Lyric Finder Async
//
//  Created by Ivan Caldwell on 3/8/19.
//  Copyright © 2019 Ivan Caldwell. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "IACLyrics.h"
#import "IACLyricsController.h"

NS_ASSUME_NONNULL_BEGIN

@interface IACLyricsDetailViewController : UIViewController
@property IACLyrics *song;

@end

NS_ASSUME_NONNULL_END
