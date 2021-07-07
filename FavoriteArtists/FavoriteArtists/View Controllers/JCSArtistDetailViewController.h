//
//  JCSArtistDetailViewController.h
//  FavoriteArtists
//
//  Created by Lambda_School_Loaner_95 on 4/4/19.
//  Copyright © 2019 JS. All rights reserved.
//
#import <UIKit/UIKit.h>

@class JCSArtistController;
@class JCSArtist;

NS_ASSUME_NONNULL_BEGIN

@interface JCSArtistDetailViewController : UIViewController<UISearchBarDelegate>

@property (weak, nonatomic) IBOutlet UISearchBar *artistSearchBar;

@property (weak, nonatomic) IBOutlet UILabel *artistNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *formedYearLabel;
@property (weak, nonatomic) IBOutlet UILabel *artistInfoLabel;

@property (weak, nonatomic) IBOutlet UIBarButtonItem *saveButton;

- (IBAction)saveTapped:(UIBarButtonItem *)sender;

@property JCSArtistController *artistController;
@property JCSArtist *artist;

-(void)updateViews;
-(void)updateSearchViews;

@end

NS_ASSUME_NONNULL_END
