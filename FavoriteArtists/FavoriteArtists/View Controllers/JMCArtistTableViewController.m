//
//  JMCArtistTableViewController.m
//  FavoriteArtists
//
//  Created by Jarren Campos on 8/3/20.
//  Copyright © 2020 Jarren Campos. All rights reserved.
//

#import "JMCArtistTableViewController.h"
#import "JMCDetailViewController.h"

@interface JMCArtistTableViewController ()

@property (nonatomic) NSMutableArray *artists;

@end

@implementation JMCArtistTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

-(void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self.tableView reloadData];
}

- (IBAction)unwindToMainVC:(UIStoryboardSegue *)unwindSegue{};

#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _artists.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"artistCell" forIndexPath:indexPath];
    JMCArtist *artist = _artists[indexPath.row];
    [cell.textLabel setText:artist.name];
    [cell.detailTextLabel setText:[NSString stringWithFormat:@"Formed in: %d", artist.yearFormed]];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [_artists removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier  isEqual: @"ShowSegue"]) {
        JMCDetailViewController *vc = [segue destinationViewController];
        long index = [self.tableView indexPathForSelectedRow].row;
        vc.artist = self.artists[index];
    }
}


@end
