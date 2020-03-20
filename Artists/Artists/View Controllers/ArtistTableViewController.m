//
//  ArtistTableViewController.m
//  Artists
//
//  Created by Alexander Supe on 20.03.20.
//  Copyright © 2020 Alexander Supe. All rights reserved.
//

#import "ArtistTableViewController.h"
#import "Artist+Persistance.h"
#import "DetailViewController.h"

@interface ArtistTableViewController ()

@property (nonatomic) NSArray *artists;

@end

@implementation ArtistTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

-(void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    self.artists = [Artist new].getFromPersistantStore;
    [self.tableView reloadData];
}

#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _artists.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    Artist *artist = _artists[indexPath.row];
    [cell.textLabel setText:artist.name];
    [cell.detailTextLabel setText:[NSString stringWithFormat:@"Formed in: %d", artist.yearFormed]];
    
    return cell;
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier  isEqual: @"ShowSegue"]) {
        DetailViewController *vc = [segue destinationViewController];
        long index = [self.tableView indexPathForSelectedRow].row;
        vc.artist = self.artists[index];
    }
}

@end
