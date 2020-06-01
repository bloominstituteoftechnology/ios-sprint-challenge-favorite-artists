//
//  DSCFavoriteArtistTableViewController.m
//  FavoriteArtists
//
//  Created by denis cedeno on 5/29/20.
//  Copyright © 2020 DenCedeno Co. All rights reserved.
//

#import "DSCFavoriteArtistTableViewController.h"
#import "DSCAddArtistViewController.h"
#import "DSCArtistController.h"
#import "DSCArtist.h"
#import "DSCFetchArtist.h"
#import "DSCArtist+_NSJSONSerialization.h"

@interface DSCFavoriteArtistTableViewController ()

@end

@implementation DSCFavoriteArtistTableViewController

- (DSCArtistController *)aController {
    if (!_aController) {
        _aController = [[DSCArtistController alloc]init];
    }
    return _aController;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    [self.aController loadFromPersistentStore];

}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.tableView reloadData];
    
}

#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSLog(@"from number of rows in section: %lu", (unsigned long)self.aController.returnArtistArray.count);
    return self.aController.returnArtistArray.count;

}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ArtistCell" forIndexPath:indexPath];

    DSCArtist *artist = self.aController.returnArtistArray[indexPath.row];
    NSLog(@"artistName from tableview:%@", artist.name);
    cell.textLabel.text = artist.name;
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
    
    if ([segue.identifier isEqualToString:@"ViewArtistSegue"]) {
        NSIndexPath *selectedIndexPath = [self.tableView indexPathForSelectedRow];
        DSCAddArtistViewController *detailVC = segue.destinationViewController;
        detailVC.artist = self.aController.artistArray[selectedIndexPath.row];
    }
}


@end
