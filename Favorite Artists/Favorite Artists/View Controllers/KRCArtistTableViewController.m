//
//  KRCArtistTableViewController.m
//  Favorite Artists
//
//  Created by Christopher Aronson on 7/19/19.
//  Copyright © 2019 Christopher Aronson. All rights reserved.
//

#import "KRCArtistTableViewController.h"
#import "KRCDetailViewController.h"
#import "KRCArtistController.h"
#import "KRCArtist.h"

@interface KRCArtistTableViewController ()

@end

@implementation KRCArtistTableViewController

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    
    if (self = [super initWithCoder:aDecoder]) {
        _artistController = [[KRCArtistController alloc] init];
    }
    
    return self;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [[self tableView] reloadData];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [[self artistController] loadFile];
    [[self tableView] reloadData];
}

#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [[[self artistController] artistCollection] count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ArtistCell" forIndexPath:indexPath];
    
    KRCArtist *artistForCell = [[[self artistController] artistCollection] objectAtIndex:[indexPath row]];
    
    [[cell textLabel] setText:[artistForCell artistName]];
    [[cell detailTextLabel] setText:[NSString stringWithFormat:@"Formed %lu", [artistForCell yearFormed]]];
    
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
    
    if ([[segue identifier] isEqualToString:@"ShowAddArtist"]) {
        KRCDetailViewController *detailVC = [segue destinationViewController];
        [detailVC setArtistController:[self artistController]];
    } if ([[segue identifier] isEqualToString:@"ShowDetailArtist"]) {
        
        NSIndexPath *indexPath = [[self tableView] indexPathForSelectedRow];
        
        KRCDetailViewController *detailVC = [segue destinationViewController];
        [detailVC setArtistController:[self artistController]];
        [detailVC setArtist:[[[self artistController] artistCollection] objectAtIndex:[indexPath row]]];
    }
}


@end
