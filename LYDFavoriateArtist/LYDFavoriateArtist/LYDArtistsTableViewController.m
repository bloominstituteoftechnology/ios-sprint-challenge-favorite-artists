//
//  LYDArtistsTableViewController.m
//  LYDFavoriateArtist
//
//  Created by Lydia Zhang on 5/15/20.
//  Copyright © 2020 Lydia Zhang. All rights reserved.
//

#import "LYDArtistsTableViewController.h"
#import "LYDArtistController.h"
#import "LYDArtist.h"
#import "LYDArtistDetailViewController.h"

@interface LYDArtistsTableViewController ()

@end

@implementation LYDArtistsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.artistController loadArtistFromStore];
}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.tableView reloadData];
}

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        _artistController = [[LYDArtistController alloc] init];
    }
    return self;
}
#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.artistController.artists.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ArtistCell" forIndexPath:indexPath];
    LYDArtist *artist = self.artistController.artists[indexPath.row];
    cell.textLabel.text = artist.name;
    cell.detailTextLabel.text = [self yearStr: artist];
    
    return cell;
}

- (NSString *)yearStr:(LYDArtist *)artist {
    if (artist.year != 0) {
        return [NSString stringWithFormat:@"%i", artist.year];
    } else {
        return [NSString stringWithFormat:@"%i: (year not found)", 0];
    }
}


// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        LYDArtist *artist = self.artistController.artists[indexPath.row];
        [self.artistController deleteArtist:artist];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
}



#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];

     if ([segue.identifier isEqualToString:@"ShowArtistsSegue"]) {
         LYDArtistDetailViewController *detailVC = segue.destinationViewController;
         LYDArtist *artist = self.artistController.artists[indexPath.row];
         detailVC.artistController = self.artistController;
         detailVC.artist = artist;
     }
    
    
    if ([segue.identifier isEqualToString:@"AddArtistSegue"]) {
        LYDArtistDetailViewController *addVC = segue.destinationViewController;
        addVC.artistController = self.artistController;
    }
}


@end
