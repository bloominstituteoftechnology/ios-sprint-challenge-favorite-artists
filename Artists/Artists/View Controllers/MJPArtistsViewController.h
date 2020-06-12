//
//  MJPArtistsViewController.h
//  Artists
//
//  Created by Mark Poggi on 6/12/20.
//  Copyright © 2020 Mark Poggi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MJPArtist.h"
#import "MJPArtistController.h"

NS_ASSUME_NONNULL_BEGIN

@interface MJPArtistsViewController : UIViewController <UISearchBarDelegate>

@property MJPArtistController *artistController;
@property MJPArtist *artist;
@property MJPArtist *searchedArtist;

@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;
@property (weak, nonatomic) IBOutlet UILabel *artistLabel;
@property (weak, nonatomic) IBOutlet UILabel *yearLabel;
@property (weak, nonatomic) IBOutlet UITextView *bioTextView;

- (IBAction)saveButtonPressed:(id)sender;

@end

NS_ASSUME_NONNULL_END
