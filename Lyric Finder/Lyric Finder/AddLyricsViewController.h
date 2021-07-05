//
//  AddLyricsViewController.h
//  Lyric Finder
//
//  Created by Vuk Radosavljevic on 10/5/18.
//  Copyright © 2018 Vuk. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN


@class Song;
@class SongController;

@interface AddLyricsViewController : UIViewController


@property SongController *songController;
@property (nonatomic) Song *song;

@end

NS_ASSUME_NONNULL_END
