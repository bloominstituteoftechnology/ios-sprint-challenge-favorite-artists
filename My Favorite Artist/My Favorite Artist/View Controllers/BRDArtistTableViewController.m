//
//  BRDArtistTableViewController.m
//  My Favorite Artist
//
//  Created by Bradley Diroff on 6/12/20.
//  Copyright © 2020 Bradley Diroff. All rights reserved.
//

#import "BRDArtistTableViewController.h"
#import "BRDArtistViewController.h"
#import "BRDArtistController.h"
#import "BRDArtist.h"

@interface BRDArtistTableViewController ()

@property (nonatomic) BRDArtistController *artistController;
@property (nonatomic) NSMutableArray *savedArtists;

@end

@implementation BRDArtistTableViewController

- (BRDArtistController *)artistController {
    if (!_artistController) {
        _artistController = [[BRDArtistController alloc] init];
    }
    return _artistController;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSArray *tempArtists = [self.artistController fetchSavedArtists];
    self.savedArtists = [[NSMutableArray alloc] initWithArray:tempArtists];
}

-(void)viewWillAppear:(BOOL)animated{
   [super viewWillAppear:animated];
    
    NSArray *tempArtists = [self.artistController fetchSavedArtists];
    self.savedArtists = [[NSMutableArray alloc] initWithArray:tempArtists];
    
    [self.tableView reloadData];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.savedArtists.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    BRDArtist *artist = self.savedArtists[indexPath.row];
    cell.textLabel.text = artist.artist;
    
    if (artist.yearFormed == 0) {
        cell.detailTextLabel.text = @"N/A";
    } else {
        cell.detailTextLabel.text = [NSString stringWithFormat:@"Formed in %d", artist.yearFormed];
    }
    
    return cell;
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if([segue.identifier isEqualToString:@"SearchSegue"]){
        NSLog(@"Ok it should have the search now");
        BRDArtistViewController *vc = (BRDArtistViewController *)segue.destinationViewController;
        vc.artistController = self.artistController;
    }
    
    if ([segue.identifier isEqualToString:@"ArtistSegue"]) {
        BRDArtistViewController *controller = (BRDArtistViewController *)segue.destinationViewController;
        NSIndexPath *selectedIndexPath = [self.tableView indexPathForSelectedRow];
        controller.artist = self.savedArtists[selectedIndexPath.row];
    }
    
    
    
}

@end
