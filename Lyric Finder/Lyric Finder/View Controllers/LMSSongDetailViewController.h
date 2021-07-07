//
//  LMSSongDetailViewController.h
//  Lyric Finder
//
//  Created by Lisa Sampson on 3/1/19.
//  Copyright © 2019 Lisa M Sampson. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LMSSongController.h"
#import "LMSSong.h"

NS_ASSUME_NONNULL_BEGIN

@interface LMSSongDetailViewController : UIViewController

@property LMSSongController *songController;
@property LMSSong *song;

- (void)updateViews;
- (void)updateRating: (NSInteger)rating;

@end

NS_ASSUME_NONNULL_END
