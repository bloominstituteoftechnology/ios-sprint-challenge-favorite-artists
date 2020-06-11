//
//  ViewController.m
//  FavoriteArtists_OBJC
//
//  Created by Alex Shillingford on 2/21/20.
//  Copyright © 2020 shillwil. All rights reserved.
//

#import "ViewController.h"
#import "WASArtistController.h"
#import "WASArtist.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;
@property (weak, nonatomic) IBOutlet UILabel *artistLabel;
@property (weak, nonatomic) IBOutlet UILabel *formedLabel;
@property (weak, nonatomic) IBOutlet UITextView *textView;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


@end
