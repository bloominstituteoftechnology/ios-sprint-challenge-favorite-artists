//
//  ArtistListTableViewController.m
//  FavoriteArtists
//
//  Created by Lambda_School_Loaner_268 on 5/18/20.
//  Copyright © 2020 Lambda. All rights reserved.
//

#import "MSKArtistListTableViewController.h"
#import "MSKArtistDetailViewController.h"
#import "MSKArtistController.h"

@interface MSKArtistListTableViewController () <UITableViewDataSource>
@end
@implementation MSKArtistListTableViewController
-(instancetype)initWithCoder:(NSCoder *)coder {
    self = [super initWithCoder:coder];
    if (self) {
        _controller = [[MSKArtistController alloc] init];
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.controller loadArtistsFromPersistence:^(NSError *_Nullable error) {
        if (error) {
            NSLog(@"Error loading from persistence!");
            return;
        }
        ;
    }];
    [self.tableView reloadData];
}
-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.tableView reloadData];
}
#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.controller.artists.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"artistCell"
                                                            forIndexPath:indexPath];
    NSDictionary *artistDict = self.controller.artists[indexPath.row];
    MSKArtist *artist = [[MSKArtist alloc] initFromDict:artistDict];
    
    cell.textLabel.text = artist.artistName;
    cell.detailTextLabel.text = [NSString stringWithFormat:@"Formed in %i", artist.yearFormed];
    return cell;
}

-(void) tableView:(UITableView *)tableView
commitEditingStyle:(UITableViewCellEditingStyle)editingStyle
forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
            //remove the deleted object from your data source.
            //If your data source is an NSMutableArray, do this
        NSUInteger it = (NSUInteger)indexPath.row;
        [self.controller removeArtistFromAppAtIndex: &it];
        [tableView reloadData]; // tell table to refresh now
    }
}
#pragma mark - Navigation
// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"detailSegue"]) {
        MSKArtistDetailViewController *detailVC = [segue destinationViewController];
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        NSDictionary *artistDict = self.controller.artists[indexPath.row];
        MSKArtist *artist =  [[MSKArtist alloc] initFromDict:artistDict];
        detailVC.controller = self.controller;
        detailVC.artist = artist;
        
    } else  {
        if ([segue.identifier isEqualToString:@"searchSegue"]) {
           MSKArtistDetailViewController *searchArtist = segue.destinationViewController;
            searchArtist.controller = self.controller;

        }
    }
}
@end
