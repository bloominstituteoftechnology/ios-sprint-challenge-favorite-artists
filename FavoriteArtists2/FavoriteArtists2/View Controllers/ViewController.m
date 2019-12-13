//
//  ViewController.m
//  FavoriteArtists2
//
//  Created by Jesse Ruiz on 12/13/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupViews];
    [self updateViews];
    self.searchBar.delegate = self;
    self.textView.delegate = self;
}

- (void)setupViews
{
    self.textView.layer.cornerRadius = 6;
    self.textView.layer.borderColor = UIColor.blackColor.CGColor;
    self.textView.layer.borderWidth = 0.2;
}

- (void)updateViews
{
    if (self.artist) {
        self.title = self.artist.name;
        self.artistTitle.text = self.artist.name;
        self.artistDateFormed.text = [NSString stringWithFormat:@"Formed in %@", self.artist.formed];
        self.textView.text = self.artist.bio;
    } else {
        self.title = @"Add New Artist";
    }
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    
    [self.artistController searchForArtistsWithSearchTerm:searchBar.text completion:^(Artist *artists, NSError *error) {
        
        if (error) {
            NSLog(@"Error: %@", error);
            return;
        }
        
        if (artists) {
            self.artist = artists;
            dispatch_async(dispatch_get_main_queue(), ^{
                [self updateViews];
            });
        }
    }];
}

- (IBAction)saveArtist:(UIBarButtonItem *)sender {
    NSString *name = self.artistTitle.text;
    NSString *bio = self.textView.text;
    NSString *formed = self.artistDateFormed.text;
    
    [self.artistController createFavoriteArtistWithName:name bio:bio formed:formed];
    
    [self.navigationController popViewControllerAnimated:YES];
}


@end
