//
//  TLCDetailViewController.m
//  FavoriteArtistsSprint
//
//  Created by Lambda_School_Loaner_219 on 2/23/20.
//  Copyright © 2020 Lambda_School_Loaner_219. All rights reserved.
//

#import "TLCDetailViewController.h"
#import "TLCArtist.h"

@interface TLCDetailViewController ()

@property (weak, nonatomic) IBOutlet UITextView *artistBioTextView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *yearFormedLabel;

-(void) updateViews;

@end

@implementation TLCDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self updateViews];
}

-(void)updateViews {
    if (self.artist) {
        self.nameLabel.text = self.artist.name;
        self.artistBioTextView.text = self.artist.artistBio;
        self.yearFormedLabel.text = [NSString stringWithFormat:@"Formed in: %@", [self.artist yearFormedString]]; }
    
    else (NSLog(@"No Artist Present: %@") ,self.artist);
        
    }


        
    




@end
