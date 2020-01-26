//
//  AddArtistViewController.m
//  FavoriteAritists
//
//  Created by brian vilchez on 1/24/20.
//  Copyright © 2020 brian vilchez. All rights reserved.
//

#import "AddArtistViewController.h"
#import <UIKit/UIKit.h>
#import "ArtistController.h"
@interface AddArtistViewController ()

@end

@implementation AddArtistViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configureViews];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self configureViews];
}

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        _artist = [[Artist alloc] init];
        _artistController = [[ArtistController alloc] init];
        _bandNameLabel = [[UILabel alloc] init];
    }
    return self;
}

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        _artist = [[Artist alloc] init];
        _artistController = [[ArtistController alloc] init];
        _bandNameLabel = [[UILabel alloc] init];
    }
    return self;
}


- (IBAction)saveArtistButton:(UIBarButtonItem *)sender {
    NSString *name = _bandNameLabel.text;
    NSString *biography = _biographyLabel.text;
    int yearFormed = [_yearFormedLabel.text intValue];
    [[self artistController]createArtistWithName:name yearFormed:yearFormed biography:biography];
    [[self navigationController] popToRootViewControllerAnimated:true];
}

- (void)updateViews {
    if (_artist) {
        self.bandNameLabel.text = _artist.artistName;
        self.biographyLabel.text = _artist.biography;
        self.yearFormedLabel.text = [NSString stringWithFormat:@"%i", _artist.yearFormed];
    }
}

- (void)configureViews {
    self.bandNameLabel.text = @"";
    self.biographyLabel.text = @"";
    self.yearFormedLabel.text = @"";
    self.searchbarLabel.delegate = self;
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    NSString *name = searchBar.text;
    if (![name  isEqual: @""]) {
        [[self artistController] fetchArtistWithName:name.lowercaseString completion:^(NSError * _Nonnull error, Artist * _Nonnull artist) {
            if (error) {
                dispatch_async(dispatch_get_main_queue(), ^{
                UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"error" message:@"😱couldnt find the artist you were looking for😭" preferredStyle: UIAlertControllerStyleAlert];
                UIAlertAction *action = [UIAlertAction actionWithTitle:@"ok" style: UIAlertActionStyleDefault handler:nil];
                [alert addAction:action];
                    [self presentViewController:alert animated:true completion:nil];
                });
            } else if (artist) {
                dispatch_async(dispatch_get_main_queue(), ^{
                    self.artist = artist;
                    [self updateViews];
                    });
            }
        }];
    } else {
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"error" message:@"please enter an artist😭" preferredStyle: UIAlertControllerStyleAlert];
        UIAlertAction *action = [UIAlertAction actionWithTitle:@"ok" style: UIAlertActionStyleDefault handler:nil];
        [alert addAction:action];
        [self presentViewController:alert animated:true completion:nil];
    }
}

@end
