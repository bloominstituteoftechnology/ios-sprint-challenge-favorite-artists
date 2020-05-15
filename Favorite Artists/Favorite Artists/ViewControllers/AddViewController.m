//
//  AddViewController.m
//  Favorite Artists
//
//  Created by Mark Gerrior on 5/15/20.
//  Copyright © 2020 Mark Gerrior. All rights reserved.
//

#import "AddViewController.h"
#import "MTGArtist.h"
#import "MTGArtistFetcher.h"

@interface AddViewController () {
    MTGArtist *artist;
}

@property (nonatomic) MTGArtistFetcher *fetcher;

// MARK: - Outlets

@property (strong, nonatomic) IBOutlet UILabel *artistLabel;
@property (strong, nonatomic) IBOutlet UILabel *yearLabel;
@property (strong, nonatomic) IBOutlet UITextView *biographyTextView;

@end

@implementation AddViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self updateViews];

    [self.fetcher fetchArtistByName:@"Macklemore" completionBlock:^(MTGArtist * _Nullable artist, NSError * _Nullable error) {
        if (error) {
            NSLog(@"Artist Fetching Error: %@", error);
            return;
        }

        NSLog(@"Arstist: %@", artist);
    }];
}

- (void)updateViews {

    if (artist == nil) {
        self.artistLabel.text = @"";
        _yearLabel.text = @"";
        _biographyTextView.text = @"";
    }
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


// Properties

// Lazy property
- (MTGArtistFetcher *)fetcher {
    if (!_fetcher) {
        _fetcher = [[MTGArtistFetcher alloc] init];
    }
    return _fetcher;
}

@end
