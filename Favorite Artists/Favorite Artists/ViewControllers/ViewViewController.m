//
//  ViewViewController.m
//  Favorite Artists
//
//  Created by Mark Gerrior on 5/15/20.
//  Copyright © 2020 Mark Gerrior. All rights reserved.
//

#import "ViewViewController.h"
#import "MTGArtist.h"

@interface ViewViewController ()

@property (strong, nonatomic) IBOutlet UILabel *artistLabel;
@property (strong, nonatomic) IBOutlet UILabel *yearLabel;
@property (strong, nonatomic) IBOutlet UITextView *biographyTextView;

@end

@implementation ViewViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self updateViews];
}

- (void)updateViews {

    if (_artist == nil) {
        _artistLabel.text = @"";
        _yearLabel.text = @"";
        _biographyTextView.text = @"";
    } else {
        self.title = _artist.artist;
        
        _artistLabel.text = _artist.artist;
        if (_artist.formedYear == -1) {
            _yearLabel.text = @"Formed: N/A";
        } else {
            _yearLabel.text = [NSString stringWithFormat:@"Formed in %0d", _artist.formedYear];
        }
        _biographyTextView.text = _artist.biography;
    }
}


@end
