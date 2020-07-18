//
//  AddArtistViewController.m
//  FavoriteArtists
//
//  Created by Cody Morley on 7/17/20.
//  Copyright © 2020 Cody Morley. All rights reserved.
//

#import "AddArtistViewController.h"
#import <UIKit/UIKit.h>
#import "CAMArtistController.h"
#import "CAMArtist.h"

@interface AddArtistViewController ()
//MARK: - Internal Properties -
/// Outlets
@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *foundedLabel;
@property (weak, nonatomic) IBOutlet UITextView *bioTextView;
@end


@implementation AddArtistViewController 
//MARK: - Life Cycles -
- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.searchBar setDelegate: self];
    self.nameLabel.text = @"Search for an artist above.";
    self.bioTextView.text = @"";
    self.foundedLabel.text = @"";
}


//MARK: - Actions -
- (IBAction)saveArtist:(id)sender
{
    if (self.artist) {
        [self.controller saveArtist: self.artist];
        [self.navigationController popViewControllerAnimated: YES];
    }
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    NSString *searchTerm = searchBar.text;
    [self.controller searchForName: searchTerm
                        completion:^(CAMArtist *artist, NSError *error) {
        dispatch_async(dispatch_get_main_queue(), ^{
            if (!error) {
                self.artist = artist;
                [self updateViews];
            } else {
                self.nameLabel.text = @"No Artist Found. Try Again.";
                NSLog(@"Something went wrong! %@", error);
            }
        });
    }];
}


//MARK: - Methods -
- (void)updateViews
{
    NSString *founded = [NSString stringWithFormat: @"%i", self.artist.founded];
    self.nameLabel.text = self.artist.name;
    self.foundedLabel.text = founded;
    self.bioTextView.text = self.artist.bio;
}
@end
