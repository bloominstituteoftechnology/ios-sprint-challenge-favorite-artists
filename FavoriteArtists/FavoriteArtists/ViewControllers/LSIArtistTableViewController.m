//
//  LSIArtistTableViewController.m
//  FavoriteArtists
//
//  Created by Luqmaan Khan on 10/11/19.
//  Copyright © 2019 Luqmaan Khan. All rights reserved.
//

#import "LSIArtistTableViewController.h"
#import "LSIArtistDetailViewController.h"
#import "LSIArtist.h"
#import "LSIArtistController.h"

@interface LSIArtistTableViewController ()

@end

@implementation LSIArtistTableViewController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.tableView reloadData];
}


-(LSIArtistController *)controller {
    if (_controller) {
        return _controller;
    } else {
        _controller = [[LSIArtistController alloc] init];
        return _controller;
    }
}



#pragma mark - Table view data source


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 0;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ArtistCell" forIndexPath:indexPath];
    
    return cell;
}



- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 
}


@end
