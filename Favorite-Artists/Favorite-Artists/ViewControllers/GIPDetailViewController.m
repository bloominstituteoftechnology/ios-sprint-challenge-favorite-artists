//
//  GIPDetailViewController.m
//  Favorite-Artists
//
//  Created by Gi Pyo Kim on 12/13/19.
//  Copyright © 2019 GIPGIP Studio. All rights reserved.
//

#import "GIPDetailViewController.h"
#import "GIPArtist.h"

@interface GIPDetailViewController ()

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *yearLabel;
@property (weak, nonatomic) IBOutlet UITextView *biographyLabel;


- (void)updateViews;

@end

@implementation GIPDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self updateViews];
}

- (void)updateViews {
    
    dispatch_async(dispatch_get_main_queue(), ^{
        if (self.artist != Nil) {
            self.nameLabel.text = self.artist.name;
            self.yearLabel.text = [NSString stringWithFormat:@"Formed in %d", self.artist.yearFormed];
            self.biographyLabel.text = self.artist.biography;
        } else {
            self.nameLabel.text = @"";
            self.yearLabel.text = @"";
            self.biographyLabel.text = @"";
        }
    });
}

@end
