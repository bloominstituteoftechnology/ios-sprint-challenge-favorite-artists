//
//  DLJArtistTableViewController.m
//  FavoriteArtistApp
//
//  Created by Diante Lewis-Jolley on 7/19/19.
//  Copyright © 2019 Diante Lewis-Jolley. All rights reserved.
//

#import "DLJArtistTableViewController.h"
#import "DLJArtistController.h"
#import "DLJDetailViewController.h"
#import "DLJSearchViewController.h"

@interface DLJArtistTableViewController ()

@property DLJArtistController *artistController;
@property DLJArtist *artist;
@property NSMutableArray *artistArray;


@end

@implementation DLJArtistTableViewController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:YES];
    if (!self.artistController) {
        self.artistController = [[DLJArtistController alloc] init];
        self.artist = [[DLJArtist alloc] init];
    }
    [self.artistArray removeAllObjects];
    self.artistArray = [self.artistController artistArray];
    NSLog(@"%lu", (unsigned long)self.artistArray.count);
    [self.tableView reloadData];
}

#pragma mark - Table view data source


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.artistArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ArtistCell" forIndexPath:indexPath];
    
    DLJArtist *artist = self.artistArray[indexPath.row];
    NSString *yearFormedString = [NSString stringWithFormat:@"Formed in %d", artist.yearFormed];

    cell.textLabel.text = artist.name;
    cell.detailTextLabel.text = yearFormedString;
    
    return cell;
}





#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {

    if ([segue.identifier isEqualToString:@"DetailSegue"]) {
        DLJDetailViewController *DetailVC = segue.destinationViewController;

        // Set the Saved Artist as the Detail Artist
        NSIndexPath *indexPath = [[self tableView] indexPathForSelectedRow];
        DetailVC.artist = [self artistArray][indexPath.row];
    } else {
        if ([segue.identifier isEqualToString:@"SearchSegue"]) {
            DLJSearchViewController *SearchVC = segue.destinationViewController;
            SearchVC.artistController = self.artistController;
        }
    }
}


@end
