//
//  SAHArtistDetailViewController.m
//  Favorite Artists
//
//  Created by scott harris on 4/17/20.
//  Copyright © 2020 scott harris. All rights reserved.
//

#import "SAHArtistDetailViewController.h"
#import "SAHArtistFetcher.h"
#import "SAHArtist.h"

@interface SAHArtistDetailViewController () <UISearchBarDelegate>
@property (weak, nonatomic) IBOutlet UILabel *artistNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *yearFormedLabel;
@property (weak, nonatomic) IBOutlet UITextView *artistBiographyTextView;
@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;

@property (nonatomic) SAHArtistFetcher *artistFetcher;

@end

@implementation SAHArtistDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.searchBar.placeholder = @"Search";
    self.searchBar.delegate = self;
   
}

- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText {
    NSLog(@"Search Text: %@", searchText);
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    NSString *searchText = [NSString stringWithString:searchBar.text];
    [self.artistFetcher fetchArtistWithName:searchText completionBlock:^(SAHArtist * _Nullable artist, NSError * _Nullable error) {
        if (error) {
            NSLog(@"Error fetching artist: %@", error);
            return;
        }
        
        NSLog(@"Artist: %@", artist.biography);
        
        dispatch_async(dispatch_get_main_queue(), ^{
            self.artistNameLabel.text = artist.name;
            self.yearFormedLabel.text = [NSString stringWithFormat:@"Formed in %d", artist.yearFormed];
            self.artistBiographyTextView.text = artist.biography;
        });
        
        
    }];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}

-(SAHArtistFetcher *)artistFetcher {
    if (!_artistFetcher) {
        _artistFetcher = [[SAHArtistFetcher alloc] init];
    }
    
    return _artistFetcher;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
