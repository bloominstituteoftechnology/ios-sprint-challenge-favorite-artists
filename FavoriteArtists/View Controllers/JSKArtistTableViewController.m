//
//  JSKArtistTableViewController.m
//  FavoriteArtists
//
//  Created by Josh Kocsis on 9/25/20.
//

#import "JSKArtistTableViewController.h"
#import "JSKFetchArtistController.h"
#import "JSKArtistController.h"
#import "JSKAddArtistViewController.h"
#import "JSKArtistDetailViewController.h"
#import "JSKArtist+NSJSONSerialization.h"

@interface JSKArtistTableViewController ()

@property (nonatomic, readonly) JSKArtistController *artistController;

@end

@implementation JSKArtistTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.artistController loadArtist];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.artistController.artists.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ArtistCell" forIndexPath:indexPath];

    JSKArtist *artist = [self.artistController.artists objectAtIndex:indexPath.row];
    cell.textLabel.text = artist.artistName;
    cell.detailTextLabel.text = [NSString stringWithFormat:@"Formed in %@", artist.yearFormed];
    
    return cell;
}
/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

 /*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"AddArtistSegue"]) {
        NSIndexPath *indexPath = [[self tableView] indexPathForSelectedRow];
        JSKAddArtistViewController *addVC = segue.destinationViewController;
        addVC.artist = self.artistController.artists[indexPath.row];
        addVC.artistController = self.artistController;
    } else if ([segue.identifier isEqualToString:@"ArtistDetailSegue"]) {
        JSKArtistDetailViewController *detailVC = segue.destinationViewController;
        detailVC.artistController = self.artistController;
    }
}


@end
