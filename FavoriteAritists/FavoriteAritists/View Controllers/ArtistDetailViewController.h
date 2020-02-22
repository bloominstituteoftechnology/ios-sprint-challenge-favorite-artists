//
//  ArtistDetailViewController.h
//  FavoriteAritists
//
//  Created by brian vilchez on 1/24/20.
//  Copyright © 2020 brian vilchez. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ArtistController;
@class Artist;
NS_ASSUME_NONNULL_BEGIN

@interface ArtistDetailViewController : UIViewController
@property ArtistController *artistController;
@property Artist *artist;
@property (weak, nonatomic) IBOutlet UILabel *artistNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *yearFormedLabel;
@property (weak, nonatomic) IBOutlet UITextView *biographyLabel;
@end

NS_ASSUME_NONNULL_END
