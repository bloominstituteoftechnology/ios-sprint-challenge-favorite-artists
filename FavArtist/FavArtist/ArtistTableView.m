//
//  ArtistTableView.m
//  FavArtist
//
//  Created by Norlan Tibanear on 1/27/21.
//

#import "ArtistTableView.h"
#import "ArtistController.h"
#import "Artist.h"
#import "DetailVC.h"


@interface ArtistTableView ()

//@property (nonatomic) ArtistController *artistController;

@end

@implementation ArtistTableView

- (void)viewDidLoad {
    [super viewDidLoad];
    _artistController = [[ArtistController alloc] init];
    [self.artistController loadFromPersistentStore];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.tableView reloadData];
}

// TableView

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return  self.artistController.saveArtists.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    Artist *artist = self.artistController.saveArtists[indexPath.row];
    cell.textLabel.text = artist.artistName;
    
    if (artist.formedYear) {
        cell.detailTextLabel.text = [NSString stringWithFormat:@"Formed %d", artist.formedYear];
    } else {
        cell.detailTextLabel.text = @"Formed not found";
    }
    
    return  cell;
}//


//- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
//
//}//

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
   
    if ([segue.identifier isEqualToString:@"openArtistDetailVCSegue"]) {
        DetailVC *detailVC = (DetailVC *)segue.destinationViewController;
        
        detailVC.artistController = _artistController;
        detailVC.artist = [_artistController.saveArtists objectAtIndex:[self.tableView indexPathForSelectedRow].row];
        
    } else if ([segue.identifier isEqualToString:@"gotoDetailVCSegue"]) {
        DetailVC *detailVC = (DetailVC *)segue.destinationViewController;
        detailVC.artistController = _artistController;
    }
    
}//



@end
