//
//  ArtistDetailViewController.m
//  FavoriteArtists
//
//  Created by Cody Morley on 7/17/20.
//  Copyright © 2020 Cody Morley. All rights reserved.
//

#import "ArtistDetailViewController.h"
#import "CAMArtist.h"

@interface ArtistDetailViewController ()
//MARK: - Internal Properties -
/// Outlets
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *foundedLabel;
@property (weak, nonatomic) IBOutlet UITextView *bioTextView;
@end


@implementation ArtistDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self updateViews];
    
}


//MARK: - Methods -
-(void)updateViews
{
    if (self.artist) {
        NSString *founded = [NSString stringWithFormat: @"%i", self.artist.founded];
        self.nameLabel.text = self.artist.name;
        self.foundedLabel.text = founded;
        self.bioTextView.text = self.artist.bio;
    } else {
        self.nameLabel.text = @"Error fetching artist, please try again.";
        self.foundedLabel.text = @"";
        self.bioTextView.text = @"";
    }
}

@end
