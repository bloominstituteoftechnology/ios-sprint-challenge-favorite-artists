//
//  CBDArtistsTableViewController.m
//  FavoriteArtist
//
//  Created by Christopher Devito on 5/15/20.
//  Copyright © 2020 Christopher Devito. All rights reserved.
//

#import "CBDArtistsTableViewController.h"
#import "CBDArtistFetcher.h"
#import "CBDArtist.h"
#import "CBDDetailViewController.h"

@interface CBDArtistsTableViewController ()

//MARK: - Private Properties
@property (nonatomic) NSMutableArray *artists;

@end

@implementation CBDArtistsTableViewController

// MARK: - Properties

- (CBDArtistFetcher *)fetcher {
    if (!_fetcher) {
        _fetcher = [[CBDArtistFetcher alloc] initWithArtists:[NSMutableArray new]];
    }
    return _fetcher;
}


// MARK: - View Methods
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.fetcher fetchArtistWithName:@"newsboys" completionBlock:^(CBDArtist * _Nullable artist, NSError * _Nullable error) {
        if (error) {
            NSLog(@"Error fetching artist");
            return;
        }
        NSLog(@"Artist: %@", artist.strArtist);
        dispatch_async(dispatch_get_main_queue(), ^{
            [self updateViews];
        });
    }];
    
}

-(void)updateViews {
    [self.tableView reloadData];
}

//MARK: - IBActions
- (IBAction)addNewArtist:(id)sender {
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.fetcher.artists.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ArtistCell" forIndexPath:indexPath];
    CBDArtist *artist = self.fetcher.artists[indexPath.row];
    cell.textLabel.text = artist.strArtist;
    NSString *detail = [NSString stringWithFormat:@"Formed in %d", artist.yearFormed];
    cell.detailTextLabel.text = detail;

    return cell;
}

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

// MARK: - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"AddArtistSegue"]) {
        CBDDetailViewController *addArtistVC = [segue destinationViewController];
        addArtistVC.fetcher = self.fetcher;
    } else if ([[segue identifier] isEqualToString:@"ArtistDetailSegue"]) {
        CBDDetailViewController *detailVC = [segue destinationViewController];
        detailVC.fetcher = self.fetcher;
        NSIndexPath *index = [self.tableView indexPathForSelectedRow];
        detailVC.artist = self.fetcher.artists[index.row];
        
    }
}

- (IBAction)unwindSegue:(UIStoryboardSegue *)segue {
    [self updateViews];
}


@end
