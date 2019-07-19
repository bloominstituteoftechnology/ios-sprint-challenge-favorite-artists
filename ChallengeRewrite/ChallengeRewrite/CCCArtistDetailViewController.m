//
//  CCCArtistDetailViewController.m
//  ChallengeRewrite
//
//  Created by Ryan Murphy on 7/19/19.
//  Copyright © 2019 Ryan Murphy. All rights reserved.
//

#import "CCCArtistDetailViewController.h"
#import "NSJSONSerialization+CCCNSJSONSerialization_Dictionary.h"

@interface CCCArtistDetailViewController ()

@property (weak, nonatomic) IBOutlet UILabel *formedLabel;
@property (weak, nonatomic) IBOutlet UITextView *bioTextView;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *saveButton;

@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;
@property (weak, nonatomic) IBOutlet UILabel *artistLabel;

@end

@implementation CCCArtistDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [[self searchBar] setDelegate: self];
    
    
    if ([self artist]) {
        self.saveButton.enabled = false;
    } else {
        self.saveButton.enabled = true;
    }
    
    
    [self updateViews];
}

- (void)updateViews {
    if ([self artist]) {
        NSNumber *yearFormed = [NSNumber numberWithInteger: self.artist.yearFormed];
        [[self artistLabel] setText: self.artist.name];
        
        [[self bioTextView] setText: self.artist.biography];
        [[self formedLabel] setText: yearFormed.stringValue];
        [[self navigationItem] setTitle: self.artist.name];
        
    } else {
       
        [[self navigationItem] setTitle:@"Add Artist"];
        
    }
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    [NSJSONSerialization ccc_fetchArtist:searchBar.text completion:^(NSDictionary * _Nullable dictionary, NSError * _Nullable error) {
        if (error) {
            NSLog(@"Error: %@", error);
            return;
        }
        
        if (dictionary) {
            
            CCCArtist *artist = [[CCCArtist alloc] initWithDictionary:dictionary];
            self.artist = artist;
            
            dispatch_async(dispatch_get_main_queue(), ^{
                [self updateViews];
            });
        }
    }];
}
- (IBAction)saveButtonPressed:(id)sender {
    NSDictionary *artistDict = [[self artist] dictionaryRep];
    NSMutableArray *arrayOfDicts;
    
    if ([self artists]) {
        arrayOfDicts = [[NSMutableArray alloc] init];
        for (CCCArtist *_artist in self.artists) {
            NSDictionary *artistDictionary = [_artist dictionaryRep];
            [arrayOfDicts addObject:artistDictionary];
        }
        [arrayOfDicts addObject:artistDict];
    } else {
        arrayOfDicts = [[NSMutableArray alloc] initWithObjects:artistDict, nil];
    }
    
    NSArray *artistsArray = [[NSArray alloc] initWithArray:arrayOfDicts];
    
    NSDictionary *artistsDict = [[NSDictionary alloc] initWithObjectsAndKeys:artistsArray, @"artists", nil];
    
    NSError *jsonError;
    
    NSData *artistsData = [NSJSONSerialization dataWithJSONObject:artistsDict options:0 error:&jsonError];
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    NSURL *docsDirectory =  [fileManager URLForDirectory:NSDocumentDirectory inDomain:NSUserDomainMask appropriateForURL:nil create:NO error:nil];
    
    NSURL *path = [[docsDirectory URLByAppendingPathComponent:@"artists"] URLByAppendingPathExtension:@"json"];
    
    [artistsData writeToURL:path atomically:YES];
    
    [[self navigationController] popToRootViewControllerAnimated:YES];
}


@end
