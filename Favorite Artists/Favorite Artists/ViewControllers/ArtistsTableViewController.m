//
//  ArtistsTableViewController.m
//  Favorite Artists
//
//  Created by Mark Gerrior on 5/15/20.
//  Copyright © 2020 Mark Gerrior. All rights reserved.
//

#import "ArtistsTableViewController.h"
#import "ArtistController.h"
#import "MTGArtist.h"
#import "AddViewController.h"

@interface ArtistsTableViewController ()

@property ArtistController *artistController;

@end

@implementation ArtistsTableViewController

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        _artistController = [[ArtistController alloc] init];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self.tableView reloadData];
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _artistController.artists.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ArtistCell" forIndexPath:indexPath];
    
    // Configure the cell...
    MTGArtist *artist = _artistController.artists[indexPath.row];
    cell.textLabel.text = artist.artist;
    if (artist.formedYear == -1) {
        cell.detailTextLabel.text = @"Formed: N/A";
    } else {
        cell.detailTextLabel.text = [NSString stringWithFormat:@"Formed in %0d", artist.formedYear];
    }

    return cell;
}

// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [self.artistController delete:indexPath.row];

        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([segue.destinationViewController isKindOfClass:[AddViewController class]]) {
        AddViewController *addVC = segue.destinationViewController;
        addVC.artistController = self.artistController;
    }
}

@end
