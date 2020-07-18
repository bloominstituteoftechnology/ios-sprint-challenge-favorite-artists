//
//  JEVArtistTableViewController.m
//  Favorite Artists
//
//  Created by Joe Veverka on 7/18/20.
//  Copyright © 2020 Joe Veverka. All rights reserved.
//

#import "JEVArtistTableViewController.h"
#import "JEVArtistDetailViewController.h"
#import "JEVArtist.h"
#import "JEVArtistController.h"

@interface JEVArtistTableViewController ()

@end

@implementation JEVArtistTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _controller = [[JEVArtistController alloc] init];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.tableView reloadData];
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.controller.artists.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ArtistCell" forIndexPath:indexPath];
    
    JEVArtist *artist = self.controller.artists[indexPath.row];
    
    cell.textLabel.text = artist.name;
    
    if (artist.year == 0)
    {
        cell.detailTextLabel.text = @"";
    }
    else
        
    {
        cell.detailTextLabel.text = [NSString stringWithFormat:@"Formed in %ld", artist.year];
    }
    
    return cell;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([segue.identifier isEqualToString:@"ViewArtist"])
        
    {
        JEVArtistDetailViewController *destinationVC = (JEVArtistDetailViewController *)[segue destinationViewController];
        
        long row = self.tableView.indexPathForSelectedRow.row;
        JEVArtist *artist = self.controller.artists[row];
        
        destinationVC.artist = artist;
        destinationVC.controller = self.controller;
    }
    
    else if ([segue.identifier isEqualToString:@"AddArtist"])
        
    {
        JEVArtistDetailViewController *destinationVC = (JEVArtistDetailViewController *)[segue destinationViewController];
        destinationVC.controller = self.controller;
    }
}


@end
