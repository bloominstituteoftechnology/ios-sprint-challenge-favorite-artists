//
//  ArtistTableViewCell.m
//  FavoriteArtists
//
//  Created by Joel Groomer on 2/8/20.
//  Copyright © 2020 Julltron. All rights reserved.
//

#import "ArtistTableViewCell.h"
#import "Artist.h"
#import "ArtistController.h"

@implementation ArtistTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    [self updateViews];
}

//- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
//    [super setSelected:selected animated:animated];
//
//    // Configure the view for the selected state
//}

- (void)updateViews
{
    if (self.artist) {
        self.textLabel.text = self.artist.name;
        self.detailTextLabel.text = [NSString stringWithFormat:(@"Formed in %d"), self.artist.yearFormed ];
    }
}

#pragma mark - Accessors

- (void)setArtist:(Artist *)artist
{
    [self updateViews];
}

@end
