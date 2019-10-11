//
//  BYArtistViewController.m
//  Artist-objc
//
//  Created by Bradley Yin on 10/11/19.
//  Copyright © 2019 bradleyyin. All rights reserved.
//

#import "BYArtistViewController.h"
#import "BYArtist.h"
#import "BYArtistController.h"

@interface BYArtistViewController () <UISearchBarDelegate>

@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *saveButton;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *yearLabel;
@property (weak, nonatomic) IBOutlet UITextView *biographyTextView;

- (void)updateView;


@end

@implementation BYArtistViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self updateView];
    // Do any additional setup after loading the view.
}

- (void)updateView {
    if(self.artist) {
        self.nameLabel.text = self.artist.name;
        self.yearLabel.text = [NSString stringWithFormat:@"%d", self.artist.year];
        self.biographyTextView.text = self.artist.biography;
    } else {
        self.nameLabel.text = @"";
        self.yearLabel.text = @"";
        self.biographyTextView.text = @"";
    }
}

- (IBAction)saveButtonTapped:(id)sender {
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    NSString *keyword = searchBar.text;
    
}


@end
