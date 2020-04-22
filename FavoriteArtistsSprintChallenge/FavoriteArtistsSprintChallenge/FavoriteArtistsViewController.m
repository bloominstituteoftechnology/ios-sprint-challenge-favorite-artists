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
    
    NSFileManager *fileManager = [NSFileManager new];
    NSError *error = nil;
    NSURL *docsURL = [fileManager URLForDirectory:NSDocumentDirectory
                                         inDomain:NSUserDomainMask
                                appropriateForURL:nil
                                           create:YES
                                            error:&error];
    if (!error) {
        NSURL *artistDictionaryURL = [docsURL URLByAppendingPathComponent:@"Artists"];
        NSLog(@"%@", artistDictionaryURL);
        
//        if (![fileManager fileExistsAtPath:artistDictionaryURL.path]) {
            [fileManager createDirectoryAtURL:artistDictionaryURL withIntermediateDirectories:YES attributes:nil error:&error];
            if (!error) {
                [self writeToURL:artistDictionaryURL error:&error];
//                NSLog(@"%@", self.artistDictionary);
            }
            if (error) {
                NSLog(@"Error: %@, writing dictionary to path: %@", error, artistDictionaryURL);
            }
            
//        }
//        else {
//            NSDictionary *dictionary = [NSDictionary dictionaryWithContentsOfURL:artistDictionaryURL error:&error];
//            NSLog(@"%@", dictionary);
//        }
    }
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self.tableView reloadData];
}


// MARK: - Methods

- (BOOL)writeToURL:(NSURL *)url error:(NSError * _Nullable __autoreleasing *)error
{
    Artist *testArtist = [[Artist alloc] initWithArtistName:@"Test" yearFounded:1999 artistBio:@"This is a test artist"];
    Artist *anotherArtist = [[Artist alloc] initWithArtistName:@"Test 2" yearFounded:1989 artistBio:@"This is a another test artist"];
    NSDictionary *dictionary = [[NSDictionary alloc] initWithObjectsAndKeys:testArtist, testArtist.artistName, anotherArtist, anotherArtist.artistName, nil];
    
    [dictionary writeToURL:url error:error];
    self.artistDictionary = dictionary;
    [self.tableView reloadData];
    NSLog(@"%@", self.artistDictionary);
    
    return YES;
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
    return self.artistDictionary.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ArtistCell" forIndexPath:indexPath];
    
    
    
    self.artistFetcher.allArtists = [[NSMutableArray alloc] initWithArray:self.artistDictionary.allValues];
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
