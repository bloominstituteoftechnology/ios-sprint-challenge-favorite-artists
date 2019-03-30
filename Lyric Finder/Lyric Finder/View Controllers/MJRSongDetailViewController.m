//
//  MJRSongDetailViewController.m
//  Lyric Finder
//
//  Created by Moses Robinson on 3/29/19.
//  Copyright © 2019 Moses Robinson. All rights reserved.
//

#import "MJRSongDetailViewController.h"
#import "MJRSongController.h"
#import "MJRSong.h"

@interface MJRSongDetailViewController ()

@property (strong, nonatomic) IBOutlet UILabel *ratingLabel;
@property (strong, nonatomic) IBOutlet UIStepper *ratingStepper;
@property (strong, nonatomic) IBOutlet UITextField *titleTextField;
@property (strong, nonatomic) IBOutlet UITextField *artistTextField;
@property (strong, nonatomic) IBOutlet UIButton *searchButton;
@property (strong, nonatomic) IBOutlet UITextView *lyricsTextView;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *saveButton;


@end

@implementation MJRSongDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
}



@end
