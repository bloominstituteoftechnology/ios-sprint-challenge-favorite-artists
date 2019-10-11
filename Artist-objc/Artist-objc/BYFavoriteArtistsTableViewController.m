//
//  BYFavoriteArtistsTableViewController.m
//  Artist-objc
//
//  Created by Bradley Yin on 10/11/19.
//  Copyright © 2019 bradleyyin. All rights reserved.
//

#import "BYFavoriteArtistsTableViewController.h"
#import "BYArtistController.h"
#import "BYArtist.h"
#import "BYArtistViewController.h"

@interface BYFavoriteArtistsTableViewController ()

@property BYArtistController *controller;

@end

@implementation BYFavoriteArtistsTableViewController

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        _controller = [[BYArtistController alloc] init];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.tableView reloadData];
}

#pragma mark - Table view data source


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    return [self.controller.artists count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ArtistCell" forIndexPath:indexPath];
    BYArtist *artist = self.controller.artists[indexPath.row];
    cell.textLabel.text = artist.name;
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%d", artist.year];
    
    return cell;
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if([segue.identifier isEqual: @"AddArtistShowSegue"]) {
        BYArtistViewController *detailVC = segue.destinationViewController;
        detailVC.controller = self.controller;
        
    } else if([segue.identifier isEqual: @"ArtistDetailShowSegue"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        BYArtistViewController *detailVC = segue.destinationViewController;
        detailVC.controller = self.controller;
        detailVC.artist = self.controller.artists[indexPath.row];
    }
    
        
}


@end
