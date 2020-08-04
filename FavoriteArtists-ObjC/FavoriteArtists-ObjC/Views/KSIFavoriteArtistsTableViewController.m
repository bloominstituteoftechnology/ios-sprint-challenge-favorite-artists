//
//  KSIFavoriteArtistsTableViewController.m
//  FavoriteArtists-ObjC
//
//  Created by Kevin Stewart on 7/31/20.
//  Copyright © 2020 Kevin Stewart. All rights reserved.
//

#import "KSIFavoriteArtistsTableViewController.h"
#import "KSIArtistController.h"
#import "KSIArtist.h"
#import "KSISearchForArtistViewController.h"
#import "KSIArtistDetailViewController.h"

@interface KSIFavoriteArtistsTableViewController ()

@end

@implementation KSIFavoriteArtistsTableViewController

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        _ksiArtistController = [[KSIArtistController alloc] init];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.ksiArtistController = [[KSIArtistController alloc]init];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.ksiArtistController artists];
    [self.tableView reloadData];
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSLog(@"Artist count: %lu", (unsigned long)self.ksiArtistController.artistCount);
    return self.ksiArtistController.artistCount;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ArtistCell" forIndexPath:indexPath];
    
    KSIArtist *artist = self.ksiArtistController.artists[indexPath.row];
    NSLog(@"Artist: %@", artist);
    cell.textLabel.text = artist.name;
    
    return cell;
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([segue.identifier isEqualToString:@"SearchNewArtistsSegue"]) {
        KSISearchForArtistViewController *detailVC = segue.destinationViewController;
        detailVC.ksiArtistController = self.ksiArtistController;
            } else if ([segue.identifier isEqualToString:@"ArtistsDetailSegue"])
            {
                NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
                KSIArtist *artist = self.ksiArtistController.artists[indexPath.row];
                detailVC.ksiArt = artist;
    }
}


@end
