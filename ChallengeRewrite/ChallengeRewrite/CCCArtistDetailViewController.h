//
//  CCCArtistDetailViewController.h
//  ChallengeRewrite
//
//  Created by Ryan Murphy on 7/19/19.
//  Copyright © 2019 Ryan Murphy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CCCArtist.h"

NS_ASSUME_NONNULL_BEGIN

@interface CCCArtistDetailViewController : UIViewController<UISearchBarDelegate>

- (void)updateViews;

@property (nonatomic) CCCArtist *artist;

@property (atomic) NSMutableArray *_Nullable artists;

@end

NS_ASSUME_NONNULL_END
