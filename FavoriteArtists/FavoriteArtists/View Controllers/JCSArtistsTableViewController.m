//
//  JCSArtistsTableViewController.m
//  FavoriteArtists
//
//  Created by Lambda_School_Loaner_95 on 4/4/19.
//  Copyright © 2019 JS. All rights reserved.
//

#import "JCSArtistsTableViewController.h"
#import "JCSArtist.h"
#import "JCSArtistController.h"
#import "JCSArtistDetailViewController.h"
#import "JCSFileOps.h"

@interface JCSArtistsTableViewController ()

@end

@implementation JCSArtistsTableViewController

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        _artistController = [[JCSArtistController alloc] init];
    }
    return self;
}

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        _artistController = [[JCSArtistController alloc] init];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [_artistController loadFromPersistentStore];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.tableView reloadData];
    });
}


#pragma mark - Table view data source


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.artistController.savedArtists.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ArtistCell" forIndexPath:indexPath];
    
    JCSArtist *art = self.artistController.savedArtists[indexPath.row];
    
    cell.textLabel.text = art.artistName;
    cell.detailTextLabel.text = [NSString stringWithFormat:@"Formed in %d", art.yearFormed];
    
    return cell;
}


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
    if ([[segue identifier] isEqualToString:@"ArtistDetail"]) {
        JCSArtistDetailViewController *cellDetailController = [segue destinationViewController];
        NSInteger *index = [[self.tableView indexPathForSelectedRow] row];
        
        cellDetailController.artist = [self.artistController.savedArtists objectAtIndex:(int)index];
         NSLog(@"Artist at index: %d", (int)index);
        
        cellDetailController.artistController = self.artistController;
    }
    
    if ([[segue identifier] isEqualToString:@"NewArtist"]) {
        JCSArtistDetailViewController *cellDetailController = [segue destinationViewController];
        cellDetailController.artistController = self.artistController;
    }
}


@end
