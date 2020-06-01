//
//  SKITableViewController.m
//  FavoriteArtists
//
//  Created by Joshua Rutkowski on 5/31/20.
//

#import "SKITableViewController.h"
#import "SKIArtistController.h"
#import "SKIArtist.h"
#import "SKIDetailViewController.h"

@interface SKITableViewController ()

@end

@implementation SKITableViewController

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        _controller = [[SKIArtistController alloc] init];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.controller loadFromPersistentStore];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.tableView reloadData];
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.controller.savedArtists.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    
    SKIArtist *artist = self.controller.savedArtists[indexPath.row];
    NSString *dateString = [self yearString:artist];
    
    cell.textLabel.text = artist.name;
    cell.detailTextLabel.text = dateString;
    
    return cell;
}

- (NSString *)yearString:(SKIArtist *)artist {
    if (artist.year != 0) {
        return [NSString stringWithFormat:@"%i", artist.year];
    } else {
        return @"Not available";
    }
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        SKIArtist *artist = self.controller.savedArtists[indexPath.row];
        [self.controller removeArtist:artist];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
    SKIDetailViewController *detailVC = segue.destinationViewController;
    detailVC.artistController = self.controller;
    
    if ([segue.identifier isEqualToString:@"ShowArtistDetailSegue"]) {
        SKIArtist *artist = self.controller.savedArtists[indexPath.row];
        detailVC.artist = artist;
    }
}

@end
