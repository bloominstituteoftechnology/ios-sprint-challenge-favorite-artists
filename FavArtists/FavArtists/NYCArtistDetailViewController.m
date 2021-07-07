//
//  NYCArtistDetailViewController.m
//  FavArtists
//
//  Created by Nathanael Youngren on 4/5/19.
//  Copyright © 2019 Nathanael Youngren. All rights reserved.
//

#import "NYCArtistDetailViewController.h"
#import "NSJSONSerialization+NYCNSJSONSerialization_Dictionary.h"

@interface NYCArtistDetailViewController ()

- (IBAction)saveButtonTapped:(UIBarButtonItem *)sender;

@property (weak, nonatomic) IBOutlet UIBarButtonItem *saveButton;
@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;
@property (weak, nonatomic) IBOutlet UILabel *artistNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *yearFormedLabel;
@property (weak, nonatomic) IBOutlet UITextView *artistBiographyTextView;

@end

@implementation NYCArtistDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [[self searchBar] setDelegate: self];
    if ([self artist]) {
        [[self searchBar] setHidden:YES];
        self.saveButton.enabled = false;
        self.saveButton.title = @"";
    } else {
        [[self searchBar] setHidden:NO];
        [[self saveButton] setAccessibilityElementsHidden:NO];
        self.saveButton.enabled = true;
        self.saveButton.title = @"Save";
    }
    [self updateViews];
}

- (void)updateViews {
    if ([self artist]) {
        [[self artistNameLabel] setText: self.artist.name];
        NSNumber *yearFormed = [NSNumber numberWithInteger: self.artist.yearFormed];
        
        [[self yearFormedLabel] setText: yearFormed.stringValue];
        [[self artistBiographyTextView] setText: self.artist.biography];
        
        [[self navigationItem] setTitle: self.artist.name];
    } else {
        [[self artistNameLabel] setText: @""];
        [[self yearFormedLabel] setText: @""];
        [[self artistBiographyTextView] setText: @""];
        [[self navigationItem] setTitle:@"Add New Artist"];
    }
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    [NSJSONSerialization nyc_fetchArtist:searchBar.text completion:^(NSDictionary * _Nullable dictionary, NSError * _Nullable error) {
        if (error) {
            NSLog(@"Error fetching artist: %@", error);
            return;
        }
        
        if (dictionary) {
            
            NYCArtist *artist = [[NYCArtist alloc] initWithDictionary:dictionary];
            self.artist = artist;
            
            dispatch_async(dispatch_get_main_queue(), ^{
                [self updateViews];
            });
        }
    }];
}

- (IBAction)saveButtonTapped:(UIBarButtonItem *)sender {
    
    NSDictionary *artistDict = [[self artist] dictionaryRepresentation];
    NSMutableArray *arrayOfDicts;
    
    if ([self artists]) {
        arrayOfDicts = [[NSMutableArray alloc] init];
        for (NYCArtist *artist in self.artists) {
            NSDictionary *artistDictionary = [artist dictionaryRepresentation];
            [arrayOfDicts addObject:artistDictionary];
        }
        [arrayOfDicts addObject:artistDict];
    } else {
        arrayOfDicts = [[NSMutableArray alloc] initWithObjects:artistDict, nil];
    }
    
    NSArray *artistsArray = [[NSArray alloc] initWithArray:arrayOfDicts];
    
    NSDictionary *artistsDictionary = [[NSDictionary alloc] initWithObjectsAndKeys:artistsArray, @"artists", nil];
    
    NSError *jsonError;
    
    NSData *artistsData = [NSJSONSerialization dataWithJSONObject:artistsDictionary options:0 error:&jsonError];
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    NSURL *docsDirectory =  [fileManager URLForDirectory:NSDocumentDirectory inDomain:NSUserDomainMask appropriateForURL:nil create:NO error:nil];
    
    NSURL *path = [[docsDirectory URLByAppendingPathComponent:@"artists"] URLByAppendingPathExtension:@"json"];

    [artistsData writeToURL:path atomically:YES];
    
    [[self navigationController] popToRootViewControllerAnimated:YES];
}

@end
