//
//  ArtistDetailViewController.m
//  FavoriteArtists
//
//  Created by Cody Morley on 7/17/20.
//  Copyright © 2020 Cody Morley. All rights reserved.
//

#import "ArtistDetailViewController.h"

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
    // Do any additional setup after loading the view.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
