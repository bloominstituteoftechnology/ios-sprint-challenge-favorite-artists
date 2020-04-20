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

@interface FavoriteArtistsViewController () <UITableViewDataSource, UITableViewDelegate>

// Properties

// IBOutlets
@property (nonatomic) IBOutlet UITableView *tableView;

// Private Methods

@end

@implementation FavoriteArtistsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    ArtistFetcher *fetcher = [[ArtistFetcher alloc] init];
    
    [fetcher fetchArtist:@"macklemore" WithCompletionHandler:^(Artist * _Nullable artist, NSError * _Nullable error) {
        // Just testing whether url is built correctly
    }];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


// MARK: - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ArtistCell" forIndexPath:indexPath];
    
    return cell;
}

// MARK: - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}

@end
