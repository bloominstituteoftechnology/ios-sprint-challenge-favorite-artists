//
//  CCCArtistTableViewController.m
//  ios-sprint-challenge-favorite-artists
//
//  Created by Jonalynn Masters on 1/24/20.
//  Copyright © 2020 Jonalynn Masters. All rights reserved.
//

#import "CCCArtistTableViewController.h"
#import "CCCArtistController.h"
#import "CCCArtistDetailViewController.h"
#import "CCCArtistSearchViewController.h"


@interface CCCArtistTableViewController ()
@property CCCArtistController *artistController;
@property NSMutableArray *artistArray;
@property CCCArtist *artist;
@end

@implementation CCCArtistTableViewController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:YES];
    if (!self.artistController) {
        self.artistController = [[CCCArtistController alloc] init];
        self.artist = [[CCCArtist alloc] init];
    }
    [self.artistArray removeAllObjects];
    self.artistArray = [self.artistController fetchAllSavedArtists];
    NSLog(@"%lu", (unsigned long)self.artistArray.count);
    [self.tableView reloadData];
}


- (void)viewDidLoad {
    [super viewDidLoad];
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.artistArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ArtistCell" forIndexPath:indexPath];
    CCCArtist *artist = self.artistArray[indexPath.row];
    cell.textLabel.text = artist.name;
    NSString *yearFormed = [NSString stringWithFormat:@"Formed in %d", artist.yearFormed];
    cell.detailTextLabel.text = yearFormed;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    self.artist = [self.artistArray objectAtIndex:indexPath.row];
    NSLog(@"Perform segue");
    [self performSegueWithIdentifier:@"ArtistDetailSegue" sender:self];
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"ArtistDetailSegue"]) {
        CCCArtistDetailViewController *destinationVC = segue.destinationViewController;
        destinationVC.artist = self.artist;
    } else if ([segue.identifier isEqualToString:@"SearchArtistSegue"]) {
        CCCArtistSearchViewController *destinationVC = segue.destinationViewController;
        destinationVC.artistController = self.artistController;
    }
}


@end
