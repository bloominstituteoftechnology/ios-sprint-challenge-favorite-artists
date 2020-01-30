//
//  LSIArtistDetailViewController.m
//  Favorite-Artists
//
//  Created by Percy Ngan on 1/24/20.
//  Copyright © 2020 Lamdba School. All rights reserved.
//

#import "PNCArtist.h"
#import "PNCArtistController.h"
#import "PNCArtistDetailViewController.h"

@interface LSIArtistDetailViewController ()

@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *saveButton;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *yearLabel;
@property (weak, nonatomic) IBOutlet UITextView *textView;

- (void)updateView;

@end

@implementation PNCArtistDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.saveButton setEnabled:NO];
    [self.saveButton setTintColor:[UIColor clearColor]];
    
    [self updateView];
    
    self.searchBar.delegate = self;
}

- (void)updateView {
    if(self.artist) {
        self.nameLabel.text = self.artist.name;
        //self.yearLabel.text = [NSString stringWithFormat:@"%d", self.artist.year];
        
        if (self.artist.year == 0) {
            self.yearLabel.text = @"unknown formed year";
        } else {
             self.yearLabel.text = [NSString stringWithFormat:@"%d", self.artist.year];
        }
        
        self.textView.text = self.artist.biography;
        [self.searchBar setHidden:YES];
    } else {
        self.nameLabel.text = @"";
        self.yearLabel.text = @"";
        self.textView.text = @"";
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
    [self.controller fetchArtistWithKeyword:keyword completitionBlock:^(PNCArtist *artist, NSError *error) {
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
