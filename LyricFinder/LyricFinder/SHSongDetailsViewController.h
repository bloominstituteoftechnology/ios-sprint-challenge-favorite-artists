//
//  SHSongDetailsViewController.h
//  LyricFinder
//
//  Created by Sean Hendrix on 3/1/19.
//  Copyright © 2019 Sean Hendrix. All rights reserved.
//

#import <UIKit/UIKit.h>
@class SHSongController;
@class SHSong;

NS_ASSUME_NONNULL_BEGIN

@interface SHSongDetailsViewController : UIViewController

@property SHSongController *songController;
@property SHSong *song;

-(void) updateViews;

@property (weak, nonatomic) IBOutlet UILabel *ratingLabel;
@property (weak, nonatomic) IBOutlet UITextField *songTitleTextField;
@property (weak, nonatomic) IBOutlet UITextField *artistTextField;
@property (weak, nonatomic) IBOutlet UITextView *songLyricsTextView;
@property (weak, nonatomic) IBOutlet UIStepper *stepper;

- (IBAction)stepper:(UIStepper *)sender;
- (IBAction)searchForLyrics:(id)sender;
- (IBAction)saveSong:(id)sender;

@end

NS_ASSUME_NONNULL_END
