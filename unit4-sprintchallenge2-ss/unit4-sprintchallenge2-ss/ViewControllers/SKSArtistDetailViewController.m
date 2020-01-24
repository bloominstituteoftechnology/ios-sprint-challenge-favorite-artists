//
//  SKSArtistDetailViewController.m
//  unit4-sprintchallenge2-ss
//
//  Created by Lambda_School_Loaner_204 on 1/24/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

#import "SKSArtistDetailViewController.h"
#import "SKSArtist.h"

@interface SKSArtistDetailViewController ()

@property (weak, nonatomic) IBOutlet UILabel *formedYearLabel;
@property (weak, nonatomic) IBOutlet UITextView *biographyTextView;

- (void)updateViews;

@end

@implementation SKSArtistDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self updateViews];
}

- (void)updateViews {
    if (self.artist) {
        self.title = self.artist.name;
        self.formedYearLabel.text = [self.artist formedYearString];
        self.biographyTextView.text = self.artist.biography;
    }
}

@end
