//
//  WASTableViewController.m
//  FavoriteArtists_OBJC
//
//  Created by Alex Shillingford on 6/11/20.
//  Copyright © 2020 shillwil. All rights reserved.
//

#import "WASTableViewController.h"
#import "WASArtist.h"
#import "WASArtistController.h"
#import "ViewController.h"


@interface WASTableViewController ()

@end

@implementation WASTableViewController

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        _artistController = [[WASArtistController alloc] init];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.artistController loadFromPersistentStore];
    
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.tableView reloadData];
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.artistController.savedArtists.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ArtistCell" forIndexPath:indexPath];
    
    WASArtist *artist = self.artistController.savedArtists[indexPath.row];
    NSString *dateString = [self yearString:artist];
    
    cell.textLabel.text = artist.name;
    cell.detailTextLabel.text = dateString;
    
    return cell;
}

- (NSString *)yearString:(WASArtist *)artist {
    if (artist.name != 0) {
        return [NSString stringWithFormat:@"%i", artist.yearFormed];
    } else {
        return @"Not available";
    }
}


// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        WASArtist *artist = self.artistController.savedArtists[indexPath.row];
        [self.artistController removeArtist:artist];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
        [tableView reloadData];
    }
}

/*
 // Override to support rearranging the table view.
 - (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
 }
 */

/*
 // Override to support conditional rearranging of the table view.
 - (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
 // Return NO if you do not want the item to be re-orderable.
 return YES;
 }
 */


#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
    ViewController *detailVC = segue.destinationViewController;
    detailVC.artistController = self.artistController;
    
    if ([segue.identifier isEqualToString:@"ShowArtistDetailSegue"]) {
        WASArtist *artist = self.artistController.savedArtists[indexPath.row];
        detailVC.artist = artist;
    }
}

@end
