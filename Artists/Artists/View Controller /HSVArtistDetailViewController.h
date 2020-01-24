//
//  HSVArtistDetailViewController.h
//  Artists
//
//  Created by Hector Steven on 7/19/19.
//  Copyright © 2019 Hector Steven. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class HSVArtistsController;
@class HSVArtist;

@interface HSVArtistDetailViewController : UIViewController <UISearchBarDelegate>

@property (nonatomic, strong) HSVArtistsController *artistController;
@property (nonatomic, strong) HSVArtist *artist;

@property (strong, nonatomic) IBOutlet UISearchBar *serchBar;
@property (strong, nonatomic) IBOutlet UILabel *nameLabel;
@property (strong, nonatomic) IBOutlet UILabel *formedDateLabel;
@property (strong, nonatomic) IBOutlet UITextView *textView;


- (void)setupViews;


@end

NS_ASSUME_NONNULL_END
