//
//  IGFFavoriteArtistTableViewController.m
//  IGFArtist
//
//  Created by Ian French on 9/27/20.
//

#import "IGFFavoriteArtistTableViewController.h"
#import "IGFArtistController.h"
#import "IGFArtist.h"
#import "IGFAddArtistViewController.h"
#import "IGFArtistDetailViewController.h"

@interface IGFFavoriteArtistTableViewController ()

@property (nonatomic, readonly) IGFArtistController *artistController;

@end

@implementation IGFFavoriteArtistTableViewController


- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        _artistController = [[IGFArtistController alloc] init];
    }
    return self;
}

static NSString * const reuseIdentifier = @"artistCell";

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.tableView reloadData];

}
- (void)viewDidLoad {


    [super viewDidLoad];
// Come back to later to try and get an image to show up behind tableview as non-scrolling background image


    //1.set backgroundColor property of tableView to clearColor, so that background image is visible
       [self.tableView setBackgroundColor:[UIColor clearColor]];

       //2.create an UIImageView that you want to appear behind the table
       UIImageView *tableBackgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"stones"]];

       //3.set the UIImageView’s frame to the same size of the tableView
       [tableBackgroundView setFrame: self.tableView.frame];

       //4.update tableView’s backgroundImage to the new UIImageView object
       [self.tableView setBackgroundView:tableBackgroundView];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.artistController.artists.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseIdentifier forIndexPath:indexPath];

    IGFArtist *artist = self.artistController.artists[indexPath.row];
    cell.textLabel.text = artist.name;
    cell.detailTextLabel.text = [NSString stringWithFormat:@"Formed: %@", [artist formedYearString]];

    return cell;
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqual:@"artistDetailSegue"]) {
        IGFArtistDetailViewController *destinationVC = [segue destinationViewController];
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        destinationVC.artist = self.artistController.artists[indexPath.row];

    } else if ([[segue identifier] isEqual:@"addArtistSegue"]){
        IGFAddArtistViewController *destinationVC = [segue destinationViewController];
        destinationVC.artistController = self.artistController;
    }
}

@end
