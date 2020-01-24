//
//  SKSArtistSearchViewController.h
//  unit4-sprintchallenge2-ss
//
//  Created by Lambda_School_Loaner_204 on 1/24/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SKSArtistController, SKSArtist;

@interface SKSArtistSearchViewController : UIViewController <UISearchBarDelegate>

@property (nonatomic) SKSArtistController *artistController;
@property (nonatomic) SKSArtist *artist;

@end

