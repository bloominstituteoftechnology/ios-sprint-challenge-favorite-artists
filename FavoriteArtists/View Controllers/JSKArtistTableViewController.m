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

@interface JSKArtistTableViewController ()
{
    NSArray *artists;
}
@end

@implementation JSKArtistTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    artists = @[];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return artists.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ArtistCell" forIndexPath:indexPath];

    cell.textLabel.text = artists[indexPath.row];
    cell.detailTextLabel.text = artists[indexPath.item];
    
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
    } else if ([segue.identifier isEqualToString:@"ArtistDetailSegue"]) {
        JSKArtistDetailViewController *detailVC = segue.destinationViewController;
    }
}


@end
