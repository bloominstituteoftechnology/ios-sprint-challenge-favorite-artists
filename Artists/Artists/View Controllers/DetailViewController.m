//
//  DetailViewController.m
//  Artists
//
//  Created by Alexander Supe on 20.03.20.
//  Copyright © 2020 Alexander Supe. All rights reserved.
//

#import "DetailViewController.h"
#import "Artist.h"
#import "ArtistController.h"
#import "Artist+Persistance.h"
#import "Artist+NSJSONSerialization.h"

@interface DetailViewController ()

@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *formedInLabel;
@property (weak, nonatomic) IBOutlet UITextView *bioTextView;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *saveButton;

- (void)setUpViews;
- (void)startSearching:(NSString *)term;

@end

@implementation DetailViewController

- (IBAction)save:(id)sender {
    [[Artist new] saveToPersistantStore:_artist.toDictionary];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    self.artist = [[Artist alloc] initWithName:@" " biography:@" " yearFormed:0];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    _searchBar.delegate = self;
    if (_artist) {
        [self setUpViews];
        [self setTitle:_artist.name];
        [self.searchBar setHidden:YES];
        [self.saveButton setEnabled:FALSE];
        [self.saveButton setTintColor:UIColor.clearColor];
    } else {
        [self setTitle:@"Add New Artist"];
        [self.searchBar setHidden:NO];
        [self.saveButton setEnabled:YES];
        [self.saveButton setTintColor:UIColor.systemBlueColor];
    }
}

-(void)startSearching:(NSString *)term {
    [[ArtistController new] getArtist:term completion:^(Artist *artist) {
        self.artist = artist;
    }];
}

- (void)setArtist:(Artist *)artist {
    _artist = artist;
    dispatch_async(dispatch_get_main_queue(), ^{
        [self setUpViews];
    });
}

- (void)setUpViews {
    [self setTitle:_artist.name];
    _nameLabel.text = _artist.name;
    _formedInLabel.text = [NSString stringWithFormat:@"    Formed in: %d", _artist.yearFormed];
    _bioTextView.text = _artist.biography;
}

// MARK: Search Bar
- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    [self startSearching:searchBar.text];
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
