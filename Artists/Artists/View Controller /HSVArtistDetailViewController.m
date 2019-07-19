//
//  HSVArtistDetailViewController.m
//  Artists
//
//  Created by Hector Steven on 7/19/19.
//  Copyright © 2019 Hector Steven. All rights reserved.
//

#import "HSVArtistDetailViewController.h"

@interface HSVArtistDetailViewController ()

@end

@implementation HSVArtistDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
	self.serchBar.delegate = self;
	self.nameLabel.text = @"Test";
	
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {

	NSString *text = [searchBar text];
	
	NSLog(@"Search bar button clicked: %@", text);
	
//	[self.artistsController fetchArtistWithName:@"Morrissey" completion:^(NSError * _Nonnull error) {
//		if (error)
//			NSLog(@"Error fetching: %@", error);
//	}];

}


@end
