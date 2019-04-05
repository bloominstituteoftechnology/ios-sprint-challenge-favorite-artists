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
        [[self saveButton] setAccessibilityElementsHidden:YES];
    } else {
        [[self searchBar] setHidden:NO];
        [[self saveButton] setAccessibilityElementsHidden:NO];
    }
    [self updateViews];
}

- (void)updateViews {
    NYCArtist *artist = [self artist];
    
    if (artist) {
        [[self artistNameLabel] setText: artist.name];
        NSNumber *yearFormed = [NSNumber numberWithInteger: artist.yearFormed];
        
        [[self yearFormedLabel] setText: yearFormed.stringValue];
        [[self artistBiographyTextView] setText: artist.biography];
    } else {
        [[self artistNameLabel] setText: @""];
        [[self yearFormedLabel] setText: @""];
        [[self artistBiographyTextView] setText: @""];
    }
}

- (void)searchBarTextDidEndEditing:(UISearchBar *)searchBar {
    NSJSONSerialization *jsonSerialization = [[NSJSONSerialization alloc] init];
    [jsonSerialization nyc_fetchArtist:searchBar.text completion:^(NSDictionary * _Nullable dictionary, NSError * _Nullable error) {
        if (error) {
            NSLog(@"Error fetching artist: %@", error);
            return;
        }
        
        if (dictionary) {
            
            NYCArtist *artist = [[NYCArtist alloc] initWithDictionary:dictionary];
            self.artist = artist;
            
            [self.artists addObject:artist];
            
            dispatch_async(dispatch_get_main_queue(), ^{
                [self updateViews];
            });
        }
    }];
}

- (IBAction)saveButtonTapped:(UIBarButtonItem *)sender {
    
    NSURL *docsDirectory =  [[NSFileManager defaultManager] URLForDirectory:NSDocumentDirectory inDomain:NSUserDomainMask appropriateForURL:nil create:NO error:nil];
    
    NSURL *path = [docsDirectory URLByAppendingPathComponent:@"artists.plist"];
    
    if ([self artist]) {
        [NSKeyedArchiver archiveRootObject:self.artists toFile:path.absoluteString];
    }
}

@end
