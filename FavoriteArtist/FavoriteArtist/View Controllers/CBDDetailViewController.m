//
//  CBDDetailViewController.m
//  FavoriteArtist
//
//  Created by Christopher Devito on 5/15/20.
//  Copyright © 2020 Christopher Devito. All rights reserved.
//

#import "CBDDetailViewController.h"

@interface CBDDetailViewController ()

// MARK: - Private Properties


// MARK: - IBOutlets
@property (strong, nonatomic) IBOutlet UISearchBar *favoriteArtistSearchBar;
@property (strong, nonatomic) IBOutlet UILabel *artistNameLabel;
@property (strong, nonatomic) IBOutlet UITextView *artistDetailsTextView;

@end

@implementation CBDDetailViewController

// MARK: - View Methods
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)updateViews {
    
}

@end
