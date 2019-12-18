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
    [self.saveButton setEnabled:NO];
    [self.saveButton setTintColor:[UIColor clearColor]];
    [self updateView];
    self.searchBar.delegate = self;
    // Do any additional setup after loading the view.
}

- (void)updateView {
    if(self.artist) {
        self.nameLabel.text = self.artist.name;
        if (self.artist.year == 0) {
            self.yearLabel.text = @"unknown formed year";
        } else {
             self.yearLabel.text = [NSString stringWithFormat:@"%d", self.artist.year];
        }
        self.biographyTextView.text = self.artist.biography;
        [self.searchBar setHidden:YES];
    } else {
        self.nameLabel.text = @"";
        self.yearLabel.text = @"";
        self.biographyTextView.text = @"";
    }
}

- (IBAction)saveButtonTapped:(id)sender {
    if(self.artist) {
        [self.controller addArtist:self.artist];
        [self.navigationController popViewControllerAnimated:YES];
    }
    
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    NSString *keyword = searchBar.text;
    [self.controller fetchArtistWithKeyword:keyword completitionBlock:^(BYArtist *artist, NSError *error) {
        if(error) {
            dispatch_async(dispatch_get_main_queue(), ^(void){
                self.nameLabel.text = @"unable to find this artist";
            });
            return;
        }
        
        if(artist) {
            self.artist = artist;
                dispatch_async(dispatch_get_main_queue(), ^(void){
                    [self updateView];
                    [self.saveButton setEnabled:YES];
                    [self.saveButton setTintColor:[UIColor systemBlueColor]];
                    [self.searchBar setHidden:NO];
                });
        } else {
           dispatch_async(dispatch_get_main_queue(), ^(void){
                self.nameLabel.text = @"unable to find this artist";
            });
        }
    }];
    
}


@end
