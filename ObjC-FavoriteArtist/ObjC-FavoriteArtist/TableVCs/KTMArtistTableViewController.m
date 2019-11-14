//
//  KTMArtistTableViewController.m
//  ObjC-FavoriteArtist
//
//  Created by Kobe McKee on 7/19/19.
//  Copyright © 2019 Kobe McKee. All rights reserved.
//

#import "KTMArtistTableViewController.h"
#import "KTMArtistController.h"
#import "KTMArtistDetailViewController.h"
#import "KTMArtistSearchViewController.h"


@interface KTMArtistTableViewController ()
@property KTMArtistController *artistController;
@property NSMutableArray *artistArray;
@property KTMArtist *artist;
@end

@implementation KTMArtistTableViewController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:YES];
    if (!self.artistController) {
        self.artistController = [[KTMArtistController alloc] init];
        self.artist = [[KTMArtist alloc] init];
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
    KTMArtist *artist = self.artistArray[indexPath.row];
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
        KTMArtistDetailViewController *destinationVC = segue.destinationViewController;
        destinationVC.artist = self.artist;
    } else if ([segue.identifier isEqualToString:@"SearchArtistSegue"]) {
        KTMArtistSearchViewController *destinationVC = segue.destinationViewController;
        destinationVC.artistController = self.artistController;
    }
}


@end
