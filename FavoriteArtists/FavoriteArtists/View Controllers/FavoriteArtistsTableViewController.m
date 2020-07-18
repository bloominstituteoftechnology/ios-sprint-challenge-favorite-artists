//
//  FavoriteArtistsTableViewController.m
//  FavoriteArtists
//
//  Created by Cody Morley on 7/17/20.
//  Copyright © 2020 Cody Morley. All rights reserved.
//

#import "FavoriteArtistsTableViewController.h"
#import "CAMArtistController.h"
#import "CAMArtist.h"
#import "AddArtistViewController.h"
#import "ArtistDetailViewController.h"

@interface FavoriteArtistsTableViewController ()
@end

@implementation FavoriteArtistsTableViewController
//MARK: - Life Cycles -
- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        _controller = [[CAMArtistController alloc] init];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.controller loadArtists];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear: YES];
    [self.tableView reloadData];
}


//MARK: - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.controller.favoriteArtists.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ArtistCell" forIndexPath:indexPath];
    
    CAMArtist *artist = self.controller.favoriteArtists[indexPath.row];
    cell.textLabel.text = artist.name;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView
commitEditingStyle:(UITableViewCellEditingStyle)editingStyle
forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        
        CAMArtist *artist = self.controller.favoriteArtists[indexPath.row];
        [self.controller deleteArtist: artist];
        [tableView deleteRowsAtIndexPaths:@[indexPath]
                         withRowAnimation:UITableViewRowAnimationFade];
    }
}


//MARK: - Navigation -
- (void)prepareForSegue:(UIStoryboardSegue *)segue
                 sender:(id)sender
{
    NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
    
    if ([segue.identifier isEqualToString: @"AddArtistSegue"]) {
        AddArtistViewController *addVC = segue.destinationViewController;
        addVC.controller = self.controller;
    }
    
    if ([segue.identifier isEqualToString: @"ArtistDetailSegue"]) {
        ArtistDetailViewController *detailVC = segue.destinationViewController;
        CAMArtist *artist = self.controller.favoriteArtists[indexPath.row];
        detailVC.artist = artist;
    }
}
@end
