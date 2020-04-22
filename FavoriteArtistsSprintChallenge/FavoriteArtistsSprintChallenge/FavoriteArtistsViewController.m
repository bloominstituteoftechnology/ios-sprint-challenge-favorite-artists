//
//  FavoriteArtistsViewController.m
//  FavoriteArtistsSprintChallenge
//
//  Created by Dillon P on 4/19/20.
//  Copyright © 2020 Dillon's Lambda Team. All rights reserved.
//

#import "FavoriteArtistsViewController.h"
#import "Artist.h"
#import "ArtistFetcher.h"
#import "SearchArtistsViewController.h"

@interface FavoriteArtistsViewController () <UITableViewDataSource, UITableViewDelegate>

// Properties

// IBOutlets
@property (nonatomic) IBOutlet UITableView *tableView;

// Private Methods

@end

@implementation FavoriteArtistsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    ArtistFetcher *fetcher = [[ArtistFetcher alloc] init];
    self.artistFetcher = fetcher;
    [self.artistFetcher createOrLoadArtistDictionary];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.tableView reloadData];
}



#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    if ([segue.identifier isEqualToString:@"ShowArtistDetailSegue"]) {
        SearchArtistsViewController *artistDetailVC = segue.destinationViewController;
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        artistDetailVC.artistDetail = self.artistFetcher.allArtists[indexPath.row];
        artistDetailVC.artistFetcher = self.artistFetcher;
        artistDetailVC.title = artistDetailVC.artistDetail.artistName;
    } else if ([segue.identifier isEqualToString:@"AddNewArtistSegue"]) {
        SearchArtistsViewController *artistDetailVC = segue.destinationViewController;
        artistDetailVC.artistFetcher = self.artistFetcher;
    }
}



// MARK: - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.artistFetcher.allArtists.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ArtistCell" forIndexPath:indexPath];
    
    Artist *artist = [self.artistFetcher.allArtists objectAtIndex:indexPath.row];
    
    cell.textLabel.text = artist.artistName;
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%d", artist.yearFounded];
    
    return cell;
}

// MARK: - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self performSegueWithIdentifier:@"ShowArtistDetailSegue" sender:self];
}

@end
