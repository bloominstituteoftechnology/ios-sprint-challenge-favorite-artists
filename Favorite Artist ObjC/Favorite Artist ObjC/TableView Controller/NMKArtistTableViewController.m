//
//  NMKArtistTableViewController.m
//  Favorite Artist ObjC
//
//  Created by Niranjan Kumar on 1/24/20.
//  Copyright © 2020 Nar Kumar. All rights reserved.
//

#import "NMKArtistTableViewController.h"
#import "NMKArtist.h"
#import "NMKArtistController.h"
#import "NMKArtistDetailViewController.h"

@interface NMKArtistTableViewController ()

@end

@implementation NMKArtistTableViewController

- (instancetype)initWithCoder:(NSCoder *)coder { // the @synthesizer to set the property's value
    self = [super initWithCoder:coder];
    if (self) {
        _artistController = [[NMKArtistController alloc] init];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.artistController loadArtist];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.tableView reloadData];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.artistController.artists.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ArtistCell" forIndexPath:indexPath];
    
    NMKArtist *artist = [self.artistController.artists objectAtIndex:indexPath.row];
    cell.textLabel.text = artist.artist; // change variable name to "name"
    cell.detailTextLabel.text = [NSString stringWithFormat:@"Formed in %i", artist.yearFormed];
    
    return cell;
}



#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"DetailArtistSegue"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        NMKArtistDetailViewController *detailVC = segue.destinationViewController;
        detailVC.artistController = self.artistController;
        detailVC.artist = self.artistController.artists[indexPath.row];
    } else {
        if ([segue.identifier isEqualToString:@"SearchArtistSegue"]) {
            NMKArtistDetailViewController *detailVC = segue.destinationViewController;
            detailVC.artistController = self.artistController;
            }
        }
}
    
@end
