//
//  LSISearchArtistsViewController.m
//  Favorite_Artistis
//
//  Created by Joe on 5/30/20.
//  Copyright © 2020 AlphaGradeINC. All rights reserved.
//

#import "LSISearchArtistsViewController.h"
#import "LSIArtist.h"

@interface LSISearchArtistsViewController ()

@end

@implementation LSISearchArtistsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
        LSIArtist *artist = [LSIArtist new];
        artist.artistName = @"Smashing Pumpkins";
        NSLog(@"%@", artist);
}

- (IBAction)artistSaveButtonTapped:(id)sender
{

}


@end
