//
//  LSIArtistsTableViewController.m
//  Favorite-Artists
//
//  Created by Percy Ngan on 1/24/20.
//  Copyright © 2020 Lamdba School. All rights reserved.
//

#import "PNCArtist.h"
#import "LSIArtistController.h"
#import "LSIArtistDetailViewController.h"
#import "LSIArtistsTableViewController.h"

@interface LSIArtistsTableViewController ()

@property LSIArtistController *controller;

@end


@implementation LSIArtistsTableViewController

- (instancetype)initWithCoder:(NSCoder *)coder
{
	self = [super initWithCoder:coder];
	if (self) {
		_controller = [[LSIArtistController alloc] init];
	}
	return self;
}

- (void)viewDidLoad {
	[super viewDidLoad];

}

- (void)viewWillAppear:(BOOL)animated {
	[super viewWillAppear:animated];
	[self.tableView reloadData];
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

	return [[self.controller artists] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ArtistCell" forIndexPath:indexPath];

	PNCArtist *artist = self.controller.artists[indexPath.row];

	[[cell textLabel] setText:[artist name]];

	if ([artist year] > 0) {
		[[cell detailTextLabel] setText:[NSString stringWithFormat:@"%d", [artist year]]];
	} else {
		[[cell detailTextLabel] setText:nil];
	}

	return cell;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {

	if (editingStyle == UITableViewCellEditingStyleDelete) {

		PNCArtist *artist = self.controller.artists[indexPath.row];
		NSUInteger index = [[self.controller artists] indexOfObject:artist];
		[[self.controller artists] removeObjectAtIndex:index];
		[self.controller saveToDocuments];

		[tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
	} else if (editingStyle == UITableViewCellEditingStyleInsert) {
		
	}
}

 #pragma mark - Navigation

 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {

	 LSIArtistDetailViewController *detailVC = segue.destinationViewController;
     if (detailVC) {
         detailVC.controller = self.controller;

		 if ([[segue identifier]  isEqual: @"ShowArtistDetailSegue"]) {
             NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
             PNCArtist *artist = self.controller.artists[indexPath.row];
             [detailVC setArtist:artist];
         }
     }
 }

@end
