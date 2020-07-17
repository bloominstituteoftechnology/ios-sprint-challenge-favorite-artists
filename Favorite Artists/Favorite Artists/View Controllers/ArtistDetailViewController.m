//
//  ArtistDetailViewController.m
//  Favorite Artists
//
//  Created by Vincent Hoang on 7/17/20.
//  Copyright © 2020 Vincent Hoang. All rights reserved.
//

#import "ArtistDetailViewController.h"
#import "Artist.h"

@interface ArtistDetailViewController () <UISearchBarDelegate>

@property (nonatomic) UISearchBar IBOutlet *searchBar;
@property (nonatomic) UIBarButtonItem IBOutlet *saveButton;

@property (nonatomic) UILabel IBOutlet *nameLabel;
@property (nonatomic) UILabel IBOutlet *formedLabel;
@property (nonatomic) UILabel IBOutlet *bioLabel;

@end

@implementation ArtistDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.searchBar.delegate = self;
    
    if (self.artist) {
        [self updateViews];
    }
}

// MARK: - Utility

- (void)updateViews {
    if (self.artist) {
        self.searchBar.hidden = YES;
        
        self.title = self.artist.name;
        
        self.nameLabel.text = self.artist.name;
        self.formedLabel.text = [NSString stringWithFormat:@"Formed in %d", self.artist.formed];
        self.bioLabel.text = self.artist.bio;
    }
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
