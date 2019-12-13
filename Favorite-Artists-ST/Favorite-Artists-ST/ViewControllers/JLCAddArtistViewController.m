//
//  JLCAddArtistViewController.m
//  Favorite-Artists-ST
//
//  Created by Jake Connerly on 11/8/19.
//  Copyright © 2019 jake connerly. All rights reserved.
//

#import "JLCAddArtistViewController.h"

@interface JLCAddArtistViewController ()

// MARK: - IBOutlets and Properties

@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;
@property (weak, nonatomic) IBOutlet UILabel *artistNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *yearFormedLabel;
@property (weak, nonatomic) IBOutlet UITextView *bioTextField;

@end

@implementation JLCAddArtistViewController

// MARK: - View LifeCycle

- (void)viewDidLoad {
    [super viewDidLoad];
    self.searchBar.delegate = self;
    [self updateViews];
}

// MARK: - Methods

-(void)updateViews {
    if (self.artist) {
        self.artistNameLabel.text = self.artist.artistName;
        self.yearFormedLabel.text = [NSString stringWithFormat:@"Formed in %@.", self.artist.yearFormed];
        self.bioTextField.text = self.artist.biography;
    } else {
        self.artistNameLabel.text = @"Artist Name";
        self.yearFormedLabel.text = @"Formed In:";
        self.bioTextField.text = @"Artist Bio";
    }
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    
    [self.artistController searchForArtistWithArtistName:searchBar.text completion:^(JLCArtist *artist, NSError *error) {
        
        if (error) {
            NSLog(@"Error: %@", error);
            return;
        }
        
        dispatch_async(dispatch_get_main_queue(), ^{
            self.artist = artist;
            [self updateViews];
        });
    }];
}

- (IBAction)saveButtonTapped:(UIBarButtonItem *)sender {
    
    if (self.artist) {
        [self.artistController addFavoriteArtist:self.artist];
    }
    
    [self.navigationController popToRootViewControllerAnimated:YES];
}


@end
