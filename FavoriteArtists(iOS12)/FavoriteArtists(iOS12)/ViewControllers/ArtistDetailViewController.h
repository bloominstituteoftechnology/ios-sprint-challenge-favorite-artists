//
//  ArtistDetailViewController.h
//  FavoriteArtists(iOS12)
//
//  Created by brian vilchez on 2/21/20.
//  Copyright © 2020 brian vilchez. All rights reserved.
//

#import <UIKit/UIKit.h>

@class BFVArtistController;
@class BFVArtist;

NS_ASSUME_NONNULL_BEGIN

@interface ArtistDetailViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *bandNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *yearFormedLabel;
@property (weak, nonatomic) IBOutlet UITextView *biographyLabel;
@property (nonatomic,nullable) BFVArtist * artist;
@property(nonatomic, nullable) BFVArtistController *artistController;

- (void)updateViews;


@end

NS_ASSUME_NONNULL_END
