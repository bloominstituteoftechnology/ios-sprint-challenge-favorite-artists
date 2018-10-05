//
//  LTBLyricsViewController.h
//  LyricFinder
//
//  Created by Linh Bouniol on 10/5/18.
//  Copyright © 2018 Linh Bouniol. All rights reserved.
//

#import <UIKit/UIKit.h>

@class LTBLyricController, LTBLyric;

NS_ASSUME_NONNULL_BEGIN

@interface LTBLyricsViewController : UIViewController <UITextViewDelegate>

@property (nonatomic) LTBLyricController *lyricController;
@property (nonatomic) LTBLyric *lyrics;

- (void)updateViews;

@end

NS_ASSUME_NONNULL_END
