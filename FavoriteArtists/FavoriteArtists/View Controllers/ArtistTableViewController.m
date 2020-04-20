//
//  ArtistTableViewController.m
//  FavoriteArtists
//
//  Created by Chris Gonzales on 4/17/20.
//  Copyright © 2020 Chris Gonzales. All rights reserved.
//

#import "ArtistTableViewController.h"
#import "CDGArtist.h"
#import "CDGArtistController.h"
#import "ArtistDetailViewController.h"

@interface ArtistTableViewController ()

@property (nonatomic, readonly) CDGArtistController *artistController;

@end

@implementation ArtistTableViewController

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        _artistController = [[CDGArtistController alloc] init];
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    if (_artistController.artistsArray){
    [self.tableView reloadData];
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSArray *loadedArtists = [self.artistController loadFavoriteArtists];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.artistController.artistsArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ArtistCell" forIndexPath:indexPath];
    
    CDGArtist *artist = self.artistController.artistsArray[indexPath.row];
    cell.textLabel.text = artist.artist;
    cell.detailTextLabel.text = [NSString stringWithFormat:@"Formed in: %ld", (long)artist.formedYear];
 
    
    return cell;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([[segue identifier] isEqualToString:@"AddArtistSegue"])
       {
           ArtistDetailViewController *detailVC = (ArtistDetailViewController *)[segue destinationViewController];
           
           detailVC.artistController = self.artistController;
       }
       
       if ([[segue identifier] isEqualToString:@"DetailViewSegue"])
       {
           ArtistDetailViewController *detailVC = (ArtistDetailViewController *)[segue destinationViewController];
           NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
                    detailVC.artistController = self.artistController;
           detailVC.artist = self.artistController.artistsArray[indexPath.row];
       }
}
@end
