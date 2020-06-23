//
//  VDRArtistTableViewController.m
//  FavArtists
//
//  Created by Victor  on 7/19/19.
//  Copyright © 2019 Victor . All rights reserved.
//

#import "VDRArtistTableViewController.h"
#import "VDRArtistController.h"
#import "VDRArtistDetailViewController.h"
#import "VDRArtistSearchViewController.h"


@interface VDRArtistTableViewController ()
@property VDRArtistController *artistController;
@property NSMutableArray *artistArray;
@property VDRArtist *artist;
@end

@implementation VDRArtistTableViewController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:YES];
    if (!self.artistController) {
        self.artistController = [[VDRArtistController alloc] init];
        self.artist = [[VDRArtist alloc] init];
    }
    [self.artistArray removeAllObjects];
    self.artistArray = [self.artistController fetchAllSavedArtists];
    NSLog(@"%lu", (unsigned long)self.artistArray.count);
    [self.tableView reloadData];
}


- (void)viewDidLoad {
    [super viewDidLoad];
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.artistArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ArtistCell" forIndexPath:indexPath];
    VDRArtist *artist = self.artistArray[indexPath.row];
    cell.textLabel.text = artist.name;
    NSString *yearFormed = [NSString stringWithFormat:@"Formed in %d", artist.yearFormed];
    cell.detailTextLabel.text = yearFormed;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    self.artist = [self.artistArray objectAtIndex:indexPath.row];
    NSLog(@"Perform segue");
    [self performSegueWithIdentifier:@"ArtistDetailSegue" sender:self];
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"ArtistDetailSegue"]) {
        VDRArtistDetailViewController *destinationVC = segue.destinationViewController;
        destinationVC.artist = self.artist;
    } else if ([segue.identifier isEqualToString:@"SearchArtistSegue"]) {
        VDRArtistSearchViewController *destinationVC = segue.destinationViewController;
        destinationVC.artistController = self.artistController;
    }
}


@end
