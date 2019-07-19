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
