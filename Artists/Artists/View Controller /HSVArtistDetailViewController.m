//
//  HSVArtistDetailViewController.m
//  Artists
//
//  Created by Hector Steven on 7/19/19.
//  Copyright © 2019 Hector Steven. All rights reserved.
//

#import "HSVArtistDetailViewController.h"
#import "../Model Controller/HSVArtistsController.h"
#import "../Models/HSVArtist.h"

@interface HSVArtistDetailViewController ()

@end

@implementation HSVArtistDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
	self.serchBar.delegate = self;
	[self setupViews];
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {

	NSString *text = [searchBar text];
	
	NSLog(@"Search bar button clicked: %@", text);
	
	[self.artistController fetchArtistWithName:text completion:^(HSVArtist * _Nonnull artist, NSError * _Nonnull error) {
		dispatch_async(dispatch_get_main_queue(), ^{
			self.artist = artist;
			[self setupViews];
		});
		
	}];
}


- (void)setupViews {
	
	if (self.artist) {
		self.nameLabel.text = self.artist.name;
		self.textView.text = self.artist.biography;
		self.formedDateLabel.text = [[NSString alloc] initWithFormat:@"Formed in %i", self.artist.yearFormed];
	}
}


@end
