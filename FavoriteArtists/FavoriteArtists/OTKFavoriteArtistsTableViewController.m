//
//  OTKFavoriteArtistsTableViewController.m
//  FavoriteArtists
//
//  Created by Tobi Kuyoro on 15/05/2020.
//  Copyright © 2020 Tobi Kuyoro. All rights reserved.
//

#import "OTKFavoriteArtistsTableViewController.h"
#import "OTKArtist.h"
#import "OTKArtistController.h"
#import "OTKSearchArtistViewController.h"

@interface OTKFavoriteArtistsTableViewController ()

@property (nonatomic) OTKArtistController *artistController;

@end

@implementation OTKFavoriteArtistsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        _artistController = [[OTKArtistController alloc] init];
    }
    return self;
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
    
    OTKArtist *artist = self.artistController.artists[indexPath.row];
    cell.textLabel.text = artist.name;
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%i", artist.yearFormed];
    
    return cell;
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"AddArtistSegue"]) {
        OTKSearchArtistViewController *destinationVC = segue.destinationViewController;
        destinationVC.artistController = self.artistController;
    } else if ([segue.identifier isEqualToString:@"ShowArtistDetailSegue"]) {
        OTKSearchArtistViewController *destinationVC = segue.destinationViewController;
        destinationVC.artistController = self.artistController;
    }
}

@end
