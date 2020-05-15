//
//  WAHArtistTableViewController.m
//  Favorite Artists
//
//  Created by Wyatt Harrell on 5/15/20.
//  Copyright © 2020 Wyatt Harrell. All rights reserved.
//

#import "WAHArtistTableViewController.h"
#import "WAHArtistController.h"
#import "ArtistViewController.h"
#import "WAHArtist.h"

@interface WAHArtistTableViewController ()

@property (nonatomic) WAHArtistController *artistController;
@property (nonatomic) NSMutableArray *savedArtists;

@end

@implementation WAHArtistTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSArray *tempArtists = [self.artistController fetchSavedArtists];
    self.savedArtists = [[NSMutableArray alloc] initWithArray:tempArtists];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.savedArtists.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ArtistCell" forIndexPath:indexPath];
    
    WAHArtist *artist = self.savedArtists[indexPath.row];
    cell.textLabel.text = artist.artist;
    
    if (artist.yearFormed == 0) {
        cell.detailTextLabel.text = @"N/A";
    } else {
        cell.detailTextLabel.text = [NSString stringWithFormat:@"Formed in %d", artist.yearFormed];
    }
    
    return cell;
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if([segue.identifier isEqualToString:@"ShowArtistSearchSegue"]){
        ArtistViewController *controller = (ArtistViewController *)segue.destinationViewController;
        controller.artistController = self.artistController;
    }
    
    if ([segue.identifier isEqualToString:@"ShowArtistSegue"]) {
        ArtistViewController *controller = (ArtistViewController *)segue.destinationViewController;
        NSIndexPath *selectedIndexPath = [self.tableView indexPathForSelectedRow];
        controller.artist = self.savedArtists[selectedIndexPath.row];
    }
}


- (WAHArtistController *)artistController {
    if (!_artistController) {
        _artistController = [[WAHArtistController alloc] init];
    }
    return _artistController;
}

@end
