//
//  SongDetailViewController.h
//  Lyric Finder
//
//  Created by Moin Uddin on 11/16/18.
//  Copyright © 2018 Moin Uddin. All rights reserved.
//

#import <UIKit/UIKit.h>
@class SongController;
@class Song;
NS_ASSUME_NONNULL_BEGIN

@interface SongDetailViewController : UIViewController


@property SongController *songController;
@property Song *song;
-(void) updateViews;

@end

NS_ASSUME_NONNULL_END
