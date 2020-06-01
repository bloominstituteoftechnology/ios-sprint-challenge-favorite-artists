//
//  DSCFavoriteArtistTableViewController.m
//  FavoriteArtists
//
//  Created by denis cedeno on 5/29/20.
//  Copyright © 2020 DenCedeno Co. All rights reserved.
//

#import "DSCFavoriteArtistTableViewController.h"
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
    cell.textLabel.text = artist.name;
    cell.detailTextLabel.text = [NSString stringWithFormat:@"Formed In %d", artist.year];
    return cell;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        DSCArtist *artist = self.aController.returnArtistArray[indexPath.row];
        [self.aController deleteArtist:artist];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
}

#pragma mark - Navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([segue.identifier isEqualToString:@"ViewArtistSegue"]) {
        NSIndexPath *selectedIndexPath = [self.tableView indexPathForSelectedRow];
        DSCAddArtistViewController *detailVC = segue.destinationViewController;
        detailVC.artist = self.aController.artistArray[selectedIndexPath.row];
    }
}


@end
