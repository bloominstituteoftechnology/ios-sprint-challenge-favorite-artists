//
//  WAHArtistTableViewController.m
//  Favorite Artists
//
//  Created by Wyatt Harrell on 5/15/20.
//  Copyright © 2020 Wyatt Harrell. All rights reserved.
//

#import "WAHArtistTableViewController.h"
#import "WAHArtistController.h"

@interface WAHArtistTableViewController ()

@property (nonatomic) WAHArtistController *artistController;



@end

@implementation WAHArtistTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.artistController fetchArtistWithName:@"macklemore" completionBlock:^(WAHArtist * _Nullable artist, NSError * _Nullable error) {
        if (error) {
            NSLog(@"Fetching Error: %@", error);
            return;
        }
        
        NSLog(@"Fetched artist: %@", artist);
    
    }];
    
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Incomplete implementation, return the number of sections
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 0;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ArtistCell" forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (WAHArtistController *)artistController {
    if (!_artistController) {
        _artistController = [[WAHArtistController alloc] init];
    }
    return _artistController;
}

@end
