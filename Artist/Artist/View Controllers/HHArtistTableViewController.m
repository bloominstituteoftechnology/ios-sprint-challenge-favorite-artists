//
//  HHArtistTableViewController.m
//  Artist
//
//  Created by Hayden Hastings on 7/19/19.
//  Copyright © 2019 Hayden Hastings. All rights reserved.
//

#import "HHArtistTableViewController.h"
#import "HHArtist.h"
#import "HHArtistDetailViewController.h"

@interface HHArtistTableViewController ()

@property NSMutableArray *artistArray;
@property HHArtist *artistForSegue;

@end

@implementation HHArtistTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    if (!self.artistController) {
        self.artistController = [[HHArtistController alloc] init];
        self.artistForSegue = [[HHArtist alloc] init];
    }
    [_artistArray removeAllObjects];
    self.artistArray = [self.artistController fetchAllSavedArtists];
    self.tableView.reloadData;
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _artistArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ArtistCell" forIndexPath:indexPath];
    
    HHArtist *artist = _artistArray[indexPath.row];
    cell.textLabel.text = artist.name;
    NSString *yearFormed = [NSString stringWithFormat:@"%d", artist.yearFormed];
    cell.detailTextLabel.text = yearFormed;
    
    return cell;
}

#pragma mark - Navigation

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    self.artistForSegue = [_artistArray objectAtIndex:indexPath.row];
    [self performSegueWithIdentifier:@"toDetailVC" sender:self.artistForSegue];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"toDetailVC"]) {
        HHArtistDetailViewController *detailVC = segue.destinationViewController;
        detailVC.artist = sender;
    }
}


@end
