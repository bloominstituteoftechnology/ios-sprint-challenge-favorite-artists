//
//  ArtistsViewController.m
//  Favorite Artists
//
//  Created by Vincent Hoang on 7/17/20.
//  Copyright © 2020 Vincent Hoang. All rights reserved.
//

#import "ArtistsViewController.h"
#import "Artist.h"
#import "ArtistController.h"
#import "ArtistDetailViewController.h"

@interface ArtistsViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic) NSMutableArray<Artist *> *artistsArray;
@property (nonatomic, strong) ArtistController *controller;

@end

@implementation ArtistsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.controller = [ArtistController alloc];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    self.artistsArray = [self.controller loadSavedArtists];
    NSLog(@"%@", self.artistsArray);
    [self.tableView reloadData];
}

- (UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"viewCell"
                                                            forIndexPath:indexPath];
    
    Artist *selectedArtist = self.artistsArray[indexPath.row];
    cell.textLabel.text = selectedArtist.name;
    cell.detailTextLabel.text = [NSString stringWithFormat:@"Formed in %d", selectedArtist.formed];
    
    return cell;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"detailView"]) {
        ArtistDetailViewController *destinationVC = [segue destinationViewController];
        
        NSIndexPath *indexPath = [self.tableView indexPathForCell:sender];
        
        destinationVC.artist = [self.artistsArray objectAtIndex:indexPath.row];
        destinationVC.controller = self.controller;
    }
    
    if ([[segue identifier] isEqualToString:@"addSegue"]) {
        ArtistDetailViewController *destinationVC = [segue destinationViewController];

        destinationVC.controller = self.controller;
    }
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.artistsArray count];
}

@end
