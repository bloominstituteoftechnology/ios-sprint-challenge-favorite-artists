//
//  JCSArtistDetailViewController.m
//  FavoriteArtists
//
//  Created by Lambda_School_Loaner_95 on 4/4/19.
//  Copyright © 2019 JS. All rights reserved.
//

#import "JCSArtistDetailViewController.h"
#import "JCSArtist.h"
#import "JCSArtistController.h"

@interface JCSArtistDetailViewController ()

@end

@implementation JCSArtistDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.artistSearchBar.delegate = self;
    [self updateViews];
    
}

-(void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    NSString *artistSearch = searchBar.text;
    
    if (artistSearch) {
        
        [self.artistController fetchArtistByName:artistSearch completion:^(NSError * _Nonnull error) {
            dispatch_async(dispatch_get_main_queue(), ^{
                [self updateSearchViews];
                NSLog(@"Searched name is: %@", artistSearch);
            });
        }];
    }
    
}
- (void)updateSearchViews {
    
    if (_artistController.foundArtists) {
        _artistNameLabel.text = [_artistController.foundArtists[0] artistName];
        _formedYearLabel.text = [NSString stringWithFormat:@"Formed in %d", [_artistController.foundArtists[0] yearFormed] ];
        _artistInfoLabel.text = [_artistController.foundArtists[0] biography];
        
    }
    
}
- (void)updateViews {
    
    if (_artist) {
        self.title = _artist.artistName;
        [self.navigationItem setRightBarButtonItems:nil animated:YES];
        self.artistSearchBar.hidden = true;
        _artistNameLabel.text = _artist.artistName;
        _formedYearLabel.text = [NSString stringWithFormat:@"Formed in %d", _artist.yearFormed];
        _artistInfoLabel.text = _artist.biography;
    } else {
        self.title = @"New Artist";
        self.saveButton.enabled = true;
        self.artistSearchBar.hidden = false;
        
    }
    
}

- (void)saveTapped:(UIBarButtonItem *)sender {
    NSString *artName = _artistNameLabel.text;
    NSString *bio = _artistInfoLabel.text;
    
    NSArray * arr = [_formedYearLabel.text componentsSeparatedByString:@" "];
    int year = (int)[arr[2] integerValue];
    NSLog(@"%d", year);
    
    JCSArtist *art = [[JCSArtist alloc] initWithName:artName bio:bio yearFormed:year];
    [_artistController addNewArtist:art];
    
    NSLog(@"Artist: %@", art.artistName);
    [self.navigationController popViewControllerAnimated:true];
    
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
