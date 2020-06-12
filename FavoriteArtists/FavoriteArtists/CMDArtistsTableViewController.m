//
//  CMDArtistsTableViewController.m
//  FavoriteArtists
//
//  Created by Chris Dobek on 6/12/20.
//  Copyright © 2020 Chris Dobek. All rights reserved.
//

#import "CMDArtistsTableViewController.h"
#import "CMDArtistController.h"
#import "CMDArtist.h"
#import "CMDArtistDetailViewController.h"

@interface CMDArtistsTableViewController ()

@end

@implementation CMDArtistsTableViewController

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
        _artistController = [[CMDArtistController alloc] init];
    }
    return self;
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.artistController.artists.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ArtistCell" forIndexPath:indexPath];
    CMDArtist *artist = self.artistController.artists[indexPath.row];
    cell.textLabel.text = artist.name;
    cell.detailTextLabel.text = [self yearStr: artist];
    
    return cell;
}

- (NSString *)yearStr:(CMDArtist *)artist {
    if (artist.year != 0) {
        return [NSString stringWithFormat:@"%i", artist.year];
    } else {
        return [NSString stringWithFormat:@"%i: (year not found)", 0];
    }
}


// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        CMDArtist *artist = self.artistController.artists[indexPath.row];
        [self.artistController deleteArtist:artist];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
        NSLog(@"Artist Deleted!");
    }
}



#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
    
    if ([segue.identifier isEqualToString:@"ShowArtistSegue"]) {
        CMDArtistDetailViewController *detailVC = segue.destinationViewController;
        CMDArtist *artist = self.artistController.artists[indexPath.row];
        detailVC.artistController = self.artistController;
        detailVC.artist = artist;
    }
    
    
    if ([segue.identifier isEqualToString:@"AddArtistSegue"]) {
        CMDArtistDetailViewController *addVC = segue.destinationViewController;
        addVC.artistController = self.artistController;
    }
}
@end
