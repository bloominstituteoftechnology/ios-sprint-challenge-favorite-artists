//
//  GLIViewController.h
//  FavoriteArtists
//
//  Created by Julian A. Fordyce on 4/5/19.
//  Copyright © 2019 Julian A. Fordyce. All rights reserved.
//

#import <UIKit/UIKit.h>

@class GLIArtistDetail;
@class GLIArtistDetailController;

@interface GLIViewController : UIViewController<UISearchBarDelegate>

@property (weak, nonatomic) IBOutlet UIBarButtonItem *saveButton;

@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;

@property (weak, nonatomic) IBOutlet UILabel *artistLabel;
@property (weak, nonatomic) IBOutlet UILabel *yearLabel;
@property (weak, nonatomic) IBOutlet UITextView *bioTextView;


- (IBAction)saveInfo:(id)sender;

- (void)updateViews;


@end

