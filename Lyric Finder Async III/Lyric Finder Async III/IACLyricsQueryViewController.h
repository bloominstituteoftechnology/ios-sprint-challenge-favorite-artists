//
//  IACLyricsQueryViewController.h
//  Lyric Finder Async III
//
//  Created by Ivan Caldwell on 3/10/19.
//  Copyright © 2019 Ivan Caldwell. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "IACLyricsController.h"
#import "IACSong.h"

NS_ASSUME_NONNULL_BEGIN

@interface IACLyricsQueryViewController : UIViewController
@property IACLyricsController *lyricsController;
@property IACSong *song;
@end

NS_ASSUME_NONNULL_END
