//
//  JDFArtistsTableViewController.m
//  Favorite Artists
//
//  Created by Jonathan Ferrer on 7/19/19.
//  Copyright © 2019 Jonathan Ferrer. All rights reserved.
//

#import "JDFArtistsTableViewController.h"
#import "JDFArtist.h"
#import "JDFArtistDetailViewController.h"

@interface JDFArtistsTableViewController ()

- (NSMutableArray *)fetchFromPersistentStore;
@property (nonatomic) NSMutableArray *_Nullable artists;

@end

@implementation JDFArtistsTableViewController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.artists = [self fetchFromPersistentStore];
    [[self tableView] reloadData];
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.artists.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ArtistCell" forIndexPath:indexPath];
    
    JDFArtist *artist = [self artists][indexPath.row];
    cell.textLabel.text = artist.name;
    NSNumber *yearNumber = [[NSNumber alloc] initWithInt:artist.yearFormed];
    cell.detailTextLabel.text = [yearNumber stringValue];

    return cell;
}


#pragma mark - Functions

-(NSMutableArray *)fetchFromPersistentStore {
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSURL *documentsDirectory =  [fileManager URLForDirectory:NSDocumentDirectory inDomain:NSUserDomainMask appropriateForURL:nil create:YES error:nil];
    NSURL *path = [[documentsDirectory URLByAppendingPathComponent:@"artists"] URLByAppendingPathExtension:@"json"];
    NSData *artistsData = [[NSData alloc] initWithContentsOfURL:path];

    if (artistsData) {
        NSDictionary *artistDictionaries = [NSJSONSerialization JSONObjectWithData:artistsData options:0 error:nil];
        NSDictionary *artistsDictionary = artistDictionaries[@"artists"];

        NSMutableArray *artists = [[[NSMutableArray alloc] init] mutableCopy];

        for (NSDictionary *artistDict in artistsDictionary) {
            NSArray *array = [[NSArray alloc] initWithObjects:artistDict, nil];
            NSDictionary *dict = [[NSDictionary alloc] initWithObjectsAndKeys:array, @"artists", nil];

            JDFArtist *artist = [[JDFArtist alloc] initWithDictionary:dict];
            [artists addObject:artist];
        }

        return artists;
    } else {
        return [[NSMutableArray alloc] init];
    }
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([[segue identifier] isEqualToString:@"AddArtist"]) {
        JDFArtistDetailViewController *detailViewController = [segue destinationViewController];
        detailViewController.artists = self.artists;

    }

    if ([[segue identifier] isEqualToString:@"ShowArtist"]) {
        JDFArtistDetailViewController *detailViewController = [segue destinationViewController];
        NSIndexPath *index = [[self tableView] indexPathForSelectedRow];
        JDFArtist *artist = [self artists][index.row];
        detailViewController.artist = artist;
    }
}

@end
