//
//  KRCDetailViewController.h
//  Favorite Artists
//
//  Created by Christopher Aronson on 7/19/19.
//  Copyright © 2019 Christopher Aronson. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class KRCArtistController;
@class KRCArtist;

@interface KRCDetailViewController : UIViewController <UISearchBarDelegate>

@property (nonatomic) KRCArtistController *artistController;
@property KRCArtist *artist;

- (void)setArtistController:(KRCArtistController * _Nonnull)artistController;

@end

NS_ASSUME_NONNULL_END
