//
//  ArtistsViewController.m
//  Favorite Artists
//
//  Created by Vincent Hoang on 7/17/20.
//  Copyright © 2020 Vincent Hoang. All rights reserved.
//

#import "ArtistsViewController.h"
#import "Artist.h"

@interface ArtistsViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic) NSArray<Artist *> *artistsArray;

@end

@implementation ArtistsViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.tableView.delegate = self;
}

- (UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"viewCell"
                                                            forIndexPath:indexPath];
    
    Artist *selectedArtist = self.artistsArray[indexPath.row];
    cell.textLabel.text = selectedArtist.name;
    cell.detailTextLabel.text = [NSString stringWithFormat:@"Formed in %d", selectedArtist.formed];
    
    return cell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.artistsArray count];
}

@end
