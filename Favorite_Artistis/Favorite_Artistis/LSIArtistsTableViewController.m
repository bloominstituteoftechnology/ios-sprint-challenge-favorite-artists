//
//  LSIArtistsTableViewController.m
//  Favorite_Artistis
//
//  Created by Joe on 5/30/20.
//  Copyright © 2020 AlphaGradeINC. All rights reserved.
//

#import "LSIArtistsTableViewController.h"
#import "LSISearchArtistsViewController.h"
#import "LSIArtist.h"

@interface LSIArtistsTableViewController () {

    NSString *artist;
}
@end

@implementation LSIArtistsTableViewController

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        _lsiArtistController = [[LSIArtistController alloc] init];
        
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
        dispatch_async(dispatch_get_main_queue(), ^{
            
            [self.tableView reloadData];
        });
    
    
}

- (void)viewWillAppear:(BOOL)animated {
   
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.tableView reloadData];
        });
}

- (void) sendControllerToTableView:(LSIArtistController *)lsiArtistController
{
    self.lsiArtistController = lsiArtistController;
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.lsiArtistController.artists.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ArtistCell" forIndexPath:indexPath];
    
    LSIArtist *artist = self.lsiArtistController.artists[indexPath.row];
    cell.textLabel.text = artist.artistName;
    cell.detailTextLabel.text = @"";
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
    if ([segue.identifier isEqualToString:@"ToArtistDetails"]) {
        LSISearchArtistsViewController *destinationVC =
        segue.destinationViewController;
        NSIndexPath *indexPath = self.tableView.indexPathForSelectedRow;
        destinationVC.artist = self.lsiArtistController.artists[indexPath.row];
    } else if ([segue.identifier isEqualToString:@"AddNewArtist"]){
        LSISearchArtistsViewController *destinationVC =
        segue.destinationViewController;
        [destinationVC setDelegate:self];
    }
}


@end
