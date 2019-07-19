//
//  JDFArtistDetailViewController.m
//  Favorite Artists
//
//  Created by Jonathan Ferrer on 7/19/19.
//  Copyright © 2019 Jonathan Ferrer. All rights reserved.
//

#import "JDFArtistDetailViewController.h"
#import "NSJSONSerialization+JDFArtistFetcher.h"

@interface JDFArtistDetailViewController ()

@property (weak, nonatomic) IBOutlet UITextView *biographyTextView;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *saveButton;
@property (weak, nonatomic) IBOutlet UILabel *artistLabel;
@property (weak, nonatomic) IBOutlet UILabel *formedYearLabel;
@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;

- (void)saveToPersistentStore;
- (void)updateViews;

@end

@implementation JDFArtistDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [[self searchBar] setDelegate: self];
    [self updateViews];
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    [NSJSONSerialization fetchArtist:searchBar.text completion:^(NSDictionary * _Nullable dictionary, NSError * _Nullable error) {
        if (error) {
            NSLog(@"Error: %@", error);
            return;
        }

        if (dictionary) {

            JDFArtist *artist = [[JDFArtist alloc] initWithDictionary:dictionary];
            self.artist = artist;

            dispatch_async(dispatch_get_main_queue(), ^{
                [self updateViews];
            });
        }
    }];
}

- (void)updateViews {
    if ([self artist]) {

        [[self artistLabel] setText: self.artist.name];
        [[self navigationItem] setTitle: self.artist.name];

        NSNumber *year = [NSNumber numberWithInteger: self.artist.yearFormed];
        [[self formedYearLabel] setText: year.stringValue];
        [[self biographyTextView] setText: self.artist.biography];

    } else {
        [[self artistLabel] setText: @""];
        [[self formedYearLabel] setText: @""];
        [[self biographyTextView] setText: @""];
        [[self navigationItem] setTitle:@"Add New Artist"];
    }
}

- (void)saveToPersistentStore {
    NSDictionary *artistDictionary = [[self artist] dictionaryRep];
    NSMutableArray *arrayOfDictionaries;

    if ([self artists]) {
        arrayOfDictionaries = [[NSMutableArray alloc] init];
        for (JDFArtist *artist in self.artists) {
            NSDictionary *artistDictionary = [artist dictionaryRep];
            [arrayOfDictionaries addObject:artistDictionary];
        }
        [arrayOfDictionaries addObject:artistDictionary];
    } else {
        arrayOfDictionaries = [[NSMutableArray alloc] initWithObjects:artistDictionary, nil];
    }

    NSArray *artistsArray = [[NSArray alloc] initWithArray:arrayOfDictionaries];
    NSDictionary *artistsDictionary = [[NSDictionary alloc] initWithObjectsAndKeys:artistsArray, @"artists", nil];
    NSError *jsonError;
    NSData *artistsData = [NSJSONSerialization dataWithJSONObject:artistsDictionary options:0 error:&jsonError];
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSURL *docsDirectory =  [fileManager URLForDirectory:NSDocumentDirectory inDomain:NSUserDomainMask appropriateForURL:nil create:NO error:nil];
    NSURL *path = [[docsDirectory URLByAppendingPathComponent:@"artists"] URLByAppendingPathExtension:@"json"];
    [artistsData writeToURL:path atomically:YES];
}


- (IBAction)saveButtonPressed:(UIBarButtonItem *)sender {

    [self saveToPersistentStore];

    [[self navigationController] popToRootViewControllerAnimated:YES];
}

@end
