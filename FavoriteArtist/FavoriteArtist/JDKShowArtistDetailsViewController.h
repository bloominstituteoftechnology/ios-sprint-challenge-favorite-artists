//
//  JDKShowArtistDetailsViewController.h
//  FavoriteArtist
//
//  Created by John Kouris on 2/8/20.
//  Copyright © 2020 John Kouris. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JDKArtist.h"

NS_ASSUME_NONNULL_BEGIN

@interface JDKShowArtistDetailsViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *artistNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *yearFormedLabel;
@property (weak, nonatomic) IBOutlet UITextView *biographyTextView;

@property JDKArtist *artist;

@end

NS_ASSUME_NONNULL_END
