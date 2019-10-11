//
//  JSArtistDetailsVC.m
//  Artistree
//
//  Created by Jeffrey Santana on 10/11/19.
//  Copyright © 2019 Lambda. All rights reserved.
//

#import "JSArtistDetailsVC.h"
#import "JSArtistsController.h"
#import "JSArtist.h"

@interface JSArtistDetailsVC ()

@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;
@property (weak, nonatomic) IBOutlet UILabel *nameLbl;
@property (weak, nonatomic) IBOutlet UILabel *conceptionLbl;
@property (weak, nonatomic) IBOutlet UILabel *biographyLbl;

- (IBAction)saveBtnTapped:(id)sender;

@end

@implementation JSArtistDetailsVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
	self.searchBar.delegate = self;
}

- (IBAction)saveBtnTapped:(id)sender {
	[self.artistController addArtist:self.artist];
	[self.navigationController popViewControllerAnimated:true];
}

- (void)updateViews {
	if (self.artist) {
		self.nameLbl.text = self.artist.name;
		self.conceptionLbl.text = [NSString stringWithFormat:@"Formed in %d", self.artist.yearFormed];
		self.biographyLbl.text = self.artist.biography;
	}
}

// MARK: - Searchbar Delegate

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
	NSString *searchText = searchBar.text;
	if (searchText || ![searchText isEqualToString:@""]) {
		[self.artistController fetchArtistByName:searchText completion:^(JSArtist *artist) {
			if (artist) {
				self.artist = artist;
				dispatch_sync(dispatch_get_main_queue(), ^{
					[self updateViews];
				});
			}
		}];
	}
}

@end
