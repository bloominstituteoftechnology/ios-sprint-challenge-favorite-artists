//
//  ViewController.m
//  FavoriteArtists_OBJC
//
//  Created by Alex Shillingford on 2/21/20.
//  Copyright © 2020 shillwil. All rights reserved.
//

#import "ViewController.h"
#import "WASArtistController.h"
#import "WASArtist.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;
@property (weak, nonatomic) IBOutlet UILabel *artistLabel;
@property (weak, nonatomic) IBOutlet UILabel *formedLabel;
@property (weak, nonatomic) IBOutlet UITextView *textView;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.searchBar setDelegate:self];
    [self updateViews];
}

- (void)updateViews {
    
    self.artistLabel.text = self.artist.name;
    self.textView.text = self.artist.biography;
    self.formedLabel.text = [self yearString];
}

- (NSString *)yearString {
    if (self.artist.yearFormed != 0) {
        return [NSString stringWithFormat:@"%i", self.artist.yearFormed];
    } else {
        return @"Not available";
    }
}

- (IBAction)saveTapped:(id)sender {
    if (self.artist) {
        NSLog(@"saveTapped");
        [self.artistController saveArtist:self.artist];
        [self.navigationController popViewControllerAnimated:true];
    }
}



- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    NSString *searchTerm = searchBar.text;
    
    [self.artistController searchForArtistWithName:searchTerm completion:^(WASArtist *artist, NSError *error) {
        dispatch_async(dispatch_get_main_queue(), ^{
            NSLog(@"Artist: %@, Error: %@", artist.name, error);
            self.artist = artist;
            [self updateViews];
            NSLog(@"called!");
        });
    }];
}



@end
