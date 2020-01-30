//
//  PNCFavoriteArtistsTableViewController.m
//  Favorite Artist3
//
//  Created by Lambda_School_Loaner_263 on 1/28/20.
//  Copyright © 2020 Lamdba School. All rights reserved.
//

#import "PNCArtist.h"
#import "PNCArtistController.h"
#import "PNCArtistViewController.h"
#import "PNCFavoriteArtistsTableViewController.h"

@interface PNCFavoriteArtistsTableViewController ()

@property PNCArtistController *controller;

@end

@implementation PNCFavoriteArtistsTableViewController

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        _controller = [[PNCArtistController alloc] init];
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

    return [self.controller.artists count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ArtistCell" forIndexPath:indexPath];
    
   PNCArtist *artist = self.controller.artists[indexPath.row];
    cell.textLabel.text = artist.name;
    //cell.detailTextLabel.text = [NSString stringWithFormat:@"%d", artist.year];
    
    if (artist.year == 0) {
        cell.detailTextLabel.text = @"unknown formed year";
    } else {
        cell.detailTextLabel.text = [NSString stringWithFormat:@"%d", artist.year];
    }
    
    return cell;
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
   
    if([segue.identifier isEqual: @"SearchArtistSegue"]) {
            PNCArtistViewController *detailVC = segue.destinationViewController;
            detailVC.controller = self.controller;

        } else if([segue.identifier isEqual: @"ShowArtistDetailSegue"]) {
            NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
            PNCArtistViewController *detailVC = segue.destinationViewController;
            detailVC.controller = self.controller;
            detailVC.artist = self.controller.artists[indexPath.row];
        }
}


@end
