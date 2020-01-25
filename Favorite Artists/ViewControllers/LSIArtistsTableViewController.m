//
//  LSIArtistsTableViewController.m
//  Favorite Artists
//
//  Created by macbook on 1/24/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

#import "LSIArtistsTableViewController.h"
#import "LSISearchArtistViewController.h"
#import "LSIArtistController.h"
#import "LSIArtist.h"

@interface LSIArtistsTableViewController ()

@end

@implementation LSIArtistsTableViewController

- (instancetype)initWithCoder:(NSCoder *)coder {
    
    self = [super initWithCoder:coder];
    if (self) {
        
        _artistController = [[LSIArtistController alloc] init];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self loadPersistence];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self.tableView reloadData];
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.artistController.favoriteArtists.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ArtistCell" forIndexPath:indexPath];
    
    LSIArtist *artist = self.artistController.favoriteArtists[indexPath.row];
    NSNumber *yearNumber = [NSNumber numberWithInt:artist.yearFormed];
    
    cell.textLabel.text = artist.name;
    cell.detailTextLabel.text = [yearNumber stringValue];
    
    return cell;
}

// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        
        LSIArtist *artist = self.artistController.favoriteArtists[indexPath.row];
        [self.artistController deleteArtist:artist];
        
        
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
        
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}

- (void)loadPersistence {
    
    NSArray *someArray = [self.artistController loadArtistsFromURL];
    
    if ([someArray isEqual:nil]) {
        return;
    } else {
        [self.tableView reloadData];
    }
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([segue.identifier isEqualToString:@"SearchNewArtistSegue"]) {
        
        LSISearchArtistViewController *searchArtistVC = (LSISearchArtistViewController *)[segue destinationViewController];
        
        searchArtistVC.artistController = self.artistController;
        
    } else if ([segue.identifier isEqualToString:@"ShowArtistDetailSegue"]) {
        
        LSISearchArtistViewController *artistDetailVC = (LSISearchArtistViewController *)[segue destinationViewController];
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        LSIArtist *artist = self.artistController.favoriteArtists[indexPath.row];
        
        artistDetailVC.artistController = self.artistController;
        artistDetailVC.artist = artist;
    }
}

@end
