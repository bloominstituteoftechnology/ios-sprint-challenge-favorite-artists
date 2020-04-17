//
//  KMLArtistTableViewController.m
//  FavoriteArtists
//
//  Created by Keri Levesque on 4/17/20.
//  Copyright © 2020 Keri Levesque. All rights reserved.
//

#import "KMLArtistTableViewController.h"
#import "KMLArtistController.h"
#import "KMLArtist.h"
#import "KMLArtistDetailViewController.h"
#import "KMLArtistSearchViewController.h"


@interface KMLArtistTableViewController ()

@property (nonatomic, readonly) KMLArtistController *artistController;

@end

@implementation KMLArtistTableViewController

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        _artistController = [[KMLArtistController alloc] init];
    }
    return self;
}

static NSString * const reuseIdentifier = @"ArtistCell";

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.tableView reloadData];
}

- (void)viewDidLoad {
    [super viewDidLoad];
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.artistController.artists.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseIdentifier forIndexPath:indexPath];

    KMLArtist *artist = self.artistController.artists[indexPath.row];
    cell.textLabel.text = artist.name;
    cell.detailTextLabel.text = [NSString stringWithFormat:@"Formed in: %@", [artist formedYearString]];
    
    return cell;
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqual:@"artistDetailSegue"]) {
        KMLArtistDetailViewController *destinationVC = [segue destinationViewController];
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        destinationVC.artist = self.artistController.artists[indexPath.row];
    } else if ([[segue identifier] isEqual:@"addFavoriteArtistSegue"]){
        KMLArtistSearchViewController *destinationVC = [segue destinationViewController];
        destinationVC.artistController = self.artistController;
    }
}

@end
