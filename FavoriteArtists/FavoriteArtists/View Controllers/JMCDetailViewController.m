//
//  JMCDetailViewController.m
//  FavoriteArtists
//
//  Created by Jarren Campos on 8/3/20.
//  Copyright © 2020 Jarren Campos. All rights reserved.
//

#import "JMCDetailViewController.h"
#import "JMCArtist.h"
#import "JMCArtistController.h"
#import "JMCArtist+NSJSONSerialization.h"

@interface JMCDetailViewController ()

@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *formedInLabel;
@property (weak, nonatomic) IBOutlet UITextView *bioTextView;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *saveButton;

- (void)setUpViews;
- (void)startSearching:(NSString *)term;

@end

@implementation JMCDetailViewController

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    self.artist = [[JMCArtist alloc] initWithName:@" " biography:@" " yearFormed:0];
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
    [[JMCArtistController new] getArtist:term completion:^(JMCArtist *artist) {
        self.artist = artist;
    }];
}

- (void)setArtist:(JMCArtist *)artist {
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

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    [self startSearching:searchBar.text];
}

@end
