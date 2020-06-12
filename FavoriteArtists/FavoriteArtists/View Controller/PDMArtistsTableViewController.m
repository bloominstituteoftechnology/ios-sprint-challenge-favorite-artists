//
//  PDMArtistsTableViewController.m
//  FavoriteArtists
//
//  Created by Patrick Millet on 6/12/20.
//  Copyright © 2020 PatrickMillet79. All rights reserved.
//

#import "PDMArtistsTableViewController.h"
#import "PDMArtistController.h"
#import "PDMArtist.h"
#import "PDMArtistDetailViewController.h"

@interface PDMArtistsTableViewController ()

@property (nonatomic, copy, readonly) PDMArtistController *artistController;

@end

@implementation PDMArtistsTableViewController

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        _artistController = [[PDMArtistController alloc] init];
    }
    return self;
}

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        _artistController = [[PDMArtistController alloc] init];
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.tableView reloadData];
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.artistController.artists.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ArtistCell" forIndexPath:indexPath];
    
    PDMArtist *artist = self.artistController.artists[indexPath.row];
    
    cell.textLabel.text = artist.name;
    
    if (artist.yearFormed == PDM_Artist_UnknownYear) {
        cell.detailTextLabel.text = @"";
    } else {
        cell.detailTextLabel.text = [NSString stringWithFormat:@"Formed in %ld", artist.yearFormed];
    }
    
    return cell;
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"ViewArtistShowSegue"]) {
        PDMArtistDetailViewController *destinationVC = (PDMArtistDetailViewController *)[segue destinationViewController];
        
        NSIndexPath *indexPath = self.tableView.indexPathForSelectedRow;
        PDMArtist *artist = self.artistController.artists[indexPath.row];
        
        destinationVC.artist = artist;
        destinationVC.artistController = self.artistController;
        
    } else if ([segue.identifier isEqualToString:@"AddArtistShowSegue"]) {
        PDMArtistDetailViewController *destinationVC = (PDMArtistDetailViewController *)[segue destinationViewController];
        destinationVC.artistController = self.artistController;
    }
}

@end
