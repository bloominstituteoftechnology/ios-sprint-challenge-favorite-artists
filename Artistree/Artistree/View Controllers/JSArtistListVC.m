//
//  JSArtistListVC.m
//  Artistree
//
//  Created by Jeffrey Santana on 10/11/19.
//  Copyright © 2019 Lambda. All rights reserved.
//

#import "JSArtistListVC.h"
#import "JSArtistsController.h"
#import "JSArtistDetailsVC.h"
#import "JSArtist.h"

@class JSArtist;

@interface JSArtistListVC ()

@property JSArtistsController *artistController;

- (IBAction)addArtistBtnTapped:(id)sender;

@end

@implementation JSArtistListVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
	self.artistController = [[JSArtistsController alloc] init];
}

- (void)viewWillAppear:(BOOL)animated {
	[super viewWillAppear:animated];
	
	[self.tableView reloadData];
}

// MARK: - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
	if ([segue.destinationViewController isKindOfClass:JSArtistDetailsVC.self]) {
		JSArtistDetailsVC *detailsVC = segue.destinationViewController;
		detailsVC.artistController = self.artistController;
		
		NSIndexPath *indexPath = self.tableView.indexPathForSelectedRow;
		if (indexPath) {
			detailsVC.artist = self.artistController.artists[indexPath.row];
		}
	}
}

// MARK: - IBActions

- (IBAction)addArtistBtnTapped:(id)sender {
	
}

// MARK: - TableView Datasource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	return self.artistController.artists.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ArtistCell"];
	JSArtist *artist = self.artistController.artists[indexPath.row];
	
	cell.textLabel.text = artist.name;
	cell.detailTextLabel.text = [NSString stringWithFormat:@"Formed in %d", artist.yearFormed];
	
	return cell;
}

@end
