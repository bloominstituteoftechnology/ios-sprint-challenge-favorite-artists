//
//  YZISongsDetailViewController.h
//  Lyrics-Finder
//
//  Created by Yvette Zhukovsky on 1/25/19.
//  Copyright © 2019 Yvette Zhukovsky. All rights reserved.
//

#import <UIKit/UIKit.h>
@class YZISongs;
@class YZISongsController;


NS_ASSUME_NONNULL_BEGIN

@interface YZISongsDetailViewController : UIViewController
@property (nonatomic) YZISongs *songs;
@property (nonatomic) YZISongsController *songController;

@end

NS_ASSUME_NONNULL_END
