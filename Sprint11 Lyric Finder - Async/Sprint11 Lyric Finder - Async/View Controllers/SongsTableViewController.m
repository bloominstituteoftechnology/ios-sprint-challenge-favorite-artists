//
//  SongsTableViewController.m
//  

#import "SongsTableViewController.h"
#import "ALWSongController.h"
#import "ALWSong.h"
#import "SongDetailViewController.h"

@interface SongsTableViewController ()

@property (nonatomic, readonly) ALWSongController *songController; // = ALWSongController() in SWIFT

@end

@implementation SongsTableViewController

#pragma mark - Properties

// Synthesize the property (instance variable) b/c we've created the getter
@synthesize songController = _songController;

// Lazy Instantiation
- (ALWSongController *)songController {
    // If it's the first time called, create one
    if (_songController == nil) {
        _songController = [[ALWSongController alloc] init];
    }
    // If already have one, return it
    return _songController;
}

- (void)viewDidLoad {
    [super viewDidLoad];

}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [[self tableView] reloadData];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.songController.savedSongs.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SongCell" forIndexPath:indexPath];
    
    // Get the song to be displayed
    ALWSong *song = self.songController.savedSongs[indexPath.row];

    //cell.textLabel.text = [[[self songController] savedSongs] objectAtIndex:indexPath.row];
    
    // Configure the cell...
    cell.textLabel.text = song.title;
    cell.detailTextLabel.text = song.artist;
    
    return cell;
}

#pragma mark - Navigation


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    // Editing
    if ([segue.identifier isEqualToString:@"showSongSegue"]) {
        
        // Get the new view controller
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        SongDetailViewController *detailVC = segue.destinationViewController;
        
        // Pass the selected object to the new view controller
        detailVC.songController = self.songController;
        detailVC.song = self.songController.savedSongs[indexPath.row];
    }
    // Creating
    if ([segue.identifier isEqualToString:@"addSongSegue"]) {
        SongDetailViewController *detailVC = segue.destinationViewController;
        detailVC.songController = self.songController;
    }
}


@end
