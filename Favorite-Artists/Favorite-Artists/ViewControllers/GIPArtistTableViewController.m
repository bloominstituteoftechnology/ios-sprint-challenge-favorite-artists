//
//  GIPArtistTableViewController.m
//  Favorite-Artists
//
//  Created by Gi Pyo Kim on 12/13/19.
//  Copyright © 2019 GIPGIP Studio. All rights reserved.
//

#import "GIPArtistTableViewController.h"
#import "GIPArtistController.h"
#import "GIPArtist.h"
#import "GIPArtist+NSJSONSerialization.h"
#import "GIPSearchViewController.h"
#import "GIPDetailViewController.h"

@interface GIPArtistTableViewController ()

- (IBAction)searchNewArtist:(id)sender;


@end

@implementation GIPArtistTableViewController

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        _controller = [[GIPArtistController alloc] init];
    }
    return self;
}

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        _controller = [[GIPArtistController alloc] init];
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self.tableView reloadData];
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.controller.artists.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ArtistCell" forIndexPath:indexPath];
    
    NSDictionary *artistDict = [self.controller.artists objectAtIndex:indexPath.row];
    GIPArtist *artist = [[GIPArtist alloc] initWithDictionary:artistDict];

    cell.textLabel.text = artist.name;
    cell.detailTextLabel.text = [NSString stringWithFormat:@"Formed Year: %d", (artist.yearFormed)];
    
    return cell;
}


// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([segue.identifier isEqualToString:@"SearchNewArtistSegue"]) {
        GIPSearchViewController *searchVC = segue.destinationViewController;
        searchVC.controller = self.controller;
    } else if ([segue.identifier isEqualToString:@"DetailViewSegue"]) {
        GIPDetailViewController *detailVC = segue.destinationViewController;
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        
        NSDictionary *artistDict = self.controller.artists[indexPath.row];
        detailVC.artist = [[GIPArtist alloc] initWithDictionary:artistDict];
    }
}


- (IBAction)searchNewArtist:(id)sender {
    [self performSegueWithIdentifier:@"SearchNewArtistSegue" sender:self];
}
@end
